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
	$sql="select IDucznia, Imie, Nazwisko, Pesel, Klasa, Srednia, DataUr from uczen;";
	$res=mysqli_query($conn, $sql);
	if ($res){
		echo "<br>Tabela została otworzona";
		$data= $conn->query($sql);
		if ($data->num_rows > 0) {
			echo "<table border=2px style='border-collapse:collapse'>
				<tr>
					<th>IDucznia</th>
					<th>Imie</th>
					<th>Nazwisko</th>
					<th>Pesel</th>
					<th>Klasa</th>
					<th>Średnia</th>
					<th>Data urodzenia</th>
				</tr>";
			while($columna = $data->fetch_assoc()) {
				echo "<tr><td>" 
				. $columna["IDucznia"]
				. "</td><td>"
				. $columna["Imie"]
				. "</td><td>" 
				. $columna["Nazwisko"]
				. "</td><td>" 
				. $columna["Pesel"]
				. "</td><td>" 
				. $columna["Klasa"]
				. "</td><td>" 
				. $columna["Srednia"]
				. "</td><td>" 
				. $columna["DataUr"]
				. "</td></tr>";
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
