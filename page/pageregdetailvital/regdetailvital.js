<link rel="stylesheet" href="bower_components/datatables/jquery.dataTables.css">
<link rel="stylesheet" href="bower_components/bxslider/jquery.bxslider.css">
<script src="bower_components/multiupload/js/jquery.uploadfile.min.js"></script>
<script src="bower_components/bxslider/jquery.bxslider.js"></script>
<script type="text/javascript">
$(function () {
    $("#forminput").hide();
    $("#formtable").show();
    $("#lblstatus").html("Status : Tambah Registrasi Metadata Dokumen");
    $("#task").val("new");
    $("#id").val("0");
    $("#SFile").hide();
    getloadfront();

    $('.bxslider').bxSlider({
	   mode: 'fade',
	   moveSlides: 1,
	   slideMargin: 40,
	   infiniteLoop: true,
	   slideWidth: 660,
       adaptiveHeight: true,
	   minSlides: 1,
	   maxSlides: 1,
	   speed: 600,
	});

  });


function clear_uploadSP(){
 if($("#task").val() != "edit"){
  $("#filebox").hide();
  $("#olfiles").html('');
  $("#myfiles").val('');
 }else{
   $("#myfiles").val('');
   $("#olf").html('');
 }
}
function clear_uploadST(){
 if($("#task").val() != "edit"){
  $("#fileboxST").hide();
  $("#olfilesST").html('');
  $("#myfilesB").val('');
 }
}
function clear_uploadUT(){
 if($("#task").val() != "edit"){
  $("#fileboxUT").hide();
  $("#olfilesUT").html('');
  $("#myfilesA").val('');
 }
}
function clear_uploadPL(){
 if($("#task").val() != "edit"){
  $("#fileboxPL").hide();
  $("#olfilesPL").html('');
  $("#myfilesC").val('');
 } else {
   $("#myfilesC").val('');
   $("#olfPL").html('');
 }
}



//function vfileSP(ext){
// if(ext==""){
// $("#viewSP").hide();
// $("#atSP").show();
// }
// else{
//  ex = ext.split(".");
//  if(ex[1]=="pdf")
//  $("#viewSP").attr('type', 'application/'+ex[1]);
//  $("#viewSP").attr('src', ext);
//  $("#filename").val(ext);
//  $("#viewSP").show();
//  $("#atSP").hide();
// }
//}

function view_img(f){
   var ids = $("#ids").val();
   pageurl('page/pageregdetailvital/test_img.php?ids='+ids+'&file='+f);
}

function loadfilePL(z){
  ex = z.split(".");
  if(ex[1]=="pdf")
   $("#viewPL").attr('type', 'application/'+ex[1]);
   $("#viewPL").attr('data', z);
}

function getloadfront(){
    //var AmbilData;
    var id = $("#ids").val();
    var sp = 0;
    $("#ErrAll").hide();
    $("#pk").show();
    $("#btnadd").show();
    $("#btnedit").hide();
    $("#btndelete").hide();
    $.ajax({
        url: "page/pageregdetailvital/regdetailvital_proses.php", // Url to which the request is send
        type: "POST",
        data: "task=load&idx="+id,
        async: true,
				beforeSend: function(x) {
					if(x && x.overrideMimeType) {
      					 x.overrideMimeType("application/j-son;charset=UTF-8");
      				}
				},
		dataType : 'json',
        success: function(data){
        f = data.items.length;
        carryM = data.items['meta'].length;
        carryIMG = data.items['img'].length;
        $("#nofileSP").show();
        //$("#vsp").hide();
        for(var i=0;i<carryIMG;i++){
           if(data.items['img'][i].Ket=="SP"){
             $("#nofileSP").hide();
             $("#vsp").show();
           }

           if(data.items['img'][i].Ket=="UT"){
             $("#nofileUT").hide();
             ext = data.items['img'][i].Filename.split("/");
             ex = ext[2].split(".");
             if(ex[1]=="pdf")
             $("#viewUT").attr('type', 'application/'+ex[1]);
             $("#viewUT").attr('data', data.items['img'][i].Filename);
             $("#viewUT").show();
           }

           if(data.items['img'][i].Ket=="ST"){
             $("#nofileST").hide();
             ext = data.items['img'][i].Filename.split("/");
             ex = ext[2].split(".");
             if(ex[1]=="pdf")
             $("#viewST").attr('type', 'application/'+ex[1]);
             $("#viewST").attr('data', data.items['img'][i].Filename);
             $("#viewST").show();
           }

          $("#btnedit").show();
          $("#btndelete").show();
          $("#btnadd").hide();
         }
        }
      })
}

