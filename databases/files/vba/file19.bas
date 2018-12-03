Public Sub SzukajPracownika()
    Dim conn As ADODB.Connection
    Dim rstPracownicy As ADODB.Recordset
    Dim strQuery As String, strWynik As String, strImie As String, strNazwisko As String
    strImie = InputBox("Podaj imię pracownika", "Hurtownia 1.0")
    strNazwisko = InputBox("Podaj nazwisko pracownika", "Hurtownia 1.0")
    If strImie = "" Or strNazwisko = "" Then
        MsgBox ("Nie podano pełnych danych!")
    Else
        Set conn = CurrentProject.Connection
        Set rstPracownicy = New ADODB.Recordset
        strQuery = "SELECT ImiePracownika, NazwiskoPracownika, DataZatrudnieniaPracownika FROM Pracownicy WHERE ImiePracownika =  '" & strImie & "' AND NazwiskoPracownika = '" & strNazwisko & "'"
        rstPracownicy.Open strQuery, conn, adLockReadOnly
        If rstPracownicy.RecordCount < 1 Then
            MsgBox ("Nie ma pracowników w bazie o tej kombinacji imienia i nazwiska!")
            Exit Sub
        Else
            Do Until rstPracownicy.EOF
                strWynik = strWynik & rstPracownicy!ImiePracownika & " " & rstPracownicy!NazwiskoPracownika & " " & rstPracownicy!DataZatrudnieniaPracownika & Chr(13)
                rstPracownicy.MoveNext
            Loop
            MsgBox ("Znaleziono: " & Chr(13) & strWynik)
            rstPracownicy.Close
            conn.Close
            Set rstPracownicy = Nothing
            Set conn = Nothing
        End If
     End If
End Sub
