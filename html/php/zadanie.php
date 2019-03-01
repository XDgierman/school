<!DOCTYPE html>
<html lang="pl-PL" dir="ltr">
	<head>
	</head>
	<body>
		<form action="index.php" method="POST">
			Liczba: <input type="text" name="li"><br />
			<input type="submit">
		<?php
		if($_SERVER["REQUEST_METHOD"]=="POST"){
		$liczba = $_POST["li"];
		function int2bin($n){
			$t = array();
			$i=0;
			while($n != 0){
				$t[$i] = $n%2;
				$n = floor($n/2);
				$i++;
			}
			return $t;
		}
		function int2hex($n){
			$t = array();
			$i=0;
			while($n != 0){
				$tmp = $n%16;
					switch ($tmp) {
						case 10:
							$t[$i] = 'A';
							break;
						case 11:
							$t[$i] = 'B';
							break;
						case 12:
							$t[$i] = 'C';
							break;
						case 13:
							$t[$i] = 'D';
							break;
						case 14:
							$t[$i] = 'E';
							break;
						case 15:
							$t[$i] = 'F';
							break;
						default:
							$t[$i] = $tmp;
							break;
					}
				$n = floor($n/16);
				$i++;
			}
			return $t;
		}
		$j = int2hex($liczba);
		$txt = "";
		for ($i = count($j)-1;$i >=0;$i--){
			$txt .= $j[$i];
		}
		echo "<br>". $txt;
	}
		?>
	</body>
</html>
