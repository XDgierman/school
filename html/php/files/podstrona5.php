<!DOCTYPE html>
<html lang="pl-PL" dir="ltr">
	<head>
		<link rel="stylesheet" href="style.css">
	</head>
	<body>
		<div class="container">
			<div class="baner">
				<h1 style="text-align:center">Baner</h1>
			</div>
			<div class="menu">
				<?php
					include 'menu.php';
				?>
			</div>
			<div class="content">
				<form action="podstrona5.php" method="post">
					Marka : <input type="text" name="mar"><br>
					Model : <input type="text" name="mod"><br>
					Kolor : <input type="text" name="col"><br>
					Rocznik : <input type="text" name="rok"><br>
					Cena : <input type="text" name="cen"><br>
					Używany:
					<label><input type="radio" name="uz" value="tak" checked>Tak</label>
					<label><input type="radio" name="uz" value="nie">Nie</label><br>
					<input type="submit" value="Wprowadź">
				</form>
				<?php
				if($_SERVER["REQUEST_METHOD"]=="POST"){
					$f = fopen("samochody.txt",'a') or die("Nie można otworzyc pliku!");
					$txt = "\n" . $_POST["mar"] . ";" . $_POST["mod"] . ";" . $_POST["col"] . ";" . $_POST["rok"] . ";" . $_POST["cen"];
					if ($_POST["uz"]=='tak'){
						$txt.= ";Tak";
					} else if ($_POST["uz"]=='nie'){
						$txt.= ";Nie";
					}
					fwrite($f,$txt);
					fclose($f);
					echo "<br>Procedura zakończona!";
				}
				?>
			</div>
			<div class="footer">
				footer
			</div>
		</div>
	</body>
</html>
