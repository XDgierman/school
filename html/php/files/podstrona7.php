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
				<form action="podstrona7.php" method="post">
					Lokacja : <input type="text" name="loc"><br>
					<input type="submit" value="Wprowadź"><br>
				</form>
				<?php
				if($_SERVER["REQUEST_METHOD"]=="POST"){
					$p = $_POST["loc"];
					if ($k = opendir($p)){
						while (($f = readdir($k))!==false) {
							echo "$f <br>";
						}
						closedir($k);
					}
					else {
						echo "Nie znaleziono lub nie dało się otworzyc katalogu";
					}
				}
				?>
			</div>
			<div class="footer">
				footer
			</div>
		</div>
	</body>
</html>