$(function(e){
   $("#myfrm").on('submit',(function(e) {
        e.preventDefault();
       var urls = "<?php echo 'page/pageregdetailvital/regdetailvital_proses.php'; ?>";
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
          pageurl("page/pageregdetailvital/regdetailvital.php?ids="+ids);
        }
       });
   }));
})

   function closeform(){
    $("#forminput").hide(1000);
    $("#formtable").show(1000);
   }
   function closetable(){
    $("#forminput").show(1000);
    $("#formtable").hide(1000);
   }

   function getdata(){
    closetable();
    $("#txt1").val('');
    $("#txt1").focus();
   }

   function closed(){
    var ids = $("#ids").val();
    pageurl("page/pageregdetailvital/regdetailvital.php?ids="+ids);
   }


 function deldata(){
   var id = $("#ids").val();
    var tanya = confirm("Apakah Dokumen ini mau dihapus ?");
    if(tanya){
     var urls = "<?php echo 'page/pageregdetailvital/regdetailvital_proses.php'; ?>";
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
        pageurl("page/pageregdetailvital/regdetailvital.php?ids="+dat[1]);
        }
     })
    } else toastr.warning("Proses dibatalkan", "PEMBATALAN");
   }

 function delfiles(id){
   var tanya = confirm("Apakah File Upload dokumen ini dihapus ? ");
   if(tanya) {
    $.ajax({
        url: "page/pageregdetailvital/regdetailvital_proses.php", // Url to which the request is send
        type: "POST",
        data: "task=delfile&id="+id,
        success: function(msg){
            getload();
        }
       });
   }
  }

   function loadfile(){
     var id = $("#ids").val();
     $.ajax({
        url: "page/pageregdetailvital/regdetailvital_proses.php", // Url to which the request is send
        type: "POST",
        data: "task=load&idx="+id,
        async: true,
				beforeSend: function(x) {
					if(x && x.overrideMimeType) {
      					 x.overrideMimeType("application/j-son;charset=UTF-8");
      				}
				},
		dataType : 'json',
        success: function(data){
          carryM = data.items.length;
          var no = 1;
          $("#filebox").show();
          for(var i=0;i < carry;i++){
           if(data.items[i].Ket == "SP"){
             tz = tz + parseInt(data.items[i].Size);
             $("#filebox").show();
             $("#olfiles").append("<tr class='bg-warning'><td align='right'>"+no+".</td><td>"+data.items[i].Filename+"</td><td>"+humanFileSize(data.items[i].Size,true)+"</td><td><button type='button' onclick=delfiles('"+data.items[i].DetailVitalId+"'); title='Hapus File' class='btn btn-danger btn-sm' id='btndelfile'><i class='fa fa-bitbucket' ></i></button></td></tr>");
          }
         }
        }
     })
   }

   function getload(){
    var id = $("#ids").val();

    $.ajax({
        url: "page/pageregdetailvital/regdetailvital_proses.php", // Url to which the request is send
        type: "POST",
        data: "task=load&idx="+id,
        async: true,
				beforeSend: function(x) {
					if(x && x.overrideMimeType) {
      					 x.overrideMimeType("application/j-son;charset=UTF-8");
      				}
				},
		dataType : 'json',
        success: function(data){
           $("#forminput").show(1000);
           $("#formtable").hide(1000);
           carryM = data.items['meta'].length;
           carryIMG = data.items['img'].length;
           var no = 1;
           var nopl = 1;
           var totsize = 0;
           var totsize1 = 0;
           var totsize2 = 0;
           var totsize3 = 0;
           $("#olfiles").html("");
           $("#olfilesST").html("");
           $("#olfilesUT").html("");
           $("#olfilesPL").html("");
            $("#filebox").hide();
            $("#fileboxST").hide();
            $("#fileboxUT").hide();
            $("#fileboxPL").hide();
            $("#txt1").val("");
            $("#txt2").val("");
            $("#txt3").val("");
            $("#txt4").val("");
            $("#txt5").val("");
            $("#txt6").val("");
            $("#txt7").val("");
            $("#txt8").val("");
            $("#txt9").val("");
            $("#txt10").val("");
            $("#txt11").val("");
            $("#txt12").val("");
            $("#txt13").val("");
            $("#txt14").val("");
            $("#txt15").val("");
            $("#txt16").val("");
            $("#txt17").val("");

           for(var i=0;i < carryM;i++){
             if(data.items['meta'][i].Ket == "SP"){
                $("#txt1").val(data.items['meta'][i].Gedung);
                $("#txt2").val(data.items['meta'][i].Lemari);
                $("#txt3").val(data.items['meta'][i].Baris);
                $("#txt4").val(data.items['meta'][i].Boks);
             }
             if(data.items['meta'][i].Ket == "ST"){
                $("#txt9").val(data.items['meta'][i].Gedung);
                $("#txt10").val(data.items['meta'][i].Lemari);
                $("#txt11").val(data.items['meta'][i].Baris);
                $("#txt12").val(data.items['meta'][i].Boks);
             }
             if(data.items['meta'][i].Ket == "UT"){
                $("#txt5").val(data.items['meta'][i].Gedung);
                $("#txt6").val(data.items['meta'][i].Lemari);
                $("#txt7").val(data.items['meta'][i].Baris);
                $("#txt8").val(data.items['meta'][i].Boks);
             }
             if(data.items['meta'][i].Ket == "PL"){
                $("#txt13").val(data.items['meta'][i].Keterangan);
                $("#txt14").val(data.items['meta'][i].Gedung);
                $("#txt15").val(data.items['meta'][i].Lemari);
                $("#txt16").val(data.items['meta'][i].Baris);
                $("#txt17").val(data.items['meta'][i].Boks);
             }
           }

           for(var i=0;i < carryIMG;i++){
             //totsize = 0;
             if(data.items['img'][i].Ket == "SP"){
                $("#filebox").show();
                filer = data.items['img'][i].Filename.split("/");
                totsize = totsize + parseInt(data.items['img'][i].Size);
                $("#olfiles").append("<tr class='bg-warning'><td align='right'>"+no+".</td><td>"+filer[3]+"</td><td align=right>"+humanFileSize(data.items['img'][i].Size,true)+"</td><td><button type='button' onclick=delfiles('"+data.items['img'][i].DetVFileId+"'); title='Hapus File' class='btn btn-danger btn-sm' id='btndelfile'><i class='fa fa-bitbucket' ></i></button></td></tr>");
                no++;
             }
             if(data.items['img'][i].Ket == "ST"){
                $("#fileboxST").show();
                filer = data.items['img'][i].Filename.split("/");
                totsize1 = totsize1 + parseInt(data.items['img'][i].Size);
                $("#olfilesST").append("<tr class='bg-warning'><td align='right'>1.</td><td>"+filer[3]+"</td><td align=right>"+humanFileSize(data.items['img'][i].Size,true)+"</td><td><button type='button' onclick=delfiles('"+data.items['img'][i].DetVFileId+"'); title='Hapus File' class='btn btn-danger btn-sm' id='btndelfile'><i class='fa fa-bitbucket' ></i></button></td></tr>");
             }
             if(data.items['img'][i].Ket == "UT"){
                $("#fileboxUT").show();
                filer = data.items['img'][i].Filename.split("/");
                totsize2 = totsize2 + parseInt(data.items['img'][i].Size);
                $("#olfilesUT").append("<tr class='bg-warning'><td align='right'>1.</td><td>"+filer[3]+"</td><td align=right>"+humanFileSize(data.items['img'][i].Size,true)+"</td><td><button type='button' onclick=delfiles('"+data.items['img'][i].DetVFileId+"'); title='Hapus File' class='btn btn-danger btn-sm' id='btndelfile'><i class='fa fa-bitbucket' ></i></button></td></tr>");
             }

             if(data.items['img'][i].Ket == "PL"){
                $("#fileboxPL").show();
                //$("#olfilesPL").html("");
                filer = data.items['img'][i].Filename.split("/");
                totsize3 = totsize3 + parseInt(data.items['img'][i].Size);
                $("#olfilesPL").append("<tr class='bg-warning'><td align='right'>"+nopl+"</td><td>"+filer[3]+"</td><td align=right>"+humanFileSize(data.items['img'][i].Size,true)+"</td><td><button type='button' onclick=delfiles('"+data.items['img'][i].DetVFileId+"'); title='Hapus File' class='btn btn-danger btn-sm' id='btndelfile'><i class='fa fa-bitbucket' ></i></button></td></tr>");
                nopl++;
             }
           }

         if(totsize != 0)
           $("#olfiles").append("<tr class='bg-info'><td colspan=2 align='right'><b>Total File :</b> </td><td><strong>"+humanFileSize(totsize,true)+"</strong></td><td width='10%'>&nbsp;</td></tr>");

         if(totsize1 != 0)
           $("#olfilesST").append("<tr class='bg-info'><td colspan=2 align='right'><b>Total File :</b> </td><td><strong>"+humanFileSize(totsize1,true)+"</strong></td><td width='10%'>&nbsp;</td></tr>");
         if(totsize2 != 0)
           $("#olfilesUT").append("<tr class='bg-info'><td colspan=2 align='right'><b>Total File :</b> </td><td><strong>"+humanFileSize(totsize2,true)+"</strong></td><td width='10%'>&nbsp;</td></tr>");

         if(totsize3 != 0)
           $("#olfilesPL").append("<tr class='bg-info'><td colspan=2 align='right'><b>Total File :</b> </td><td><strong>"+humanFileSize(totsize3,true)+"</strong></td><td width='10%'>&nbsp;</td></tr>");
          $("#task").val('edit');

          $("#id").val(data.items['meta'][i].DetailVitalId);
          $("#txt1").focus();

        }
     });
   }

