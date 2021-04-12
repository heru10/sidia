<script src="bower_components/multiupload/js/jquery.uploadfile.min.js"></script>

<script type="text/javascript">
$(function () {
   if($("#task").val()=="edit"){

      getload_ut();
    }

  });

function fileExists(url) {
  var filex = $("#path").val()+"/"+ url;
  var xhr = new XMLHttpRequest();
    xhr.open('HEAD', filex, false);
    xhr.send();

    if (xhr.status == "404") {
        return false;
    } else {
        return true;
    }
}


  function cek_ext(dfile){
      var g = 0;
      var extfile = ['pdf'];
       ext = dfile.split('.');

       for(f=0;f < extfile.length;f++){
         if(ext[1] == extfile[f])
           g++;
       }

       if(g==0){
           toastr.error("Jenis extension file "+ dfile +" tidak ijinkan", "Kesalahan");
           $("#txtfut").val('');
       }
       return g;
  }

  function getupload(name){
  var files = document.getElementById("txtf"+name).files;
  var no = $("#jmlfile_"+name).val();

  if(no==0)
    no=1;

  for(var i=0;i<files.length;i++){
  var filex = $("#path").val()+"/"+ files[i].name;

   if(fileExists(files[i].name)){
      toastr.error("File "+ files[i].name +" ditemukan nama yang sama !!", "Kesalahan");
      $("#txtfut").val('');
      $("#x"+name).html('');
      return false;
   }
   if(cek_ext(files[i].name)==0){
      $("#txtfut").val('');
      $("#x"+name).html('');
      return false;
   }

    totsize = files[i].size;

    if(totsize > 100000000) {
        toastr.error('Total Ukuran File melebihi 100 MB!','KESALAHAN');
        $("#txtf"+name).val('');
        $("#x"+name).html('');
        return false;
    }

  }



  if($("#task").val()=="edit" && $("#jmlfile_ut").val() > 0){
    var tanya = confirm("Apakah File Upload dokumen ini diganti ? ");
    if(!tanya){
      $("#txtf"+name).val('');
      $("#x"+name).html('');
      getload_ut();
      return false;
    }else{
      $("#fut").html('');
    }

  }

   totsize = 0;
   if($("#task").val()!='edit'){
    $("#f"+name).html('');
    for (var i = 0; i < files.length; i++){
      $("#f"+name).append("<tr><td width=2%>"+no+".</td><td>"+files[i].name+"</td><td>"+humanFileSize(files[i].size,true)+"</tr></tr>");
      totsize = totsize + parseInt(files[i].size);
      no++;
     }
     $("#f"+name).append("<tr><td colspan='2' align='right' ><b>Total File Upload</b></td><td><b>"+humanFileSize(totsize,true)+"</b></td></tr>");
   } else {
     $("#x"+name).html('');
        kp = "Baru";
        if(name=="data")
         kp = "Ganti";

     for (var i = 0; i < files.length; i++){
      $("#x"+name).append("<tr class='bg-blue'><td width=2%>"+no+".</td><td>"+files[i].name+"</td><td><span class='label label-info'>"+kp+"</span></td></tr>");
      no++;
     }
   }

  }

  $(function(e){
   $("#mymetadata").on('submit',(function(e) {
        e.preventDefault();
       var urls = "<?php echo 'page/pageregdetailvitalproof/uraian/uraian_proses.php'; ?>";
       $("#btnsave").attr("disabled","disabled");
       $.ajax({
        url: urls, // Url to which the request is send
        type: "POST",             // Type of request to be send, called as method
        data: new FormData(this), // Data sent to server, a set of key/value pairs (i.e. form fields and values)
        contentType: false,       // The content type used when sending data to the server.
        cache: false,             // To unable request pages to be cached
        processData:false,        // To send DOMDocument or non processed data file it is set to false
        success: function(data)   // A function to be called if request succeeds
        {
          //alert(data);
          switch(data){
            case "sukses" : toastr.success("Data Berhasil disimpan", "BERHASIL");
                            break;
            case "error"  : toastr.error("Terjadi kesalahan database", "KESALAHAN");
                            break;
            case "found"  : toastr.warning("Ada data dengan nama yang sama", "PERHATIAN");
                            break;
          }
          //$("#close").click();
          var ids = $("#ids").val();
          pageurl("page/pageregdetailvitalproof/regdetailvitalproof.php?ids="+ids);
        }
       });
   }));
});

