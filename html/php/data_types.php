<!DOCTYPE html>
<html>
	<head>
		<title></title>
	</head>
	<body>
		<?php
		$txt = "Hello world!";
		$x = 10.5;
		$y = 19;
		$h = 0xAB;
		$o = 0312;
		$b = true;
		$cars = array("Volvo","BMW","Toyota");
		class Car {
			function Car() {
				$this->model = "VW";
			}
		}
		$herbie = new Car();
		$n = null;
		var_dump($txt);
		echo "<br>";
		var_dump($x);
		echo "<br>";
		var_dump($y);
		echo "<br>";
		var_dump($h);
		echo "<br>";
		var_dump($o);
		echo "<br>";
		var_dump($b);
		echo "<br>";
		var_dump($cars);
		echo "<br>";
		var_dump($n);
		echo "<br>";
		var_dump($herbie);
		?>
	</body>
</html>
