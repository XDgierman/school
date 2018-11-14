'kod na kalkulator z zabezpieczeniem na wypadek dzielenia przez zero
Dim dblWynik As Double

Private Sub SprawdzDane(strZnak As String)
    If txtliczba1.Value = "" Then
       MsgBox ("Brak danych w polu Liczba 1!")
       txtliczba1.SetFocus
       Exit Sub
    ElseIf txtliczba2.Value = "" Then
       MsgBox ("Brak danych w polu Liczba 2!")
       txtliczba2.SetFocus
       Exit Sub
    Else
       If IsNumeric(txtliczba1.Value) = False Then
            MsgBox ("Dana w polu Liczba 1 nie jest liczbą!")
            txtliczba1.SetFocus
            Exit Sub
        ElseIf IsNumeric(txtliczba2.Value) = False Then
            MsgBox ("Dana w polu Liczba 2 nie jest liczbą!")
            txtliczba2.SetFocus
            Exit Sub
        Else
            Select Case strZnak
                Case "+"
                    dblWynik = CDbl(txtliczba1.Value) + CDbl(txtliczba2.Value)
                    lblWynik.Caption = dblWynik
                Case "-"
                    dblWynik = CDbl(txtliczba1.Value) - CDbl(txtliczba2.Value)
                    lblWynik.Caption = dblWynik
                Case "*"
                    dblWynik = CDbl(txtliczba1.Value) * CDbl(txtliczba2.Value)
                    lblWynik.Caption = dblWynik
                 Case "/"
                 If txtliczba2.Value = 0 Then
                 MsgBox ("Pamiętaj cholero, nie dziel przez zero!")
                 txtliczba2.SetFocus
                 Else
                    dblWynik = CDbl(txtliczba1) / CDbl(txtliczba2)
                    lblWynik.Caption = dblWynik
                End If
            End Select
        End If
    End If
End Sub


Private Sub Form_Load()
    txtliczba1.Value = ""
    txtliczba2.Value = ""
    lblWynik.Caption = ""
End Sub

Private Sub cmdce_Click()
    txtliczba1 = ""
    txtliczba2 = ""
    lblWynik.Caption = ""
End Sub

Private Sub cmddodawanie_Click()
    Call SprawdzDane("+")
End Sub

Private Sub cmddzielenie_Click()
    Call SprawdzDane("/")
End Sub

Private Sub cmdmnozenie_Click()
    Call SprawdzDane("*")
End Sub

Private Sub cmdodejmowanie_Click()
    Call SprawdzDane("-")
End Sub
