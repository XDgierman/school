Private Sub Form_Load()
  chkSterujPolami.Value = False
End Sub

Private Sub chkSterujPolami_Click()
  If chkSterujPolami.Value = True Then
    txtImie.Enabled = False
    txtNazwisko.Enabled = False
    txtMiasto.Enabled = False
  Else
    txtImie.Enabled = True
    txtNazwisko.Enabled = True
    txtMiasto.Enabled = True
  End If
End Sub
