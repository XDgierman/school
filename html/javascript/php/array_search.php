<!DOCTYPE html>
<html lang="pl-PL">
<head>
<meta charset="UTF-8">


</head>
	<body>
		<?php
			$cars1 = array("Opel","BMW","Audi","Fiat","Mazda","Ford");
			$osoba = array("Imie" => "Jan", "Nazwisko" => "Kowalski", "Wiek" => "48", "Waga" => "94", "Pesel" => "88457487");
			echo array_search("Kowalski",$osoba);
			echo "<br>";
			echo array_search("Audi",$cars1);
		?>

	</body>
</html>
