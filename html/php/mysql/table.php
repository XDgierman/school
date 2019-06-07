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
	$sql="create table if not exists osoba(
		id int not null auto_increment,
		imie varchar(20),
		nazwisko varchar(20),
		primary key(id)
) engine=InnoDB character set=utf8";
	$res=mysqli_query($conn, $sql);
	if ($res){
		echo "<br>Tabela została utworzona";
	}
	else{
		echo "<br>Błąd tworzenia tabeli: " . mysqli_error();
	}
?>
<html>
<body>



</body>
</html>
