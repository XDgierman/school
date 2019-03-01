<!DOCTYPE html>
<html>
	<head>
		<title></title>
	</head>
	<body>
		<?php
		$x =20;
		if ($x <=9 and $x >=0) {
			echo "Liczba x należy do jedności";
		}elseif ($x <=99 and $x >=10) {
			echo "Liczba x należy do dziesiętnych";
		}elseif ($x <=999 and $x >=100) {
			echo "Liczba x należy do setek";
		} else {
			echo "Liczba x należy do tysięcy";
		}
		?>
	</body>
</html>
