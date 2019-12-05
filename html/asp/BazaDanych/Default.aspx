<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BazaDanych.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="style.css">
    <title></title>
</head>
<body>
    <div>
        <h1>Tabela "Klienci"</h1>
        <form id="form1" runat="server">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HurtowniaConnectionString %>" SelectCommand="SELECT * FROM Klienci"></asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="IDklienta" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="IDklienta" HeaderText="IDklienta" InsertVisible="False" ReadOnly="True" SortExpression="IDklienta" />
                    <asp:BoundField DataField="ImieKlienta" HeaderText="ImieKlienta" SortExpression="ImieKlienta" />
                    <asp:BoundField DataField="NazwiskoKlienta" HeaderText="NazwiskoKlienta" SortExpression="NazwiskoKlienta" />
                    <asp:BoundField DataField="IDwojewodztwa" HeaderText="IDwojewodztwa" SortExpression="IDwojewodztwa" />
                    <asp:BoundField DataField="KodPocztowyKlienta" HeaderText="KodPocztowyKlienta" SortExpression="KodPocztowyKlienta" />
                    <asp:BoundField DataField="MiastoKlienta" HeaderText="MiastoKlienta" SortExpression="MiastoKlienta" />
                    <asp:BoundField DataField="UlicaKlienta" HeaderText="UlicaKlienta" SortExpression="UlicaKlienta" />
                    <asp:BoundField DataField="NrDomuKlienta" HeaderText="NrDomuKlienta" SortExpression="NrDomuKlienta" />
                </Columns>
            </asp:GridView>
        </form>
    </hr>
    Baza danych "Hurtownia"
    </div>
</body>
</html>