function fileExists(url,ket) {
  var filex = "Upload_Files/"+"<?php echo $_SESSION['CodeRole']; ?>/"+ket+"/"+url;
    if(filex){
        var req = new XMLHttpRequest();
        req.open('GET', filex, false);
        req.send();
        return req.status==200;
    } else {
        return true;
    }
}


function getuploadSP(){
   var files = document.getElementById("myfiles").files;
   var no = 1;
   var totsize = 0;
   var extfile = ['jpg','jpeg','bmp','gif'];

    for (var i = 0; i < files.length; i++)
    {
       if(fileExists(files[i].name,'SP')){
         toastr.error("File "+ files[i].name +" ditemukan nama yang sama !!", "Kesalahan");
         return false;
       }


       var g = 0;
       ext = files[i].name.split('.');
       for(f=0;f < extfile.length;f++){
         if(ext[1] == extfile[f])
           g++;
       }

       if(g==0){
           toastr.error("Jenis extension file "+ files[i].name +" tidak ijinkan", "Kesalahan");
           //moveupload();
           $("#myfiles").val('');
           return false;
       }

       totsize = totsize + (files[i].size);

       $("#filebox").show();

       if($("#task").val() == "new")
          $("#olfiles").append("<tr class='bg-warning'><td align='right'>"+no+".</td><td>"+files[i].name+"</td><td>"+humanFileSize(files[i].size,true)+"</td><td>Baru</td></tr>");
       else
          $("#olf").append("<tr class='bg-warning'><td align='right'>"+no+".</td><td>"+files[i].name+"</td><td>"+humanFileSize(files[i].size,true)+"</td><td>Baru</td></tr>");


       no++;

    }
    if($("#task").val() == "new")
       $("#olfiles").append("<tr class='bg-info'><td colspan=2 align='right'><b>Total File :</b> </td><td><strong>"+humanFileSize(totsize,true)+"</strong></td><td>&nbsp;</td></tr>");
    else
       $("#olf").append("<tr class='bg-info'><td colspan=2 align='right'><b>Total File :</b> </td><td><strong>"+humanFileSize(totsize,true)+"</strong></td><td>&nbsp;</td></tr>");

    if(totsize > 2048000) {
        toastr.error('Total Ukuran File melebihi 2 MB!','KESALAHAN');
        moveupload();
        return false;
    }
}

