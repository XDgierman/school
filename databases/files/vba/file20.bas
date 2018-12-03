Private Sub cmdUsunRekord_Click()
    Dim conn As ADODB.Connection
    Dim bytDecyzja As Byte, intIDsprzedazy As Integer
    Dim strQuery As String
    If Not IsNumeric(IDsprzedazy.Value) Then
        MsgBox ("Brak rekordu do usunięcia")
    Else
        Set conn = CurrentProject.Connection
        intIDsprzedazy = CInt(IDsprzedazy.Value)
        strQuery = "DELETE FROM Sprzedaze  WHERE IDsprzedazy = " & intIDsprzedazy & ""
        bytDecyzja = MsgBox("Czy na pewno chcesz usunąć bieżący rekord ?", vbQuestion + vbYesNo, "Hurtownia 1.0")
        If bytDecyzja = 6 Then
            'Uruchomienie zapytania DML
            conn.Execute strQuery
            MsgBox ("Rekord został usunięty")
            'Oświeżenie formularza
            Me.Requery
            conn.Close
            Set conn = Nothing
        End If
    End If
End Sub
