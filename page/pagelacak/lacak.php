  <style>
         blink, .blink {
            animation: blinker 1s linear infinite;
        }

       @keyframes blinker {
            50% { opacity: 0; }
       }
  </style>
  <section class="content-header">
      <h3>
        Pelacakan Dokumen
      </h3>
      <ol class="breadcrumb">
        <li><a href="index2.html"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Pelacakan Dokumen</li>
      </ol>
  </section>


  <div id="formtable">
  <section class="content" >
      <div class="row">
        <!--<div class="col-md-9">-->
          <div class="box">
            <div class="box-header with-border">
            </div>
            <div class="box-body">
             <div class="input-group date col-md-7">
             <i class='fa fa-barcode fa-5x'></i><br />
             <b>Kode Barcode</b>
             <h3 id='barcodes' class='text-red'><span class="blink"><b>|</b></span></h3><br />
             <label>Input Kode Barcode</label><br />
             <input type="text" style="display: inline" class="form-control" name="txt1" id="txt1"  required>
             <br /><br />
             <button style="display: none" type="button" onclick='lacak();' class="btn btn-info">Cari</button>
             <button style="display: inline;" type="button" onclick='location.reload();' class="btn btn-default">Ulangi</button>
             </div>
            <div class="box-footer clearfix" id="vx" style="padding-top: 10px; display: none">
            <div class="row">
             <div class="col-md-6">
              <div class="box">
               <div class="box-header with-border">
                <div class="box-body">
                  <table class='table table-striped'>
                     <tr>
                       <td width="30%">Periode</td>
                       <td width="3%">:</td>
                       <td><span id='periode'></span></td>
                     </tr>
                     <tr>
                       <td>Uraian</td>
                       <td>:</td>
                       <td><span id='uraian'></span></td>
                     </tr>
                     <tr>
                       <td>Unit Pengolah</td>
                       <td>:</td>
                       <td><span id='unitpengol'></span></td>
                     </tr>
                     <tr>
                       <td>Keterangan</td>
                       <td>:</td>
                       <td><span id='ket'></span></td>
                     </tr>
                  </table>
                </div>
               </div>
               </div>
               </div>
             <div class="col-md-6">
              <div class="box">
               <div class="box-header with-border">
                <div class="box-body">
                  <table class='table table-striped'>
                     <tr>
                       <td width="30%">File Dokumen</td>
                       <td width="3%">:</td>
                       <td><span id='filename'></span></td>
                     </tr>
                     <tr>
                       <td>Ukuran File</td>
                       <td>:</td>
                       <td><span id='sizefile'></span></td>
                     </tr>
                  </table>
                </div>
               </div>
               </div>
               </div>
               </div>
              <div class="box col-md-6">
               <div class="box-header with-border">
               <div class="box-body">
                  <img id="image" style="display:none" width=100%  alt="Picture">
                  <object style="display:none" on id="viewpdf" type = "application/pdf"  width="100%" height="700" >
                  </object>
               </div>
              </div>
              </div>
            </div>
            <center><h3 id='fx' class='alert alert-danger' style="display: none">Dokumen tidak ditemukan !!</h3></center>
            </div>
          </div>
      </div>
  </section>
  </div>
  <script>
  $(function(){
    $("#txt1").focus();
  })
//  $("#txt1").change(function(){
//    $("#barcodes").html($("#txt1").val());
//  })
  $("#txt1").on('keyup change', function () {
    $("#barcodes").html($("#txt1").val());
    if($("#txt1").val().length > 3){
      lacak();
    } else {
      $("#fx").hide();
      $("#barcodes").html('<span class="blink"><b>|</b></span></h3>');
    }
  })
  function lacak(){
   var code = $("#txt1").val();
   $.ajax({
        url: "page/pagelacak/lacak_proses.php", // Url to which the request is send
        type: "POST",
        data: "id="+code,
        async: true,
				beforeSend: function(x) {
					if(x && x.overrideMimeType) {
      					 x.overrideMimeType("application/j-son;charset=UTF-8");
      				}
				},
		dataType : 'json',
        success: function(data){
          var objx = data.items.length;
          if(objx <= 1){
           $("#fx").show();
           $("#vx").hide();
          } else {
          $("#vx").show();
          $("#fx").hide();
          $("#periode").html(data.items[0]).change();
          $("#uraian").html(data.items[1]).change();
          $("#unitpengol").html(data.items[2]).change();
          var ud = '';
          switch(data.items[3]){
            case 'sp' : ud = '<b>Dokumen Spesimen</b>';
                        break;
            case 'ut' : ud = '<b>Dokumen Uraian Teknis</b>';
                        break;
            case 'st' : ud = '<b>Dokumen Spesifikasi Teknis</b>';
                        break;
            case 'pl' : ud = '<b>Dokumen Pendukung</b>';
                        break;
            default   : ud = data.items[3];
                        break;
          }
          $("#ket").html(ud).change();
          var filer = data.items[4].split("/");
          $("#filename").html(filer[3]).change();
          $("#sizefile").html(humanFileSize(data.items[5],true)).change();
          var ext = filer[3].split('.');
          if(ext[1]=='jpg' || ext[1]=='jpeg'){
             $("#image").show();
             $("#viewpdf").hide();
             $("#image").attr("src",data.items[4]);
          }else{
             $("#image").hide();
             $("#viewpdf").show();
             $("#viewpdf").attr("data","viewerJS/#../"+data.items[4]);
          }
         }
         //return false;
        }
  })
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
