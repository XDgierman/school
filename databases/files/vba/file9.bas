Public Function CenaNetto(curCena As Currency, bytStawkaVAT As Byte) As Currency
  CenaNetto = curCena - (curCena * (bytStawkaVAT/100))
End Function

Private Sub cmdCenaNetto_Click()
  Dim curWynik As Currency
  curWynik = CenaNetto(CenaJednostkowa.Value, 23)
  MsgBox("Cena netto tego roweru to " & curWynik & " zł")
End Sub
