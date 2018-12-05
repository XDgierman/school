Private Sub cmdDodajRekord_Click()
    Dim con As ADODB.Connection
    Dim strNazwaKategorii As String, bytDecyzja As Byte, strQuery As String

    If IsNull(txtNazwaKategorii.Value) Or txtNazwaKategorii.Value = "" Then
       MsgBox ("Nie podano nazwy kategorii")
       txtNazwaKategorii.SetFocus
    Else
       strNazwaKategorii = txtNazwaKategorii.Value
       bytDecyzja = MsgBox("Czy na pewno chcesz dodać ten rekord?", vbQuestion + vbYesNo, "Hurtownia")
       If bytDecyzja = 6 Then
          Set con = CurrentProject.Connection
          strQuery = "INSERT INTO KategorieRowerow (NazwaKategorii) VALUES " _
          & "('" & strNazwaKategorii & "')"
          con.Execute strQuery
          MsgBox ("Rekord został dodany")
       Else
          Exit Sub
       End If
    End If
End Sub
