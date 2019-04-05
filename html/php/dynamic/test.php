<?php
	header("Content-type: image/png");
	$a=1;
	$bars = array(1,8,5,4,9);
	$img=imagecreate(200,200);
	$orange=imagecolorallocate($img,220,210,60);
	$white=imagecolorallocate($img,225,225,225);
	$black=imagecolorallocate($img,0,0,0);
	imagefill($img,0,0,$black);
	imageline($img,20,20,20,180,$white);
	imageline($img,20,180,180,180,$white);
	foreach ($bars as $value) {
		imagefilledrectangle($img,20+(10*$a),180,30+(10*$a),180-($value*10),$white);
		$a+=2;
	}
	imagepng($img);
?>
