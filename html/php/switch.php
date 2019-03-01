<!DOCTYPE html>
<html lang="pl-PL">
<head>
<meta charset="UTF-8">


</head>
	<body>
		<?php
			$t = date("w");
			switch($t){
			case 0:
				ECHO "Dziś jest Niedziela";
			break;
			case 1:
				ECHO "Dziś jest Poniedziałek";
			break;
			case 2:
				ECHO "Dziś jest Wtorek";
			break;
			case 3:
				ECHO "Dziś jest Środa";
			break;
			case 4:
				ECHO "Dziś jest Czwartek";
			break;
			case 5:
				ECHO "Dziś jest Piątek";
			break;
			default:
				ECHO "Dziś jest Sobota";
			break;
			}
			echo "<br>" . $t;
		?>

	</body>
</html>
