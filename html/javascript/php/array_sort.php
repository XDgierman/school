<!DOCTYPE html>
<html lang="pl-PL">
<head>
<meta charset="UTF-8">


</head>
	<body>
		<?php
			$cars1 = array("Opel","BMW","Audi","Fiat","Mazda","Ford");
			$osoba = array("Imie" => "Jan", "Nazwisko" => "Kowalski", "Wiek" => "48", "Waga" => "94", "Pesel" => "88457487");
			foreach ($cars1 as $car) {
				echo "$car <br>";
			}
			echo "<br>";
			sort($cars1);
			foreach ($cars1 as $car) {
				echo "$car <br>";
			}
			echo "<br>";
			rsort($cars1);
			foreach ($cars1 as $car) {
				echo "$car <br>";
			}
			echo "<br>";
			foreach ($osoba as $key => $value) {
				echo $key . " - " . $value ."<br>";
			}
			echo "<br>";
			asort($osoba);
			foreach ($osoba as $key => $value) {
				echo $key . " - " . $value ."<br>";
			}
			echo "<br>";
			arsort($osoba);
			foreach ($osoba as $key => $value) {
				echo $key . " - " . $value ."<br>";
			}
			echo "<br>";
			ksort($osoba);
			foreach ($osoba as $key => $value) {
				echo $key . " - " . $value ."<br>";
			}
			echo "<br>";
			krsort($osoba);
			foreach ($osoba as $key => $value) {
				echo $key . " - " . $value ."<br>";
			}
		?>

	</body>
