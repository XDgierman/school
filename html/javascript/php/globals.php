<!DOCTYPE html>
<html lang="pl-PL">
<head>
<meta charset="UTF-8">


</head>
	<body>
		<?php
			$a = 10;
      function wyswietl(){
        echo "<br>Zmienna globalna a=".$GLOBALS['a'];
      }
      wyswietl();
		?>

	</body>
</html>
