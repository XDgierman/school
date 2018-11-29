Public Sub SzukajRowerow()
    Dim conn As ADODB.Connection
    Dim rstRowery As ADODB.Recordset
    Dim strQuery As String, strWynik As String, strKryterium As String
    strKryterium = InputBox("Podaj nazwę roweru", "Hurtownia 1.0")
    If strKryterium = "" Then
        MsgBox ("Nie podano nazwy roweru!")
    Else
        Set conn = CurrentProject.Connection
        Set rstRowery = New ADODB.Recordset
        strQuery = "SELECT NazwaRoweru, CenaJednostkowa FROM Rowery WHERE NazwaRoweru =  '" & strKryterium & "'"
        rstRowery.Open strQuery, conn, adLockReadOnly
        If rstRowery.RecordCount < 1 Then
            MsgBox ("Nie ma rowerów w bazie o tej nazwie!")
            Exit Sub
        Else
            Do Until rstRowery.EOF
                strWynik = strWynik & rstRowery!NazwaRoweru & " " & rstRowery!CenaJednostkowa & "zł" & Chr(13)
                rstRowery.MoveNext
            Loop
            MsgBox ("Rowery o nazwie " & strKryterium & " mają cenę: " & Chr(13) & strWynik)
            rstRowery.Close
            conn.Close
            Set rstRowery = Nothing
            Set conn = Nothing
        End If
     End If
End Sub
