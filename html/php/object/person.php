<html lang="pl">
<head>
    <meta charset="UTF-8">
</head>
<body>
    <?php
    class Osoba
    {
        private $imie;
        private $nazwisko;
        public function setImie($im)
        {
            $this->imie = $im;
        }
        public function setNazwisko($naz)
        {
            $this->nazwisko = $naz;
        }
        public function getImie()
        {
            return $this->imie;
        }
        public function getNazwisko()
        {
            return $this->nazwisko;
        }
    }
    $o1 = new Osoba();
    $o1->setImie("Jan");
    $o1->setNazwisko("Kowalski");
    echo $o1->getImie() . " " . $o1->getNazwisko();
    ?>
</body>
</html>