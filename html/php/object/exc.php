<?php
/*
napisz klasę o nazwie figura która ma dwie składowe A i B zabezpieczone (protected)
następnie zdefiniuj klasy pochodne kwadrat i prostokąt.
w klasach zdefiniuj metody pole i obwód oraz konstruktor wypełniający składowe A i B.
następnie zdefiniuj obiekty klasy kwadrat i prostokąt przy użyciu konstruktorów dwu-parametrowych oraz wykonaj metody pole i obwód
*/
class Figura
{
    protected $a, $b;
}
class Kwadrat extends Figura
{
    public function __construct($x) {
        $this->a = $x;
    }
    public function pole()
    {
        return $this->a * $this->a;
    }
    public function obwod()
    {
        return 4 * $this->a;
    }
}
class Prostokat extends Figura
{
    public function __construct($x,$y) {
        $this->a = $x;
        $this->b = $y;
    }
    public function pole()
    {
        return $this->a * $this->b;
    }
    public function obwod()
    {
        return 2 * $this->a + 2 * $this->b;
    }
}
$prost = new Prostokat(3,2);
$kwadr = new Kwadrat(3);
echo $prost->pole();
?>