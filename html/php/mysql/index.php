<?php
	$servername = "localhost";
	$username = "user";
	$password = "";

	//Stworzenie polaczenia
	$conn = mysqli_connect($servername, $username, $password);

	//Sprawdzenie polaczenia
	if (!$conn){
		die("Połącznie nieudane: " . mysqli_connect_error());
	}
	echo "Pomyślnie połączono!";
?>
<html>
<body>



</body>
</html>
