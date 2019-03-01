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
echo "<br><br>". date("Y/m/d") . "<br>";
echo date("Y.m.d") . "<br>";
echo date("l") . "<br>";
echo date("G:i:s") . "<br>";
echo date("h:i:s") . "<br>";
echo date("Y-m-d G:i:s") . "<br>";

$dni53= time() + (53*24*60*60);
echo "bierząca data: " . date("Y-m-d") . "<br>";
echo "data za 53 dni: " . date("Y-m-d", $dni53) . "<br>";
$data = getdate();
echo "seconds: " . $data["seconds"] . "<br>minutes: " . $data["minutes"] . "<br>hours: " . $data["hours"] . "<br>mday: "  . $data["mday"] . "<br>wday: " . $data["wday"] . "<br>mon: " . $data["mon"] . "<br>year: " . $data["year"] . "<br>yday: " . $data["yday"] . "<br>weekday: " . $data["weekday"] . "<br>month: " . $data["month"] . "<br>unix (0): " . $data["0"] . "<br>";
?>

</body>
<html>
