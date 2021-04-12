<link rel="stylesheet" href="bower_components/morris.js/morris.css">
<script src="bower_components/jquery/jquery.min.js"></script>
<script src="bower_components/raphael/raphael.min.js"></script>
<script src="bower_components/morris.js/morris.js"></script>

<script type="text/javascript">
$(function () {
    grahpinfo();
    tableinfo();
});



function tableinfo(){
  $.ajax({
    type: "POST",
    url: "page/pagedashboard/display.php?task=lpinjam",
    success: function(display){
        //alert(display);

      if(display == '')
        $("#bodyr").append('<tr><td colspan = "3" ><center>Tidak ada permohonan</center></td></tr>')
      else
        $("#bodyr").html(display);
    }
  })
}

function grahpinfo(){
  $.ajax({
    type: "POST",
    url: "page/pagedashboard/display.php?task=lgraph",
    success: function(display){
     //alert(display);
     disp = display.split("#");
        var g = disp[0];
        $("#laktif").html(g);
        var r = disp[1];
        $("#linaktif").html(r);
        var t = disp[2];
        $("#lvital").html(t);
        $("#lpinjam").html(disp[3]);
      var bar = new Morris.Bar({
      element: 'bar-chart',
      resize: false,
      data: [
        {y: 'Dok.Aktif', a: g},
        {y: 'Dok.Inaktif', a: r},
        {y: 'Dok.Vital', a: t}
      ],

      xkey: 'y',
      ykeys: ['a'],
      labels: ['Jumlah'],
      hideHover: 'auto'
    });
    }
  })
}

</script>