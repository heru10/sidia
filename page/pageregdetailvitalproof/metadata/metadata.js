<script src="bower_components/multiupload/js/jquery.uploadfile.min.js"></script>
<script src="bower_components/select2/dist/js/select2.full.min.js"></script>
<link rel="stylesheet" href="bower_components/bootstrap-daterangepicker/daterangepicker.css">
<link rel="stylesheet" href="bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
<script src="bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<script src="bower_components/multiupload/js/jquery.uploadfile.min.js"></script>

<script type="text/javascript">
$(function () {
    $('#txt4').select2({
      placeholder: 'Unit Pelaksana',
    });
    $('#txt2').datepicker({
      format: 'dd/mm/yyyy',
      autoclose: true
    });
    $('#txt5').datepicker({
      format: 'dd/mm/yyyy',
      autoclose: true
    });
    $('#txt6').datepicker({
      format: 'dd/mm/yyyy',
      autoclose: true
    });

    if($("#task").val()=="edit"){
      getload_metadata();
    }
    
    //loadselected();
  });

  $("#nulldesain").change(function(){
    $("#txt5").val("00/00/0000").change();
  })
  $("#nullproof").change(function(){
    $("#txt6").val("00/00/0000").change();
  })

  function fileExists(url) {
  var filex = $("#path").val()+"/"+ url;

    if(filex){
        var req = new XMLHttpRequest();
        req.open('GET', filex, false);
        req.send();
        return req.status==200;
    } else {
        return true;
    }
}


