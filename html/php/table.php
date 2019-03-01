<!DOCTYPE html>
<html lang="pl-PL">
<head>
<meta charset="UTF-8">


</head>
	<body>
		<?php
			
			$cars = array(array("Ford", "Focus", "2012"),
						array("Opel", "Astra", "2007"),
						array("Fiat", "Panda", "2009"));
			$tab = "<table border =1>";
			foreach ($cars as $value) {
			$tab .="<tr>";
			foreach ($value as $end) {
				$tab .= "<td>$end</td>";
				}
			$tab.="</tr>";
			}
			$tab.="</table>";
			echo $tab;
		?>

	</body>
</html>
