<!DOCTYPE html>
<html lang="pl-PL" dir="ltr">
	<head>
		<link rel="stylesheet" href="style.css">
		<style>
		#main{
			width: 300px;
			height: 300px;
			background-color: yellow;
			border: inset 4px blue;
			text-align: center;
			position:relative;
		}
		.smol{
			margin: 8 auto;
			width: 50px;
			height: 50px;
			background-color: yellow;
			border: solid 4px white;
			opacity:0.3;
			float:left;
			text-align: center;
			position: relative;
		}
		.imgte{
			max-height:300px;
			max-width:300px
			margin: 0;
			position: absolute;
			top: 50%;
			left: 50%;
			-ms-transform: translate(-50%, -50%);
			transform: translate(-50%, -50%);
		}
		.smallimg{
			max-height:50px;
			max-width:50px;
			margin: 0;
			position: absolute;
			top: 50%;
			left: 50%;
			-ms-transform: translate(-50%, -50%);
			transform: translate(-50%, -50%);
		}
		button{
			margin: auto;
		}
		</style>
	</head>
	<body>
		<div class="container">
			<div class="baner">
				<h1 style="text-align:center">Baner</h1>
			</div>
			<div class="menu">
				<?php
					include 'menu.php';
				?>
			</div>
			<div class="content">
				<?php
					$p = "gallery";
					$index = 1;
					if ($k = opendir($p)){
						while (($f = readdir($k))!==false) {
							$pi=pathinfo($f);
							if($pi['extension']=="jpg" || $pi['extension']=="png" || $pi['extension']=="bmp"){
								if($index == 1){
									echo "<div id='main'><img class='imgte' src=".$p."/".$f."></div>";
								}
								echo "<div class='smol' id='z".$index."'><img id='z".$index."' class='smallimg' src=".$p."/".$f."></div>";
								//echo $f;
								$index++;
							}
						}
						echo $f;
						closedir($k);
					}
				?>
				<script src="jquery-3.3.1.js"></script>
				<script>
				$(document).ready(function() {
					$(".smallimg").click(function(){
						$(".imgte").attr("src",$(this).attr("src"));
						$(".imgte").css("max-height","300px");
						$(".imgte").css("max-width","300px");
					});
					$(".smol").mouseenter(function(){
						$(this).css({
							opacity : 1 ,
							height : "100px",
							width : "100px"
						})
							$(this).find(".smallimg").css("max-height","100px");
							$(this).find(".smallimg").css("max-width","100px");
					});
					$(".smol").mouseleave(function(){
							$(this).css({
								opacity : 0.3,
								height :"50px",
								width :"50px"
							})
							$(this).find(".smallimg").css("max-height","50px");
							$(this).find(".smallimg").css("max-width","50px");
					});
				});
			</script>
			</div>
			<div class="footer">
				footer
			</div>
		</div>
	</body>
</html>
