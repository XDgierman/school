<!doctype HTML>
<html>
<head>
<title>Samochody</title>

</head>
<body>
<?php
$t = date("H");
echo "<p> Godzina: ". $t;
echo ", and will give the following message:</p>";

if ($t < "10") {
		echo "Have a good morning!";
} elseif ($t < "20") {
		echo "Have a good day!";
} else {
		echo "Have a good night!";
}
?>

</body>
<html>
