<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
</head>
<body>
    <form action="form_table2.php" method="post">
    <?php
    $conn = new mysqli("localhost","root","","hurtownia");
    $conn->set_charset("utf8");
    $woj = "SELECT * FROM `wojewodztwa`;";
    echo "Wojewodztwo: <select name='wojewodztwa'>";
    $data = $conn->query($woj)->fetch_assoc();
    while ($row=$data) {
        echo "<option value='". $row["IDwojewodztwa"] .">" . $row["NazwaWojewodztwa"] . "</option>";
    }
    echo "</select><br>";
    ?>
    <input type="submit"></button>
    </form>
    <?php
    if($_SERVER["REQUEST_METHOD"]=="POST"){
        $wj = $_POST['wojewodztwa'];
        $conn = new mysqli("localhost","root","","hurtownia");
        $conn->set_charset("utf8");
        $sql = "SELECT `klienci`.`ImieKlienta`, `klienci`.`NazwiskoKlienta`, `wojewodztwa`.`NazwaWojewodztwa`
        FROM `wojewodztwa`
            LEFT JOIN `klienci` ON `klienci`.`IDwojewodztwa` = `wojewodztwa`.`IDwojewodztwa`
            WHERE `klienci`.`IDwojewodztwa` = " . $wj . ";";
        $data = $conn->query($sql)->fetch_assoc();
        if ($data->num_rows > 0) {
			echo "<br><table border=2px style='border-collapse:collapse'>
				<tr>
					<th>Imię Klienta</th>
					<th>Nazwisko Klienta</th>
					<th>Nazwa Województwa</th>
				</tr>";
			while($columna = $data->fetch_assoc()) {
				echo "<tr><td>" 
				. $columna["ImieKlienta"]
				. "</td><td>"
				. $columna["NazwiskoKlienta"]
				. "</td><td>" 
				. $columna["NazwaWojewodztwa"]
				. "</td></tr>";
			}
		} else {
			echo "Brak rezultatów";
		}
    }
    ?>
</body>
</html>