<!DOCTYPE html>
<html lang="pl-PL">
<head>
<meta charset="UTF-8">


</head>
	<body>
		<?php
		function czas(){
		$d = time();
		$k = mktime(0,0,0,6,21,2019);
		$mili = $k-$d;
		$godz = $mili%86400;
		$min = $godz%3600;
		$sec = $min%60;
		$mili /= 86400;
		$mili = floor($mili);
		$godz /= 3600;
		if ($godz < 1) $godz = floor($godz);
		else $godz = ceil($godz);
		$min /= 60;
		$min = floor($min);
		$var = "";
		echo $mili;
		if ($mili>=1 || $mili<1){
			echo " dni ";
		} else echo " dzień ";
		echo $godz;
		if ($godz>=5 || $godz<1){
			echo " godzin ";
		} else if ($godz<5 && $godz>1) echo " godziny ";
		else echo " godzina ";
		echo $min;
		if ($min>=5 || $min<1){
			echo " minut i ";
		} else if ($min<5 && $min>1) echo " minuty i ";
		else echo " minuta i ";
		echo $sec;
		if ($sec>=5 || $sec<1){
			echo " sekund.";
		} else if ($sec<5 && $sec>1) echo " sekundy.";
		else echo  " sekunda.";
	}
	czas();
		?>

	</body>
</html>
