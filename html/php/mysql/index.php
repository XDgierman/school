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
	$sql="create database if not exists pierwsza";
	$res= mysqli_query($conn, $sql);
	if ($res){
		echo "<br>Baza została utworzona";
	}
	else{
		echo "<br>Błąd tworzenia bazy: " . mysqli_error();
	}
?>
<html>
<body>
<br><a href="table.php">Stwórz tablicę</a>


</body>
</html>
