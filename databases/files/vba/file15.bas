Public Sub ileRekordow(strNazwaTabeli As String)
    Dim conn As ADODB.Connection
    Dim rstTabela As ADODB.Recordset
    Dim i As Integer
    Set conn = CurrentProject.Connection
    Set rstTabela = New ADODB.Recordset
    rstTabela.Open strNazwaTabeli, conn
    'Obliczanie liczby rekordów w pętli
    i = 0
    Do Until rstTabela.EOF
        i = i + 1
        rstTabela.MoveNext
    Loop
    MsgBox ("Liczba rekordów w tabeli " & strNazwaTabeli & " to: " & i & "!")
    rstTabela.Close
    conn.Close
    Set rstTabela = Nothing
    Set conn = Nothing
End Sub
