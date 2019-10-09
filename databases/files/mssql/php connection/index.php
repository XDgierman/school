<!DOCTYPE html>
<html lang="pl">
<head>
	<title>SQL Server</title>
	<meta charset="utf-8" />
	<style type="text/css">
		h2, h3 {
			text-align: center;
		}
		h3 {
			color: green;
		}
	</style>	
</head>
<body>
	<?php
		$host = "host";
		$database = array("Database"=>"table");
		$link = sqlsrv_connect($host,$database);
		if(!$link){
				echo "<h2>BConnection Error!</h2>";
		}
		else{
			echo "<h2>Connection Aquired with SQL Server!</h2>";
			$query = "SELECT columnName FROM dbo.tableName";
			$wynik = sqlsrv_query($link, $query);
			if(!$wynik){
				echo "<h2>Query error!</h2>";
			}
			else {
				echo "<h2>Result:</h2>";
				while ($row = sqlsrv_fetch_array($wynik, SQLSRV_FETCH_ASSOC)) {
					echo "<h3>$row[columnName]</h3>";
				}
				sqlsrv_free_stmt($wynik);
			}
		}
		sqlsrv_close($link);
	?>
</body>
</html>
