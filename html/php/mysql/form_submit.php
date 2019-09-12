<!doctype HTML>
<html>
        <head>
                <meta charset="UTF-8">
                <script src="jquery-3.3.1.js"></script>
        <style>
 
        </style>
</head>
<body>
<form action="form_submit.php" method="post">
  Imie: <input type="text" name="im"><br>
  Nazwisko: <input type="text" name="nz"><br>
  PESEL:<input type="number" name="pesel"><br>
  Klasa:<input type="text" name="kl"><br>
  Średnia<input type="number" step="0.01" name="sr"><br>
  Data urodzenia:<input type="date" name="data"><br>
  <input type="submit" value="Submit">
</form>
<?php
if($_POST){
        $im = $_POST['im'];
        $nz = $_POST['nz'];
        $pesel = $_POST['pesel'];
        $kl = $_POST['kl'];
        $sr = $_POST['sr'];
        $data = $_POST['data'];
        if(preg_match('/^[0-9]{11}$/', $pesel) & $sr>1 & $sr<6 & $im!='' & $nz!='' & $sr!='' & $im!=''){
		$sqltable = "insert into uczen(Imie,Nazwisko,Pesel,Klasa,Srednia,DataUr) values ('".$im."','".$nz."','".$pesel."','".$kl."','".$sr."','".$data."');";
		echo $sqltable;
        
        
$servername = "localhost";
$username = "root";
$password = "";
$unit = "pierwsza";
 
// Create connection
$conn = mysqli_connect($servername, $username, $password, $unit);
// Check connection
if (!$conn){
	die("<br>Połącznie nieudane: " . mysqli_connect_error());
}
 
if (mysqli_query($conn, $sqltable)) {
    echo "<br>Dane wprowadzono pomyślnie";
} else {
    echo "<br>Nieudane wprowadzanie danych: " . mysqli_error($conn);
}
 
mysqli_close($conn);
        
        
}else echo "<br>Zostały podane złe dane";
}