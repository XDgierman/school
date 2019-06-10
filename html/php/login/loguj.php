<?php
	session_start();
	$txt="";
	if(isSet($_SESSION['log'])){
		header("location: index.php");
		exit;
	} else if(isSet($_POST['user']) && isSet($_POST['pass'])){
		if($_POST['user']=="janek" && $_POST['pass']=="zaq1@WSX"){
			$_SESSION['log']=$_POST['user'];
			header("location: index.php");
			exit;
		} else{
			$txt="Błędne dane logowania";
		}
	}
?>

<html>
	<body>
		<form action="loguj.php" method="POST">
			Login: <input type="text" name="user"><br/><br/>
			Hasło:<input type="password" name="pass"><br/><br/>
			<input type="submit" value="Zaloguj">
		</form>
		<?php
		echo $txt;
		?>
	</body>
</html>