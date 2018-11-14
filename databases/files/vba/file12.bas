Private Sub cmdWczytaj_Click()
  Dim strImie As String
  Do
    strImie = InputBox("Podaj swoje imię", "Wczytywanie danych")
  Loop While (strImie="")
  txtImie.SetFocus
  txtImie.Value=strImie
End Sub
