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
				if (file_exists("funkcje.php")){
					include 'funkcje.php';
					echo silnia(2) . "<br>";
				} else echo "brak pliku <br>";
				echo "Rozmiar : " . filesize("style.css");
				?>
			</div>
			<div class="footer">
				footer
			</div>
		</div>
	</body>
</html>
