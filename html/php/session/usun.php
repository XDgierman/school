<?php
	session_start();
	echo "Sesja zakończona :)";
	if(isSet($_SESSION['test'])){
		unset($_SESSION['test']);
	}
	session_destroy();
	?>
