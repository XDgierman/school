<html>
<head>
  <?php
  function ifPrime($n){
    if($n < 2) return false;
    for ($i = 2; $i < $n; $i++) {
        if($n%$i==0)
            return false;
    }
    return true;
  }
  for ($j=1;$j<=1000;$j++){
    if (ifPrime($j)){
      echo "$j<br>";
    }
  }
   ?>
</head>
<body>

</body>


</html>
