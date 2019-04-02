<?php
	header("Content-type: image/png");
	$img=imagecreate(200,200);
	$orange=imagecolorallocate($img,220,210,60);
	$white=imagecolorallocate($img,225,225,225);
	$black=imagecolorallocate($img,0,0,0);
	imagefill($img,0,0,$black);
	imageline($img,100,100,190,190,$white);
	imagefilledarc($img,40,30,100,100,30,120,$white,IMG_ARC_PIE);
	imagearc($img,120,120,100,100,90,360,$white);
	imageellipse($img,180,20,20,20,$white);
	imagestring($img,5,0,0,'Tu jest tekst',$orange);
	imagepng($img);
?>
