<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <?php
    class Formularz
    {
        private $imie, $nazwisko, $pesel, $ulica, $kod, $miasto, $zawod;
        public function __construct($im,$nz,$ps,$ul,$kd,$ms,$zw) {
            $this->imie = $im;
            $this->nazwisko = $nz;
            $this->pesel = $ps;
            $this->ulica = $ul;
            $this->kod = $kd;
            $this->miasto = $ms;
            $this->zawod = $zw;
        }
    }
    ?>
</head>
<body>
    <form action="form.php" method="post">
        <input type="text" name="imie"><br>
        <input type="text" name="nazwisko"><br>
        <input type="text" name="pesel"><br>
        <input type="text" name="ulica"><br>
        <input type="text" name="kod"><br>
        <input type="text" name="miasto"><br>
        <input type="text" name="zawod"><br>
    </form>
    <?php
    if($_SERVER["REQUEST_METHOD"]=="post"){
        if((is_null($im) || $im = "") || (is_null($nz) || $nz = "") || (is_null($ps) || $ps = "") || (is_null($ul) || $ul = "") || (is_null($kd) || $kd = "") || (is_null($ms) || $ms = "") || (is_null($zw) || $zw = "")){

        }else if(preg_match('/^[0-9]{11}$/',$ps) & preg_match('/^[0-9]{2}\-[0-9]{3}$/',$kd))
    }
    ?>
</body>
</html>