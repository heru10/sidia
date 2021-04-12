 <section class="content-header">
      <h3>
        <b>Backup & Restore Database</b>
      </h3>
      <ol class="breadcrumb">
        <li><a href="index2.html"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Backup & Restore Database</li>
      </ol>
  </section>
  <section class="content">
          <div class="box">
            <div class="box-header with-border">
              <div class="external-event bg-success ui-draggable ui-draggable-handle" style="position: relative; width: auto"><span id="lblstatus">Backup Database</span></div>
            </div>
            <div class="box-body">
            <form  name="myfrm1" id="myfrm1" action="page/pagebackup&restore/backup.php" method="post">
              <table>
                <tr>
                   <td><img src="dist/img/db_backup.png" width="50%"  /></td>
                </tr>
             </table>
             <div class="box-body pull-left">
                <button type="submit" class="btn btn-primary"><i class="fa fa-database"></i> Backup Database</button>
              </div>
            </form>
            </div>
        </div>
          <div class="box">
            <div class="box-header with-border">
              <div class="external-event bg-success ui-draggable ui-draggable-handle" style="position: relative; width: auto"><span id="lblstatus">Restore Database</span></div>
            </div>
            <div class="box-body">
             <form  name="myfrm" id="myfrm" action="page/pagebackup&restore/restore-data.php" enctype="multipart/form-data" method="post">

             <table>
                <tr>
                   <td><img src="dist/img/150504-backup-restore.png" width="50%"  /></td>
                </tr>
             </table>

             <div class="form-group">
                      <label class="col-sm-3 control-label">File Database (*.sql)</label>
                      <div class="col-sm-7">
                          <input type="file" name="datafile" size="30" required />
                      </div>
                  </div> <br />
                  <div class="form-group">
                      <div class="col-sm-offset-3 col-sm-7">
                          <button type="submit" name="restore" class="btn btn-danger "> <i class="fa fa-database"></i>&nbsp;Restore Database</button>
                      </div>
                  </div>
               </form>
           </div>
        </div>
  </section>


