<!DOCTYPE html>
<html lang="pl-PL">
<head>
<meta charset="UTF-8">


</head>
	<body>
		<form action="index.php" method="POST">
			Liczba: <input type="text" name="li"><br />
			Potęga: <input type="text" name="pt"><br />
			<input type="submit">
			<?php
			if($_SERVER["REQUEST_METHOD"]=="POST"){
				$liczba = $_POST["li"];
				$potega = $_POST["pt"];
				function potegowanie($l,$p){
					$w = $l;
					for ($i=1; $i < $p; $i++) {
						$w = $w*$l;
				}
				echo $w;
				}
				potegowanie($liczba,$potega);
			}
			?>
		</form>
	</body>
</html>
