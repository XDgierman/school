<!DOCTYPE html>
<html lang="pl-PL" dir="ltr">
	<head>
		<style media="screen">
		input[type="text"]:disabled {
background: #dddddd;
}
		</style>
	</head>
	<body>
		<form action="index.php" method="POST">
			Tekst: <input type="text" name="txt"><br />
			Początek: <input type="text" name="pt"><br />
			Długość: <input type="text" name="kc"><br />
			<input type="submit" disabled><br />
			<br />
			Komentarz : <textarea name="kom" rows="8" cols="80"></textarea><br />
			Szukana: <input type="text" name="sz"><br />
			<input type="submit" value="Przeszukaj"><br />
		<?php
		/*if($_SERVER["REQUEST_METHOD"]=="POST"){
		$txt = $_POST["txt"];
		$pt = $_POST["pt"];
		$kc = $_POST["kc"];
		if (is_null($kc) || $kc = ""){
			echo substr($txt,$pt);
		} else echo substr($txt,$pt,$kc);
	}*/
		if($_SERVER["REQUEST_METHOD"]=="POST"){
		$kom = $_POST["kom"];
		$szk = array("Ala", "Tomek", "Janek");
		$txt = $kom;
		foreach ($szk as $sz) {
			$txt = str_replace($sz, "<span style='color:#FF0000';>" . $sz . "</span>", $txt);
		}
		echo nl2br($txt);
		//napisz skrypt w którym znajduje się formularz do wpisania tekstu (text-area) do skryptu
		//w skrypcie zadeklarowano tablicę wyrazów szukanych w tekście $szk = array ("Ala", "Tomek", "Janek")
		//należy przeszukac tekst przesłany przez formularz i pokolorowac te wyrazy które występują w tablicy
		//tak sformatowany tekst wyświetlic
	}
		?>
	</body>
</html>
