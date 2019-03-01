<!DOCTYPE html>
<html>
	<head>
		<title></title>
	</head>
	<body>
		<?php
		$txt = "Hello world!";
		$x = 10.5;
		$y = 5;
		echo $txt;
		echo "<br>";
		echo $x;
		echo "<br>";
		echo $y;
		echo "<br> Suma=".($x+$y);
		echo "<br> Odejmowanie=".($x-$y);
		echo "<br> Mnożenie=".($x*$y);
		echo "<br> Dzielenie=".($x/$y);
		echo "<br> Potęgowanie=".($x**$y);
		static $z = 0; // przechowuje dane w funkcji po wyjściu
		?>
	</body>
</html>
