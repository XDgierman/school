<?php
	$servername = "localhost";
	$username = "root";
	$password = "";
	$baza = "pierwsza";

	//Stworzenie polaczenia
	$conn = mysqli_connect($servername, $username, $password, $baza);

	//Sprawdzenie polaczenia
	if (!$conn){
		die("Połącznie nieudane: " . mysqli_connect_error());
	}
	echo "Pomyślnie połączono!";
	$sql="select * from uczen;";
	$res=mysqli_query($conn, $sql);
	if ($res){
		echo "<br>Tabela została otworzona";
		if (mysqli_num_rows($res) > 0) {
			while($columna = mysqli_fetch_assoc($res)) {
				
			}
		} else {
			echo "Brak rezultatów";
		}
		
	}
	else{
		echo "<br>Błąd otwierania tabeli: " . mysqli_error();
	}
?>
<html>
<body>
</body>
</html>
