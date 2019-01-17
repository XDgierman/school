<!DOCTYPE html>
<html lang="pl-PL">
<head>
<meta charset="UTF-8">


</head>
	<body>
		<?php
		echo "Today is " . date("Y/m/d") . "<br>";
		echo "Today is " . date("Y.m.d") . "<br>";
		echo "Today is " . date("Y-m-d") . "<br>";
		echo "Today is " . date("l") . "<br>";
		if (date("a")=="am") {
			echo "The time is " . date("h:i:s") . "<br>";
		} else {
			$x = date("h") + 12;
			echo "The time is ". $x . ":" . date("i:s") . "<br>";
		}
		$d = mktime(12,0,0,9,22,2000);
		echo "Created time is " . date("l, d-m-Y h:i:s", $d);
		?>

	</body>
</html>
