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
				if (file_exists("funkcje3.php")){
					include 'funkcje3.php';
					echo silnia(4) . "<br>";
				} else echo "brak pliku <br>";
				var_dump(is_file('style.css'));
				echo "<br>";
				$f= fopen("samochody.txt","r");
				echo "<table border =1>";
				while (!feof($f)) {
					echo "<tr><td>". str_replace(';','</td><td>',fgets($f)) . "</td></tr>";
				}
				echo '</table>';
				fclose($f);
				?>
			</div>
			<div class="footer">
				footer
			</div>
		</div>
	</body>
</html>
