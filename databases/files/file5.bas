Private Sub Form_Load()
    Dim i As Integer
    i = 10
    Do While i > 0
        MsgBox ("Odliczanie w pętli: " & i)
        txtWynik.Value = txtWynik.Value & i & " "
        i = i - 1
    Loop
End Sub
