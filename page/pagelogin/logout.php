<?php
  session_start();
  include "../../conf.php";
  loguser('logout');
  die("<script>location.href='../../index.php'</script>");
?>