<?php

  <table class="table" border="0">
                                  <tr>
                                     <td colspan="2">
                                      <button class="btn btn-primary" style="display: <?php echo $btnaddm; ?>" onclick="getmetadata();" ><b><i class="fa fa-floppy-o"></i>&nbsp;Tambah</b></button>
                                      <button type="button" style="display: <?php echo $btneditm; ?>" class="btn btn-warning" onclick="getload_metadata();" ><b><i class="fa fa-floppy-o"></i>&nbsp;Ubah</b></button>
                                      <button type="submit" style="display: <?php echo $btndelm; ?>" class="btn btn-danger"><b><i class="fa fa-floppy-o"></i>&nbsp;Hapus</b></button>
                                     </td>
                                  </tr>
                                  <tr>
                                     <td width="15%">Perihal</td>
                                     <td><?php echo $data['Perihal']; ?></td>
                                  </tr>
                                  <tr>
                                     <td width="15%">Tanggal Nota Dinas</td>
                                     <td>
                                        <?php echo date('d-m-Y',strtotime($data['Tgl_Nodin'])); ?>
                                    </td>
                                  </tr>
                                  <tr>
                                     <td width="15%">Dasar</td>
                                     <td>
                                         <?php echo $data['Dasar']; ?>
                                    </td>
                                  </tr>
                                  <tr>
                                     <td width="15%">Upload File</td>
                                     <td>
                                       <?php
                                         $sql = "SELECT * from detailvitalFile_proof ";
                                         $sql .= " where RegVitalId = '".$_REQUEST['ids']."' and Ket= 'dasar'";
                                         $result = mysqli_query($connect,$sql);
                                         while($files = mysqli_fetch_array($result)){
                                           $gfile = explode("/",$files['Filename']);
                                           echo "<a href='#'>".$gfile[3]."</a>&nbsp;&nbsp;";
                                         }
                                       ?>
                                    </td>
                                  </tr>
                                  <tr>
                                     <td width="15%">Pelaksana</td>
                                     <td>
                                           <?php
                                              $Role = explode("#",$data['IdPelaksana']);
                                              for($i=0;$i<count($Role);$i++){
                                               $sql = "select RoleName from role where RoleId = '".$Role[$i]."' ";
                                               $result = mysqli_query($connect, $sql);
                                               $rs = mysqli_fetch_array($result);
                                               echo $rs['RoleName'].",&nbsp;";
                                             }
                                           ?>
                                    </td>
                                  </tr>
                                  <tr>
                                     <td width="15%">Target Desain</td>
                                     <td>
                                         <?php echo date('d-m-Y',strtotime($data['Tgl_Desain'])); ?>
                                    </td>
                                  </tr>
                                  <tr>
                                     <td width="15%">Target Proof</td>
                                     <td>
                                        <?php echo date('d-m-Y',strtotime($data['Tgl_Proof'])); ?>
                                    </td>
                                  </tr>
                                  <tr>
                                     <td width="15%">Nomor SPK</td>
                                     <td>
                                        <?php echo $data['Nomor_SPK']; ?>
                                    </td>
                                  </tr>
                                  <tr>
                                     <td width="15%">Upload File SPK</td>
                                     <td>
                                       <?php
                                         $sql = "SELECT * from detailvitalFile_proof ";
                                         $sql .= " where RegVitalId = '".$_REQUEST['ids']."' and Ket= 'spk'";
                                         $result = mysqli_query($connect,$sql);
                                         while($files = mysqli_fetch_array($result)){
                                           $gfile = explode("/",$files['Filename']);
                                           echo "<a href='#'>".$gfile[3]."</a>,&nbsp;";
                                         }
                                       ?>
                                     </td>
                                  </tr>
                                  <tr>
                                     <td width="15%">Kode Pekerjaan</td>
                                     <td>
                                        <?php echo $data['Pekerjaan']; ?>
                                    </td>
                                  </tr>
                                  <tr>
                                     <td width="15%">Nota/Surat Penyerahan</td>
                                     <td>
                                        <?php echo $data['Nota_Penyerahan']; ?>
                                    </td>
                                  </tr>
                                  <tr>
                                     <td width="15%">Upload File Nota</td>
                                     <td>
                                         <?php
                                         $sql = "SELECT * from detailvitalFile_proof ";
                                         $sql .= " where RegVitalId = '".$_REQUEST['ids']."' and Ket= 'nota'";
                                         $result = mysqli_query($connect,$sql);
                                         while($files = mysqli_fetch_array($result)){
                                           $gfile = explode("/",$files['Filename']);
                                           echo "<a href='#'>".$gfile[3]."</a>,&nbsp;";
                                         }
                                       ?>
                                    </td>
                                  </tr>
                                  <tr>
                                     <td width="15%">Upload Data</td>
                                     <td>
                                       <?php
                                         $sql = "SELECT * from detailvitalFile_proof ";
                                         $sql .= " where RegVitalId = '".$_REQUEST['ids']."' and Ket= 'nota'";
                                         $result = mysqli_query($connect,$sql);
                                         $gfile = mysqli_fetch_array($result);
                                         $gfilex = explode("/",$gfile['Filename']);
                                         echo "<a href='#'>".$gfilex[3]."</a>";
                                       ?>
                                     </td>
                                  </tr>
                                  <tr>
                                     <td width="15%">Keterangan</td>
                                     <td>
                                        <?php echo $data['Keterangan']; ?>
                                    </td>
                                  </tr>
                                  <tr>
                                        <td colspan="2"><h4>Lokasi Simpan</h4></td>
                                     </tr>
                                     <tr>
                                        <td width="20%">Gedung</td>
                                        <td><?php echo $data['Gedung']; ?></td>
                                     </tr>
                                     <tr>
                                        <td>Lemari</td>
                                        <td><?php echo $data['Lemari']; ?></td>
                                     </tr>
                                     <tr>
                                        <td>Baris</td>
                                        <td><?php echo $data['Baris']; ?></td>
                                     </tr>
                                     <tr>
                                        <td>Sarana Penyimpanan</td>
                                        <td><?php echo $data['Boks']; ?><br />
                                            <small>* File, Folder, Boks, Album, dll</small>
                                        </td>
                                     </tr>
                                 </table>

?>