function getuploadUT(){
   var files = document.getElementById("myfilesA").files;
   var no = 1;
   var totsize = 0;
   var extfile = ['pdf','pdf-a'];

    for (var i = 0; i < files.length; i++)
    {
      if(fileExists(files[i].name,'UT')){
         toastr.error("File "+ files[i].name +" ditemukan nama yang sama !!", "Kesalahan");
         return false;
       }

       var g = 0;
       ext = files[i].name.split('.');
       for(f=0;f < extfile.length;f++){
         if(ext[1] == extfile[f])
           g++;
       }

       if(g==0){
           toastr.error("Jenis extension file "+ files[i].name +" tidak ijinkan", "Kesalahan");
           //moveupload();
           $("#myfilesA").val('');
           return false;
       }

       totsize = totsize + (files[i].size);
       $("#fileboxUT").show();
       $("#olfilesUT").append("<tr class='bg-warning'><td align='right'>"+no+".</td><td>"+files[i].name+"</td><td>"+humanFileSize(files[i].size,true)+"</td><td>Baru</td></tr>");
       no++;
    }
    $("#olfilesUT").append("<tr class='bg-info'><td colspan=2 align='right'><b>Total File :</b> </td><td><strong>"+humanFileSize(totsize,true)+"</strong></td><td>&nbsp;</td></tr>");

    if(totsize > 2048000) {
        toastr.error('Total Ukuran File melebihi 2 MB!','KESALAHAN');
        moveupload();
        return false;
    }
}

