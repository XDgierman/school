<html>
<body>
<form name="form1" action="index2.php" method="POST">
    IDucznia: <input type="number" name="id"><br>
    Imię: <input type="text" name="im"><br>
    Nazwisko: <input type="text" name="nz"><br>
    Pesel: <input type="number" name="ps"><br>
    Klasa: <input type="text" name="kl"><br>
    Średnia: <input type="number" name="sr" step="0.01"><br>
    Data urodzenia: <input type="date" name="dt"><br>
    <input type="button" value="Zmień">
</form>
<?php
    if($_POST){
        $conn = mysqli_connect("localhost", "root", "", "pierwsza");
        if(!$conn){
            echo "Błąd połączenia"
        } else{
            $id= $_POST["id"];
            $im= $_POST["im"];
            $nz= $_POST["nz"];
            $ps= $_POST["ps"];
            $kl= $_POST["kl"];
            $sr= $_POST["sr"];
            $dt= $_POST["dt"];
            
            $sql="update uczen set
            Imie='$im'",
            Nazwisko=''
        }
    }
?>
<?php
	$conn = mysqli_connect("localhost", "root", "", "pierwsza");

	if (!$conn){
		die("Połącznie nieudane: " . mysqli_connect_error());
    }
    else{
	echo "Pomyślnie połączono!";
	$sql="select * from uczen;";
	$res=mysqli_query($conn, $sql);
	if ($res){
		if (mysqli_number_rows($res) > 0) {
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
			while($columna = mysqli_fetch_assoc($res)) {
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
    }
?>
</body>
</html>
