<?php
 	session_start();

	if(!isSet($_SESSION['log'])){
		header("location: loguj.php");
		exit;
	}
	?>
<html>
	<body>
		<?php
			echo $_SESSION['log'];
		?>
		<a href="wyloguj.php">Wyloguj</a>
	</body>
</html>