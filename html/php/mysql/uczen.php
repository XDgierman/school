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
	$sql="create table if not exists uczen(
		IDucznia int(5) not null auto_increment,
		Imie varchar(20) not null,
		Nazwisko varchar(20) not null,
		Pesel int(11) not null,
		Klasa varchar(5) not null,
		Srednia decimal(6,2),
		DataUr date not null,
		primary key(IDucznia)
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
