<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "fabryka";

try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    $sql = "INSERT INTO klienci_test (Imie, Nazwisko, Email)
    VALUES ('John', 'Doe', 'john@example.com')";
    $conn->exec($sql);
    echo "New record created successfully";
    }
catch(PDOException $e)
    {
    echo $sql . "<br>" . $e->getMessage();
    }

$conn = null;
?>