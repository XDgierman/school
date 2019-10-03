<html lang="pl">
<head>
    <meta charset="UTF-8">
</head>
<body>
    <?php
    class Test
    {
        public function __construct()
        {
            echo "<br>Konstruktor";
        }
        public function __destruct()
        {
            echo "<br>Destruktor";
        }
    }
    $t = new Test();
    ?>
</body>
</html>