<?php
	session_start();
	echo "Skrypt w pliku test.php";
	if(isSet($_SESSION['test'])){
		echo "<br>Zmienna sesji = " . $_SESSION['test'];
	}
	echo "<br> <a href='index.php'> Powrót";
	echo "<br> <a href='usun.php'> Zakończ sesję";
	?>
