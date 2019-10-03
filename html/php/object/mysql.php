<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
</head>
<body>
    <?php
    class database{
        private $conn;

        public function __construct($h,$u,$p,$d) {
            $conn = new mysqli($h,$u,$p,$d)
        }
        public function __destruct(){
            $conn->close();
        }
    }
    ?>
</body>
</html>