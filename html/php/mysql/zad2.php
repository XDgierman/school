<html lang="pl-PL">
<head>
<?php

	$conn = mysqli_connect("localhost", "root", "", "hurtownia");

	if (!$conn){
		die("Połącznie nieudane: " . mysqli_connect_error());
	}
    $sql="select klienci.ImieKlienta, klienci.NazwiskoKlienta, klienci.UlicaKlienta, klienci.NrDomuKlienta, klienci.KodPocztowyKlienta, klienci.MiastoKlienta, wojewodztwa.NazwaWojewodztwa
    from klienci, wojewodztwa
    where klienci.IDwojewodztwa=wojewodztwa.IDwojewodztwa;";
	$res=mysqli_query($conn, $sql);
	if ($res){
		if (mysqli_num_rows($res) > 0) {
			echo "<table border=2px style='border-collapse:collapse'>
				<tr>
					<th>Imie</th>
					<th>Nazwisko</th>
					<th>Ulica</th>
					<th>Numer domu</th>
					<th>Kod Pocztowy</th>
                    <th>Miejscowość</th>
                    <th>Województwa<th>
				</tr>";
			while($columna = mysqli_fetch_assoc($res)) {
				echo "<tr><td>"
				. $columna["ImieKlienta"]
				. "</td><td>" 
				. $columna["NazwiskoKlienta"]
				. "</td><td>" 
				. $columna["UlicaKlienta"]
				. "</td><td>" 
				. $columna["NrDomuKlienta"]
				. "</td><td>" 
				. $columna["KodPocztowyKlienta"]
				. "</td><td>" 
				. $columna["MiastoKlienta"]
				. "</td><td>" 
				. $columna["NazwaWojewodztwa"]
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
</head>
<body>
</body>
</html>
