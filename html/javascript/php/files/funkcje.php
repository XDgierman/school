<?php
	function silnia($n){
		$wyn = 1;
		for ($i=1;$i<=$n;$i++){
			$wyn *= $i;
		}
		return $wyn;
	}
	function create($n){
		if (file_exists($n)){
			echo "<br> Plik istnieje."
		}else {touch($n);
		echo "<br> Wykonano polecenie.";
	}
	}
	function delete($n){
		if (unlink($n)){
			echo "<br> Operacja wykonana pomyślnie."
		} else {
			echo "<br> Operacja nieudana. Sprawdź poprawnośc nazwy."
		}
	}
?>
