<?php
$timestamp =time();
$cookie_name = "użytkowniku";
$cookie_value = date("F d, Y H:i:s");
setcookie($cookie_name, $cookie_value, time() + (86400 * 30), "/");
$i=0;
?>
<html>
<body>

<?php
if(!isset($_COOKIE[$cookie_name])) {
		echo "Witaj '" . $cookie_name . "' ! Jeszcze ciebie tu nie było!";
		if ($i <= 0){
			$i=1;
		}
} else {
	$i=$i++;
		echo "Witaj '" . $cookie_name . "' !<br>";
		echo "Ostatnio odwiedziłeś nas: " . $_COOKIE[$cookie_name];
		echo "<br> Liczba odwiedzin strony: " . $i;
}
?>

</body>
</html>
