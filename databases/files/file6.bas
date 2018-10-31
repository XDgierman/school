Private Sub Form_Load()
    Dim i As Integer
    i = 10
    Do Until i < 1
        MsgBox ("Odliczanie w pętli: " & i)
        txtWynik.Value = txtWynik.Value & i & " "
        i = i - 1
    Loop
End Sub
