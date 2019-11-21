<!DOCTYPE html> 
<html lang="pl">

<head>
	<title> Język PHP </title>
	<meta charset="UTF-8" />
	<link rel="stylesheet" type="text/css" href="style.css" />
</head>

<body>
	<div>
		<h3> Prosty pokaz slajdów </h3>
		<img src="elementy/separator.png" />
		<?php
  			#Tworzenie identyfikatora obrazka
  			if (!isset($_GET["img_id"])) {
     				$obrazek_id = 0;  //Po pierwszym uruchomieniu skryptu
  			}
  			else {
     				$obrazek_id = $_GET["img_id"]; #//Po wywołaniu skryptu przyciskami Poprzedni|Nastepny
  			}

 			#Odczytanie zawartości katalogu i utworzenei tablicy $lista
  			$katalog = "./grafiki";
  			$lista = scandir($katalog);
  			array_shift($lista); # Usunięcie elementu "."
  			array_shift($lista); # Usunięcie elementu ".."
  
			#Obliczenie liczby obrazków w katalogu
  			$count = count($lista);
  			
			#Nawigacja obrazków w przód
  			if ($obrazek_id < $count - 1) {
				$nastepny = $obrazek_id + 1;
  			}
  			else {
     				$nastepny = $count - 1;
  			}

  			#Nawigacja obrazków w tył
  			if ($obrazek_id > 0) {
     				$poprzedni = $obrazek_id - 1;
  			}
  			else {
     				$poprzedni = 0;
  			}
  
			#Ustalenie nazwy obrazka i jego wyświetlenie
  			$nazwa_obrazka = $lista["$obrazek_id"];
  			echo " <img src=\"$katalog/$nazwa_obrazka\"> ";
  			$obrazek_id++;
  			echo " <p>Obraz $obrazek_id z $count<br/></p> ";
  			echo " <a href=\"newindex.php?img_id=$poprzedni\">Poprzedni</a> | ";
  			echo " <a href=\"newindex.php?img_id=$nastepny\">Następny</a> ";
		?>
	</div>
</body>
</html>
