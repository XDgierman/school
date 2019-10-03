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
        public function __construct()
        {
            echo "Konstruktor";
            $this->imie = "Jan";
            $this->nazwisko = "Kowalski";
        }
        public function getImie()
        {
            return $this->imie;
        }
        public function getNazwisko()
        {
            return $this->nazwisko;
        }
        public function __destruct()
        {
            echo "<br>Destruktor";
        }
    }
    $o1 = new Osoba();
    echo "<br>" . $o1->getImie() . " " . $o1->getNazwisko();
    ?>
</body>
</html>