<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "fabryka";

try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    $sql = "SELECT * FROM pracownicy";
    $data = $conn->query($sql)->fetchAll();
    foreach ($data as $row) {
        echo $row['IDpracownika'] . " " .
        $row['Imie'] . " " .
        $row['Nazwisko'] . " " .
        $row['Pesel'] . " " .
        $row['Ulica'] . " " .
        $row['KodPocztowy'] . " " .
        $row['Miasto'] . " " .
        $row['Zawod'] . "<br>";
    }
    }
catch(PDOException $e)
    {
    echo $sql . "<br>" . $e->getMessage();
    }

$conn = null;
?>