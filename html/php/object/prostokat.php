<html lang="pl">
<head>
    <meta charset="UTF-8">
    <?php
    class Prostokat
    {
        private $a;
        private $b;
        public function __construct($x,$y) {
            $this->a = $x;
            $this->b = $y;
        }
        public function pole()
        {
            return $this->a*$this->b;
        }
        public function obwod()
        {
            return (2*$this->a)+(2*$this->b);
        }
    }
    ?>
</head>
<body>
    <form action="prostokat.php" method="POST">
    A: <input type="number" name="numer1"><br>
    B: <input type="number" name="numer2"><br>
    <input type="submit" name="Oblicz" value="Oblicz">
    </form>
    <?php
    if($_SERVER["REQUEST_METHOD"]=="POST" && isset($_POST["Oblicz"])){
        $o1= new Prostokat($_POST["numer1"],$_POST["numer2"]);       
    echo "<br>Pole: " . $o1->pole() . "<br>Obwód: " . $o1->obwod();
}
    ?>
</body>
</html>