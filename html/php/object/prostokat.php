<html lang="pl">
<head>
    <meta charset="UTF-8">
</head>
<body>
    <?php
    class Prostokat
    {
        private $a;
        private $b;
        public function __construct($x,$y) {
            $this->a = $x;
            $this->b = $y;
            echo "<br>Pole: " . $this->pole() . "<br>Obwód: " . $this->obwod();
        }
        public function pole()
        {
            return $a*$b;
        }
        public function obwod()
        {
            return (2*$a)+(2*$b);
        }
    }
    ?>
    <form action="$v= new Prostokat($numer1,$numer2);">
    A: <input type="number" name="numer1"><br>
    B: <input type="number" name="numer2"><br>
    <input type="submit" value="">
    </form>
</body>
</html>