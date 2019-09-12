<?php
	$servername = "localhost";
	$username = "root";
	$password = "";

	//Stworzenie polaczenia
	$conn = mysqli_connect($servername, $username, $password);

	//Sprawdzenie polaczenia
	if (!$conn){
		die("Połącznie nieudane: " . mysqli_connect_error());
	}
	echo "Pomyślnie połączono!";

	mysqli_close($conn);
?>
<html>
<body>

</body>
</html>
