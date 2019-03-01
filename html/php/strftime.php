<!DOCTYPE html> 
<html lang="pl">

<head>
	<title> Język PHP </title>
	<meta charset="UTF-8" />
	<style type="text/css">

		body{
			padding: 30px;
			color: navy;				
		}
		div {
			margin:0 auto;
			width: 550px;
			line-height: 160%;
			font-family: Verdana;
			font-size: 15px;
		}
	
	</style>				
</head>

<body>
	<div>
		<?php
			setlocale(LC_ALL, "pl_PL.UTF-8"); 
  			echo strftime("Bieżąca strefa czasowa: %Z<br />");
			echo strftime("Data: %d-%m-%Y<br />");
			echo strftime("Czas: %H:%M:%S<br />");
			echo strftime("Mamy %U tydzień i %j dzien roku.<br />");
			echo strftime("Dzisiaj jest %A, %d %B %Y r.<br />");
		?>
			
	</div>
		
</body>

</html>
