<!DOCTYPE html>
<html lang="pl-PL">
<head>
<meta charset="UTF-8">


</head>
	<body>
		<?php
		$txt="";
		echo "───────────── <br>";
			for($x = 1;$x<11;$x++)
			{
				$txt .= "|";
				for($y = 1;$y<11;$y++)
				{
				$txt .= " " . ($x*$y) . " |";
				}
				echo $txt . "<br>";
				echo "───────────── <br>";
				$txt = "";
			}
			
		?>

	</body>
</html>
