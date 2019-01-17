<!DOCTYPE html>
<html lang="pl-PL">
<head>
<meta charset="UTF-8">


</head>
	<body>
		<?php
			$a = 10;
      function wyswietl(&$x){
				$x++;
        echo "<br>Zmienna x = ".$x;
      }
			echo "<br>1. a = ".$a;
      wyswietl($a);
			echo "<br>2. a = ".$a;

		?>

	</body>
</html>
