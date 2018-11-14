Private Sub cmdZamknij_Click()
  Dim strDecyzja As String
  strDecyzja = MsgBox("Czy zamknąć formularz?", vbQuestion+vbYesNo, "Tytuł")
  If strDecyzja = vbYes Then
    DoCmd.Close
  End If
End Sub

Private Sub cmdZamknij_Click()
  Dim bytDecyzja As Byte
  bytDecyzja = MsgBox("Czy zamknąć formularz?", 32 + 4, "Tytuł")
  If bytDecyzja = 6 Then
    DoCmd.Close
  End If
End Sub
