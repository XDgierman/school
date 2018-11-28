Public Sub SzukajKlienta()
    Dim conn As ADODB.Connection
    Dim rstKlienci As ADODB.Recordset
    Dim strQuery As String, strWynik As String, strKryterium As String
    strKryterium = InputBox("Podaj nazwę miasta", "Hurtownia 1.0")
    If strKryterium = "" Then
        MsgBox ("Nie podano nazwy miasta!")
    Else
        Set conn = CurrentProject.Connection
        Set rstKlienci = New ADODB.Recordset
        strQuery = "SELECT NazwiskoKlienta, ImieKlienta FROM Klienci WHERE MiastoKlienta =  '" & strKryterium & "'"
        rstKlienci.Open strQuery, conn, adLockReadOnly
        If rstKlienci.RecordCount < 1 Then
            MsgBox ("Nie ma klientów w bazie z tej miejscowości!")
            Exit Sub
        Else
            Do Until rstKlienci.EOF
                strWynik = strWynik & rstKlienci!ImieKlienta & " " & rstKlienci!NazwiskoKlienta & Chr(13)
                rstKlienci.MoveNext
            Loop
            MsgBox ("Z miasta " & strKryterium & " znaleziono: " & Chr(13) & strWynik)
            rstKlienci.Close
            conn.Close
            Set rstKlienci = Nothing
            Set conn = Nothing
        End If
     End If
End Sub
