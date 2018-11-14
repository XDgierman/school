Private Sub Form_Load()
  Dim strCos As String
  strCos = InputBox("Wpisz dowolny ciąg znaków", "Wczytywanie danych")
  If Len(strCos) = 0 Then
    MsgBox ("Nie wpisano żadnego znaku!")
  Else
    MsgBox ("Ktos wpisal: " & strCos)
  End If
End Sub
