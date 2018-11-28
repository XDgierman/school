Public Sub SzukajRowerow()
  Dim conn As ADODB.Connection
  Dim rstRowery As ADODB.Recordset
  Dim strQuery As String, strWynik As String
  Set conn = CurrentProject.Connection
  Set rstRowery = New ADODB.Recordset
  strQuery = "SELECT NazwaRoweru, CenaJednostkowa FROM Rowery WHERE CenaJednostkowa < 1500"
  rstRowery.Open strQuery, conn
  Do Until rstRowery.EOF
    strWynik = strWynik & rstRowery!NazwaRoweru & "" & rstRowery!CenaJednostkowa & Chr(13)
    rstRowery.MoveNext
    Loop
  MsgBox ("Znalezione rowery: " & Chr(13) & strWynik)
  rstRowery.Close
  conn.Close
  Set rstRowery = Nothing
  Set conn = Nothing
End Sub
