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
				$f= fopen("samochody.txt","r");
				$tab = array();
				$index = 0;
				while (!feof($f)) {
					$i=0;
					foreach (explode(';',fgets($f)) as $key => $value) {
						$tab[$index][$i++] = $value;
					}
					$index++;
					$i=0;
				}
				fclose($f);
				print_r($tab);
				echo "<br><table border =1>";
				foreach ($tab as $uno) {
					echo "<tr>";
					foreach ($uno as $end) {
						echo "<td>".$end."</td>";
					}
					echo "</tr>";
				}
				echo "</table>";


				$max=intval($tab[0][4]);
				$imax=0;
				for ($t=1; $t < count($tab); $t++) {
					if (intval($tab[$t][4])>$max) {
						$max=intval($tab[$t][4]);
						$imax=$t;
					}
				}
				$min=intval($tab[0][4]);
				$imin=0;
				for ($t=1; $t < count($tab); $t++) {
					if (intval($tab[$t][4])<$min) {
						$min=intval($tab[$t][4]);
						$imun=$t;
					}
				}

				echo "<br><table border =1><tr>";
				foreach ($tab[$imax] as $end) {
					echo "<td>".$end."</td>";
				}
				echo "</tr><tr>";
				foreach ($tab[$imin] as $end) {
					echo "<td>".$end."</td>";
				}
				echo "</tr></table>";
				?>
			</div>
			<div class="footer">
				footer
			</div>
		</div>
	</body>
</html>
