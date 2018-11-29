Public Sub SzukajPracownika()
    Dim conn As ADODB.Connection
    Dim rstPracownik As ADODB.Recordset
    Dim strQuery As String, strWynik As String, strKryterium1 As String, strKryterium2 As String
    strKryterium1 = InputBox("Podaj imię pracownika", "Hurtownia 1.0")
    strKryterium2 = InputBox("Podaj nazwisko pracownika", "Hurtownia 1.0")
    If strKryterium1 = "" Then
        MsgBox ("Nie podano imienia pracownika!")
    Else If strKryterium1 = "" Then
        MsgBox ("Nie podano nazwiska pracownika!")
    Else
        Set conn = CurrentProject.Connection
        Set rstPracownik = New ADODB.Recordset
        strQuery = "SELECT ImiePracownika, NazwiskoPracownika, DataZatrudnieniaPracownika FROM Pracownicy WHERE ImiePracownika =  '" & strKryterium1 & "' AND NazwiskoPracownia = '" & strKryterium2 & "'"
        rstPracownik.Open strQuery, conn, adLockReadOnly
        If rstPracownik.RecordCount < 1 Then
            MsgBox ("Nie ma pracowników w bazie o tej kombinacji imienia i nazwiska!")
            Exit Sub
        Else
            Do Until rstPracownik.EOF
                strWynik = strWynik & rstPracownik!ImiePracownika & " " & rstPracownik!NazwiskoPracownika & rstPracownik!DataZatrudnieniaPracownika & Chr(13)
                rstKlienci.MoveNext
            Loop
            MsgBox ("Znaleziono: " & Chr(13) & strWynik)
            rstPracownik.Close
            conn.Close
            Set rstPracownik = Nothing
            Set conn = Nothing
        End If
     End If
End Sub
