Private Sub cmdDodajRekord_Click()
    Dim con As ADODB.Connection
    Dim strNazwisko As String, strImie As String, strWojewodztwo As String
    Dim strKodPocztowy As String, strMiasto As String, strUlica As String
    Dim strNumerDomu As String, bytDecyzja As Byte, strQuery As String

    If IsNull(txtImie.Value) Or txtImie.Value = "" Then
       MsgBox ("Nie podano imienia klienta")
       txtImie.SetFocus
    ElseIf IsNull(txtNazwisko.Value) Or txtNazwisko.Value = "" Then
       MsgBox ("Nie podano nazwiska klienta")
       txtNazwisko.SetFocus
    ElseIf IsNull(txtWojewodztwo.Value) Or txtWojewodztwo.Value = "" Then
       MsgBox ("Nie wybrano województwa klienta")
       optWojewodztwo.SetFocus
    ElseIf IsNull(txtKodPocztowy.Value) Or txtKodPocztowy.Value = "" Then
       MsgBox ("Nie podano kodu pocztowego klienta")
       txtKodPocztowy.SetFocus
    ElseIf IsNull(txtMiasto.Value) Or txtMiasto.Value = "" Then
       MsgBox ("Nie podano miasta klienta")
       txtMiasto.SetFocus
    ElseIf IsNull(txtUlica.Value) Or txtUlica.Value = "" Then
       MsgBox ("Nie podano ulicy klienta")
       txtUlica.SetFocus
    ElseIf IsNull(txtNumerDomu.Value) Or txtNumerDomu.Value = "" Then
       MsgBox ("Nie podano numeru domu klienta")
       txtNumerDomu.SetFocus
    Else
       strImie = txtImie.Value
       strNazwisko = txtNazwisko.Value
       strWojewodztwo = txtWojewodztwo.Value
       strKodPocztowy = txtKodPocztowy.Value
       strMiasto = txtMiasto.Value
       strUlica = txtUlica.Value
       strNumerDomu = txtNumerDomu.Value
       bytDecyzja = MsgBox("Czy na pewno chcesz dodać ten rekord?", vbQuestion + vbYesNo, "Hurtownia")
       If bytDecyzja = 6 Then
          Set con = CurrentProject.Connection
          strQuery = "INSERT INTO Klienci (ImieKlienta, NazwiskoKlienta, IDWojewodztwa, " _
                     & "KodPocztowyKlienta, MiastoKlienta, UlicaKlienta, NrDomuKlienta) " _
                     & "VALUES ('" & strImie & "','" & strNazwisko & "','" & strWojewodztwo & "'," _
                     & "'" & strKodPocztowy & "','" & strMiasto & "','" & strUlica & "'," _
                     & "'" & strNumerDomu & "')"
          con.Execute strQuery
          MsgBox ("Rekord został dodany")
       Else
          Exit Sub
       End If
    End If

End Sub
