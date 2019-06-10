<?php
$timestamp =time();
$cookie_name['user'] = "użytkowniku";
$cookie_name['count'] = "licznik";
$cookie_value = date("F d, Y H:i:s");
setcookie("$cookie_name[user]", "$cookie_value", time() + (86400 * 30), "/");

?>
<html>
<body>

<?php
if(!isset($_COOKIE[$cookie_name['user']])) {
		echo "Witaj '" . $cookie_name['user'] . "' ! Jeszcze ciebie tu nie było!";
		setcookie("$cookie_name[count]", 0, time() + (86400 * 30), "/");
		}
 else {
	$cookie_count = $_COOKIE[$cookie_name['count']] + 1;
	setcookie("$cookie_name[count]", "$cookie_count", time() + (86400 * 30), "/");
		echo "Witaj '" . $cookie_name['user'] . "' !<br>";
		echo "Ostatnio odwiedziłeś nas: " . $_COOKIE[$cookie_name['user']];
		echo "<br> Liczba odwiedzin strony: " . $_COOKIE[$cookie_name['count']];
}
if (isset($_COOKIE['cookie_name'])) {
    foreach ($_COOKIE['cookie_name'] as $name => $value) {
        $name = htmlspecialchars($name);
        $value = htmlspecialchars($value);
        echo "$name : $value <br />\n";
    }
}
?>

</body>
</html>
