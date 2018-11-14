Public Sub LiczbaRekordow(strTabela As String, intLiczba As Integer)
    MsgBox "(W tabeli " & strTabela & " mamy " & intLiczba & " rekordów!")
End Sub

Private Sub cmdLiczbaRekordow_Click()
  Call LiczbaRekordow("Klienci",11)
End Sub
