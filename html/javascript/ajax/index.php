<!DOCTYPE html>
<html>
  <head>
    <style>
      table,th,td {
        border : 1px solid black;
        border-collapse: collapse;
      }
      th,td {
        padding: 5px;
      }
    </style>
  </head>
  <body>
    <h2>Zbiór płyt CD</h2>
    <button type="button" onclick="loadDoc()">Pobierz zbiór</button>
    <br><br>
    <table id="demo"></table>
    <script>
      function loadDoc() {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
          if (this.readyState == 4 && this.status == 200) {
            myFunction(this);
          }
      };
      xhttp.open("GET", "cd_catalog.xml", true);
      xhttp.send();
        }
      function myFunction(xml) {
      var i;
      var xmlDoc = xml.responseXML;
      var table="<tr><th>Artist</th><th>Title</th><th>Country</th><th>Company</th><th>Price</th><th>Year</th></tr>";
      var x = xmlDoc.getElementsByTagName("CD");
      for (i = 0; i <x.length; i++) {
        table += "<tr><td>" +
        x[i].getElementsByTagName("ARTIST")[0].childNodes[0].nodeValue +
        "</td><td>" +
        x[i].getElementsByTagName("TITLE")[0].childNodes[0].nodeValue +
        "</td><td>" +
        x[i].getElementsByTagName("COUNTRY")[0].childNodes[0].nodeValue +
        "</td><td>" +
        x[i].getElementsByTagName("COMPANY")[0].childNodes[0].nodeValue +
        "</td><td>" +
        x[i].getElementsByTagName("PRICE")[0].childNodes[0].nodeValue +
        "$</td><td>" +
        x[i].getElementsByTagName("YEAR")[0].childNodes[0].nodeValue +
        "</td></tr>";
      }
      document.getElementById("demo").innerHTML = table;
      }
    </script>
  </body>
</html>