function getload_ut(){
  var id = $("#id").val();
  var ids = $("#ids").val();

    $.ajax({
        url: "page/pageregdetailvitalproof/uraian/uraian_proses.php", // Url to which the request is send
        type: "POST",
        data: "task=load&ids="+ids,
        async: true,
				beforeSend: function(x) {
					if(x && x.overrideMimeType) {
      					 x.overrideMimeType("application/j-son;charset=UTF-8");
      				}
				},
		dataType : 'json',
        success: function(data){
          
          ArryFile = data.items.length;

          $("#jmlfile_ut").val(ArryFile);
          no=1;

           $("#fut").html("");
           filex = data.items[0].Filename;
           filex = filex.split("/");
           $("#fut").append("<tr><td width=2%>"+no+".</td><td>"+filex[3]+"</td><td width=5%><button type='button' onclick=delfiles('"+data.items[0].DetVFileId+"'); title='Hapus File' class='btn btn-danger btn-sm' id='btndelfile'><i class='fa fa-bitbucket' ></i></button></td></tr>");

          folder = filex[0]+"/"+filex[1]+"/"+filex[2];
          $("#id").val(data.items['meta'][0].DetailVitalId);
          $("#ids").val(data.items['meta'][0].RegVitalId);
          $("#path").val(folder);
          $("#task").val('edit');

        }
    })

    $.ajax({
        url: "page/pageregdetailvitalproof/uraian/uraian_proses.php", // Url to which the request is send
        type: "POST",
        data: "task=loadmeta&ids="+ids,
        async: true,
				beforeSend: function(x) {
					if(x && x.overrideMimeType) {
      					 x.overrideMimeType("application/j-son;charset=UTF-8");
      				}
				},
		dataType : 'json',
        success: function(data){
          ArryMeta = data.items.length;

          $("#txt1").val(data.items[0].Gedung);
          $("#txt2").val(data.items[0].Lemari);
          $("#txt3").val(data.items[0].Baris);
          $("#txt4").val(data.items[0].Boks);


        }
    })
}

function closed(){
  var ids=$("#ids").val();
  pageurl('page/pageregdetailvitalproof/regdetailvitalproof.php?ids='+ids);
}

function delfiles(id){

   var tanya = confirm("Apakah File Upload dokumen ini dihapus ? ");
   if(tanya) {
    $.ajax({
        url: "page/pageregdetailvitalproof/uraian/uraian_proses.php", // Url to which the request is send
        type: "POST",
        data: "task=delfile&id="+id,
        success: function(msg){
            getload_ut();
        }
       });
   }
  }

  function deldata(){
   var id = $("#ids").val();
    var tanya = confirm("Apakah Dokumen ini mau dihapus ?");
    if(tanya){
     var urls = "<?php echo 'page/pageregdetailvitalproof/uraian/uraian_proses.php'; ?>";
     $.ajax({
        url: urls, // Url to which the request is send
        type: "POST",
        data: "task=del&id="+id,
        async: true,
        success: function(data){
        var dat = data.split('#');
        switch(dat[0]){
            case "sukses" : toastr.success("Data Berhasil dihapus", "BERHASIL");
                            break;
            case "error"  : toastr.error("Terjadi kesalahan database", "KESALAHAN");
                            break;
            case "found"  : toastr.warning("Ada Unit Kerja dibawahnya", "PERHATIAN");
                            break;
          }
        pageurl("page/pageregdetailvital_proof/regdetailvital.php?ids="+dat[1]);
        }
     })
    } else toastr.warning("Proses dibatalkan", "PEMBATALAN");
   }


function humanFileSize(bytes, si) {
    var thresh = si ? 1000 : 1024;
    if(Math.abs(bytes) < thresh) {
        return bytes + ' B';
    }
    var units = si
        ? ['KB','MB','GB','TB','PB','EB','ZB','YB']
        : ['KiB','MiB','GiB','TiB','PiB','EiB','ZiB','YiB'];
    var u = -1;
    do {
        bytes /= thresh;
        ++u;
    } while(Math.abs(bytes) >= thresh && u < units.length - 1);
    return bytes.toFixed(1)+' '+units[u];
}

</script>