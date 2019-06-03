<?php
 	session_start();

	echo "Identyfikator sesji = " . session_id();
	if(!isSet($_SESSION['test'])){
		$_SESSION['test']=123;
	}
	echo "<br> <a href='test.php'> Przejdź do podstrony test.php";
	echo "<br> <a href='usun.php'> Zakończ sesję";
	?>
