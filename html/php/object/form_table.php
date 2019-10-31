<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <?php
    class Formularz
    {
        private $nazwa;
        private $cena;
        private $producent;
        private $kategoria;
        private $conn;
        public function __construct($nz,$cn,$pr,$kt) {
            $this->nazwa = $nz;
            $this->cena = $cn;
            $this->producent = $pr;
            $this->kategoria = $kt;
        }
        public function database_insert()
        {
            if($conn){
                $sqltable = "insert into rowery(Nazwa,CenaJednostkowa,Producent,Kategoria) values ('".$this->nazwa."','".$this->cena."','".$this->producent."','".$this->kategoria."');";
                $conn->query($sqltable);
                echo "<br>Dane zostały wprowadzone";
            } else die("<br>Połącznie nieudane: " . mysqli_connect_error());
            $conn->close();
        }
    };
    $conn = new mysqli("localhost","root","","fabryka");
    $conn->set_charset("utf8");
    $rower = "SELECT * FROM kategoriaroweru;";
    $nazwaprod = "SELECT * FROM producenci;";
    echo "<form action='form.php' method='POST'>
    Nazwa : <input type='text' name='nazwa'><br>
    Cena : <input type='text' name='cena'><br>
    Producent : <select name='producent'>";
    $data = $conn->query($nazwaprod)->fetchAll();
    foreach ($data as $row) {
        echo "<option value='". $row["IDproducenta"] .">" . $row["NazwaProducenta"] . "</option>"
    }
    ?>
</head>
<body>
    <form action="form.php" method="POST">
        Nazwa : <input type="text" name="nazwa"><br>
        Cena : <input type="text" name="cena"><br>
        Producent : <select name="producent">
            <option value="BMX">BMX</option>
            <option value="KROSS">KROSS</option>
        </select><br>
        Kategoria : <select name="kategoria">
            <option value="1">Rower górski</option>
            <option value="2">Rowery wyczynowy</option>
        </select><br>
        <input type="submit" value="Wprowadź"><br>
    </form>
    <?php
    if($_SERVER["REQUEST_METHOD"]=="POST"){
        $nz = $_POST['nazwa'];
        $cn = $_POST['cena'];
        $pr = $_POST['producent'];
        $kt = $_POST['kategoria'];
        if((is_null($nz) || $nz == "") || (is_null($cn) || $cn == "")){
            echo "Nie wprowadzono poprawnych danych<br>";
        }else {
                $o = new Formularz($nz,$cn,$pr,$kt);
                $o->database_insert();
            }
    }
    ?>
</body>
</html>