function getuploadST(){
   var files = document.getElementById("myfilesB").files;
   var no = 1;
   var totsize = 0;
   var extfile = ['pdf','pdf-a'];

    for (var i = 0; i < files.length; i++)
    {
       if(fileExists(files[i].name,'ST')){
         toastr.error("File "+ files[i].name +" ditemukan nama yang sama !!", "Kesalahan");
         return false;
       }

       var g = 0;
       ext = files[i].name.split('.');
       for(f=0;f < extfile.length;f++){
         if(ext[1] == extfile[f])
           g++;
       }

       if(g==0){
           toastr.error("Jenis extension file "+ files[i].name +" tidak ijinkan", "Kesalahan");
           //moveupload();
           $("#myfilesB").val('');
           return false;
       }

       totsize = totsize + (files[i].size);

       $("#fileboxST").show();
       $("#olfilesST").append("<tr class='bg-warning'><td align='right'>"+no+".</td><td>"+files[i].name+"</td><td>"+humanFileSize(files[i].size,true)+"</td><td>Baru</td></tr>");
       no++;
    }
    $("#olfilesST").append("<tr class='bg-info'><td colspan=2 align='right'><b>Total File :</b> </td><td><strong>"+humanFileSize(totsize,true)+"</strong></td><td>&nbsp;</td></tr>");

    if(totsize > 2048000) {
        toastr.error('Total Ukuran File melebihi 2 MB!','KESALAHAN');
        moveupload();
        return false;
    }
}

function getuploadPL(){
   var files = document.getElementById("myfilesC").files;
   var no = 1;
   var totsize = 0;
   //var extfile = ['pdf','pdf-a'];

    for (var i = 0; i < files.length; i++)
    {
      if(fileExists(files[i].name,'PL')){
         toastr.error("File "+ files[i].name +" ditemukan nama yang sama !!", "Kesalahan");
         return false;
       }
       //var g = 0;
//       ext = files[i].name.split('.');
//       for(f=0;f < extfile.length;f++){
//         if(ext[1] == extfile[f])
//           g++;
//       }
//
//       if(g==0){
//           toastr.error("Jenis extension file "+ files[i].name +" tidak ijinkan", "Kesalahan");
//           //moveupload();
//           $("#myfilesB").val('');
//           return false;
//       }

       totsize = totsize + (files[i].size);

       $("#fileboxPL").show();

       if($("#task").val()=="new")
         $("#olfilesPL").append("<tr class='bg-warning'><td align='right'>"+no+".</td><td>"+files[i].name+"</td><td>"+humanFileSize(files[i].size,true)+"</td><td>Baru</td></tr>");
       else
         $("#olfPL").append("<tr class='bg-warning'><td align='right'>"+no+".</td><td>"+files[i].name+"</td><td>"+humanFileSize(files[i].size,true)+"</td><td>Baru</td></tr>");
       no++;
    }
    if($("#task").val()=="new")
       $("#olfilesPL").append("<tr class='bg-info'><td colspan=2 align='right'><b>Total File :&nbsp;</b> </td><td><strong>"+humanFileSize(totsize,true)+"</strong></td><td>&nbsp;</td></tr>");
    else
       $("#olfPL").append("<tr class='bg-info'><td colspan=2 align='right'><b>Total File :&nbsp;</b> </td><td><strong>"+humanFileSize(totsize,true)+"</strong></td><td>&nbsp;</td></tr>");

    if(totsize > 2048000) {
        toastr.error('Total Ukuran File melebihi 2 MB!','KESALAHAN');
        moveupload();
        return false;
    }
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




function moveupload(){
 var task = $("#task").val();
 var cekfile = $("#sizefile").val();
 if(task=='edit' && cekfile !=0){
    var tanya = confirm("Apakah File Upload dokumen ini mau diganti ?, klik cancel untuk tambah file, klik ok untuk ganti file");
        if(tanya){
            $("#myfiles").val("");
            $("#olfiles").empty();
            $("#filebox").hide();
        } else {
            return false
        }
 } else {   $("#myfiles").val("");
            $("#olfiles").empty();
            $("#filebox").hide();
 }
}



</script>