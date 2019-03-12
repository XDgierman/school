		<?php
		$N = $_POST["t"];
		$wyn = 1;
		for ($i=1;$i<=$N;$i++){
			$wyn *= $i;
		}
		echo $wyn;
		?>
