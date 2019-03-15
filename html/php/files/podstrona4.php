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
				<?php
				$f = fopen("text.txt",'a') or die("Nie można otworzyc pliku!");
				$txt = "\nPrzykładowy tekst 6";
				fwrite($f,$txt);
				fclose($f);
				?>
			</div>
			<div class="footer">
				footer
			</div>
		</div>
	</body>
</html>
