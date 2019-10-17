<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <?php
    class Formularz
    {
        private $imie;
        private $nazwisko;
        private $pesel;
        private $ulica;
        private $kod;
        private $miasto;
        private $zawod;
        private $conn;
        public function __construct($im,$nz,$ps,$ul,$kd,$ms,$zw) {
            $this->imie = $im;
            $this->nazwisko = $nz;
            $this->pesel = $ps;
            $this->ulica = $ul;
            $this->kod = $kd;
            $this->miasto = $ms;
            $this->zawod = $zw;
        }
        public function database_insert()
        {
            $conn = new mysqli("localhost","root","","fabryka");
            if($conn){
                $conn->query("insert into pracownicy(Imie,Nazwisko,Pesel,Ulica,KodPocztowy,Miasto,Zawod) values ('".$this->imie."','".$this->nazwisko."','".$this->pesel."','".$this->ulica."','".$this->kod."','".$this->miasto."')','".$this->zawod.";");
            } else die("<br>Połącznie nieudane: " . mysqli_connect_error());
            $conn->close();
        }
    };
    ?>
</head>
<body>
    <form action="form.php" method="POST">
        Imie : <input type="text" name="imie"><br>
        Nazwisko : <input type="text" name="nazwisko"><br>
        Pesel : <input type="text" name="pesel"><br>
        Ulica : <input type="text" name="ulica"><br>
        Kod pocztowy : <input type="text" name="kod"><br>
        Miasto : <input type="text" name="miasto"><br>
        Zawod : <input type="text" name="zawod"><br>
        <input type="submit" value="Wprowadź"><br>
    </form>
    <?php
    if($_SERVER["REQUEST_METHOD"]=="POST"){
        $im = $_POST['imie'];
        $nz = $_POST['nazwisko'];
        $ps = $_POST['pesel'];
        $ul = $_POST['ulica'];
        $kd = $_POST['kod'];
        $ms = $_POST['miasto'];
        $zw = $_POST['zawod'];
        echo "Test : ". $ps . " " . $kd ."<br>";
        if((is_null($im) || $im == "") || (is_null($nz) || $nz == "") || (is_null($ps) || $ps == "") || (is_null($ul) || $ul == "") || (is_null($kd) || $kd == "") || (is_null($ms) || $ms == "") || (is_null($zw) || $zw == "")){
            echo "Nie wprowadzono poprawnych danych<br>";
        }else {
            echo "Test : ". $ps . " " . $kd ."<br>";
            if(preg_match('/^[0-9]{11}$/',$ps) && preg_match('/^[0-9]{2}\-[0-9]{3}$/',$kd)){
                $o = new Formularz($im,$nz,$ps,$ul,$kd,$ms,$zw);
                $o->database_insert();
                echo "Dane zostały wprowadzone<br>";
            } else echo "Kod pocztowy lub pesel nie są zgodne<br>";
        }
    }
    ?>
</body>
</html>