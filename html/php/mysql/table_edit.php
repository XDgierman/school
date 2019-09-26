<!DOCTYPE html>
<html>
        <head>
                <link rel="stylesheet" type="text/css" href="style.css">
        </head>
        <body>
                <?php
                        if($_SERVER["REQUEST_METHOD"] == "POST")
                        {
                                if( isset($_POST["wb"]) && !isset($_POST["Dodaj"]))
                                {
                                        $con = mysqli_connect("localhost","root","","szkola");
                                        if($con==false)
                                        {
                                                echo "<br>Błąd połączenia";
                                        }
                                        else
                                        {
                                                $sql = "select * from uczen where id=".$_POST["wb"];
                                                $ret = mysqli_query($con,$sql);
                                                                                                if(mysqli_num_rows($ret)>0)
                                                {
                                                        $row = mysqli_fetch_assoc($ret);
                                                        $imi=$row["Imie"];
                                                        $nzw=$row["Nazwisko"];
                                                        $ps=$row["PESEL"];
                                                        $kl=$row["Klasa"];
                                                        $sr=$row["Srednia"];
                                                        $dt=$row["DataUr"];
                                                        $id_p=$row["id"];
                                                }
                                        }
                                }
                        }
                ?>
                <form name="form1" id = "form1" action="new 6.php" method="POST">
                Wybierz ucznia: <select name="wb" onchange = "document.getElementById('form1').submit();">
                <?php
                        $con = mysqli_connect("localhost","root","","szkola");
                        if($con==false)
                        {
                                echo "<br>Błąd połączenia";
                        }
                        else
                        {
                                $sql = "select * from uczen;";
                                $ret = mysqli_query($con,$sql);
                                $inx=1;
                                if(mysqli_num_rows($ret)>0)
                                {
                                        while($row = mysqli_fetch_assoc($ret))
                                        {
                                                if(isset($id_p) && $id_p==$inx)
                                                echo "<option selected value='".$row["id"]."'> ".$row["Imie"]." ".$row["Nazwisko"]."</option>";
                                                else
                                                        echo "<option value='".$row["id"]."'> ".$row["Imie"]." ".$row["Nazwisko"]."</option>";
                                                        
                                        
                                                ++$inx;
                                        }
                                }
                        }
                ?>
                        </select>
                        <br><br>
                        <br><br>
                        Imie:<input type="text" name="im" value = <?php if(isset($imi)) echo $imi; else echo ""; ?>><br><br>
                        Nazwisko:<input type="text" name="nz" value = <?php if(isset($nzw)) echo $nzw; else echo ""; ?>><br><br>
                        PESEL:<input type="number" name="ps" value = <?php if(isset($ps)) echo $ps; else echo ""; ?>><br><br>
                        Klasa:<input type="text" name="kl" value = <?php if(isset($kl)) echo $kl; else echo ""; ?>><br><br>
                        Średnia:<input type="number" step = "0.01" name="sr" value = <?php if(isset($sr)) echo $sr; else echo ""; ?>><br><br>
                        Data urodzenia:<input type="date" name="dt" value = <?php if(isset($dt)) echo $dt; else echo ""; ?>><br><br>
                        <input type="submit" name="Dodaj" value="Zmodyfikuj"><br><br>
                </form>
 
                        <?php
                        if($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["Dodaj"]))
                        {
                                $im = $_POST["im"];
                                $nz = $_POST["nz"];
                                $ps = $_POST["ps"];
                                $kl = $_POST["kl"];
                                $sr = $_POST["sr"];
                                $dt = $_POST["dt"];
                                $id = $_POST["wb"];
                                        
                                $con = mysqli_connect("localhost","root","","szkola2");
                                if($con)
                                {
 
                                        $sql = "UPDATE uczen SET
                                        Imie = '$im', Nazwisko = '$nz' , PESEL = '$ps', Klasa = '$kl',Srednia = '$sr',DataUr ='$dt'  WHERE id = $id";
                                                        
                                        $ret=mysqli_query($con,$sql);
                                        if($ret)
                                        {
                                                echo "<br>Rekord zmodyfikowany";
                                        }
                                                        
                                                        mysqli_close($con);
                                                }
                                                else
                                                {
                                                        echo "Nie połączył się do bazy";
                                                }
                                        }
                                ?>
 
        </body>
</html>