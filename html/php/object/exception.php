<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
</head>
<body>
    <?php
    public function divide($a, $b)
    {
        if ($b == 0) {
            throw new Exception("Dzielenie przez zero!");
        }
        return $a / $b;
    }
    public function myPow($a, $b)
    {
        if ($b<0) {
            throw new Exception("Potęga musi być większa od zera!");
            
        } elseif (!is_int($b)) {
            throw new Exception("Potęga musi być liczbą całkowitą");
            
        }
        $w=1;
        for ($i=1; $i < $b; $i++) { 
            $w = $w * $a;
        }
        return $w;
    }
    ?>
</body>
</html>