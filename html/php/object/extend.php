<?php
class Base
{
    protected $text;
    public function __construct() {
        $this->text = "Text added in Base function";
    }
}

class Extender extends Base
{
    function writeText()
    {
        return $this->text;
    }
}

$object = new Extender();

echo $object->writeText();
?>