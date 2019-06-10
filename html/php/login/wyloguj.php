<?php
	session_start();
	echo "Sesja zakończona :)";
	if(isSet($_SESSION['log'])){
		unset($_SESSION['log']);
	} else{
		header("location: loguj.php");
		exit;
	}
	session_destroy();
	?>