function getupload(name){
  var files = document.getElementById("txtf"+name).files;

  var no = $("#jmlfile_"+name).val();
  for(var i=0;i<files.length;i++){
   if(fileExists(files[i].name)){
     toastr.error("File "+ files[i].name +" ditemukan nama yang sama !!", "Kesalahan");
     $("#txtf"+name).val("");
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

   if($("#task").val()!='edit'){
    $("#f"+name).html('');
    for (var i = 0; i < files.length; i++){
      $("#f"+name).append("<tr><td width=2%>"+no+".</td><td>"+files[i].name+"</td></tr>");
      no++;
     }
   } else {
     $("#x"+name).html('');
        kp = "Baru";
        if(name=="data")
         kp = "Ganti";

     for (var i = 0; i < files.length; i++){
      no++;
      $("#x"+name).append("<tr class='bg-blue'><td width=2%>"+no+".</td><td>"+files[i].name+"</td><td><span class='label label-info'>"+kp+"</span></td></tr>");
      //no++;
     }
   }

  }

  $(function(e){
   $("#mymetadata").on('submit',(function(e) {
        e.preventDefault();
       var urls = "<?php echo 'page/pageregdetailvitalproof/metadata/metadata_proses.php'; ?>";
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

function getload_metadata(){
  var id = $("#id").val();
  var ids = $("#ids").val();

    $.ajax({
        url: "page/pageregdetailvitalproof/metadata/metadata_proses.php", // Url to which the request is send
        type: "POST",
        data: "task=load&id="+id+"&ids="+ids,
        async: true,
				beforeSend: function(x) {
					if(x && x.overrideMimeType) {
      					 x.overrideMimeType("application/j-son;charset=UTF-8");
      				}
				},
		dataType : 'json',
        success: function(data){

          ArryMetadata = data.items['meta'].length;
          ArryFile = data.items['img'].length;


          no_dasar = 1;
          no_spk = 1;
          no_nota = 1;
          no_preview = 1;
          no_lampiran = 1;

          $("#fdasar").html("");
          $("#fspk").html("");
          $("#fnota").html("");
          $("#fpreview").html("");
          $("#jmlfile_dasar").val(0);
          $("#jmlfile_lampiran").val(0);
          $("#jmlfile_spk").val(0);
          $("#jmlfile_nota").val(0);
          $("#jmlfile_preview").val(0);
          
          for(var i=0;i < ArryFile;i++){
            if(data.items['img'][i].Ket == "a-dasar" ){
              //alert(data.items['img'][i].Ket);
              filex = data.items['img'][i].Filename;
              filex = filex.split("/");
              $("#fdasar").append("<tr><td width=2%>"+no_dasar+".</td><td>"+filex[3]+"</td><td width=5%><button type='button' onclick=delfiles('"+data.items['img'][i].DetVFileId+"'); title='Hapus File' class='btn btn-danger btn-sm' id='btndelfile'><i class='fa fa-bitbucket' ></i></button></td></tr>");
              $("#jmlfile_dasar").val(no_dasar);
              no_dasar++;
            }

            if(data.items['img'][i].Ket == "b-lampiran" ){
              //alert(data.items['img'][i].Ket);
              filex = data.items['img'][i].Filename;
              filex = filex.split("/");
              $("#flampiran").append("<tr><td width=2%>"+no_lampiran+".</td><td>"+filex[3]+"</td><td width=5%><button type='button' onclick=delfiles('"+data.items['img'][i].DetVFileId+"'); title='Hapus File' class='btn btn-danger btn-sm' id='btndelfile'><i class='fa fa-bitbucket' ></i></button></td></tr>");
              $("#jmlfile_lampiran").val(no_lampiran);
              no_lampiran++;
             }


            if(data.items['img'][i].Ket == "c-spk" ){
              //alert(data.items['img'][i].Ket);
              filex = data.items['img'][i].Filename;
              filex = filex.split("/");
              $("#fspk").append("<tr><td width=2%>"+no_spk+".</td><td>"+filex[3]+"</td><td width=5%><button type='button' onclick=delfiles('"+data.items['img'][i].DetVFileId+"'); title='Hapus File' class='btn btn-danger btn-sm' id='btndelfile'><i class='fa fa-bitbucket' ></i></button></td></tr>");
              $("#jmlfile_spk").val(no_spk);
              no_spk++;
            }

            if(data.items['img'][i].Ket == "d-nota" ){
              //alert(data.items['img'][i].Ket);
              filex = data.items['img'][i].Filename;
              filex = filex.split("/");
              $("#fnota").append("<tr><td width=2%>"+no_nota+".</td><td>"+filex[3]+"</td><td width=5%><button type='button' onclick=delfiles('"+data.items['img'][i].DetVFileId+"'); title='Hapus File' class='btn btn-danger btn-sm' id='btndelfile'><i class='fa fa-bitbucket' ></i></button></td></tr>");
              $("#jmlfile_nota").val(no_nota);
              no_nota++;
            }

            if(data.items['img'][i].Ket == "e-preview" ){
              filex = data.items['img'][i].Filename;
              filex = filex.split("/");
              $("#fpreview").append("<tr><td width=2%>"+no_preview+".</td><td>"+filex[3]+"</td><td width=5%><button type='button' onclick=delfiles('"+data.items['img'][i].DetVFileId+"'); title='Hapus File' class='btn btn-danger btn-sm' id='btndelfile'><i class='fa fa-bitbucket' ></i></button></td></tr>");
              $("#jmlfile_preview").val(no_preview);
              no_preview++;
            }

         }

          $("#txt1").val(data.items['meta'][0].Perihal);
          Tgl = data.items['meta'][0].Tgl_Nodin.split('-');
          $("#txt2").val(Tgl[2]+"/"+Tgl[1]+"/"+Tgl[0]);
          $("#txt3").val(data.items['meta'][0].Dasar);
          Pelaksana = data.items['meta'][0].IdPelaksana;
          Pel = Pelaksana.split("#");
          $("#txt4").val(Pel).trigger('change.select2');
          //$('#txt4').select2().val(Pel).trigger('change');
          $('#txt4').select2().val(Pel).trigger('change');
          Tgl = data.items['meta'][0].Tgl_Desain.split('-');
          $('#txt5').val(Tgl[2]+"/"+Tgl[1]+"/"+Tgl[0]);
          if(data.items['meta'][0].Tgl_Desain=="0000-00-00")
            $("#nulldesain").prop("checked",true);
          Tgl = data.items['meta'][0].Tgl_Proof.split('-');
          $('#txt6').val(Tgl[2]+"/"+Tgl[1]+"/"+Tgl[0]);
          if(data.items['meta'][0].Tgl_Proof == "0000-00-00")
            $("#nullproof").prop("checked",true);
          $('#txt7').val(data.items['meta'][0].Nomor_SPK);
          $('#txt8').val(data.items['meta'][0].KetPekerjaan).change();
          $('#txt9').val(data.items['meta'][0].Nota_Penyerahan);
          $('#txt10').val(data.items['meta'][0].Keterangan);
          $('#txt11').val(data.items['meta'][0].Gedung);
          $('#txt12').val(data.items['meta'][0].Lemari);
          $('#txt13').val(data.items['meta'][0].Baris);
          $('#txt14').val(data.items['meta'][0].Boks);

          $("#id").val(data.items['meta'][0].DetailProfId);
          $("#ids").val(data.items['meta'][0].RegVitalId);
          $("#task").val('edit');

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
        url: "page/pageregdetailvitalproof/metadata/metadata_proses.php", // Url to which the request is send
        type: "POST",
        data: "task=delfile&id="+id,
        success: function(msg){
            //alert(msg);
            location.reload();
        }
       });
   }
  }


</script>