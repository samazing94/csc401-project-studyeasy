<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Add_New_Class.aspx.cs" Inherits="New_Class_Class_List" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="height: 851px">
    <form id="form1" runat="server">
    <div style="height: 847px">
    
        <asp:DropDownList ID="ddl_boards" runat="server" style="z-index: 1; left: 51px; top: 123px; position: absolute">
            <asp:ListItem>Dhaka Board</asp:ListItem>
            <asp:ListItem>Khulna Board</asp:ListItem>
            <asp:ListItem>Cambridge</asp:ListItem>
            <asp:ListItem>Edexcel</asp:ListItem>
            <asp:ListItem>Madrasa</asp:ListItem>
        </asp:DropDownList>
        <asp:Label ID="Label1" runat="server" style="z-index: 1; left: 50px; top: 98px; position: absolute; width: 101px" Text="Study Board:"></asp:Label>
        <asp:TextBox ID="tb_className" runat="server" style="z-index: 1; left: 168px; top: 122px; position: absolute; width: 166px; "></asp:TextBox>
        <asp:Button ID="btn_addClass" runat="server" style="z-index: 1; left: 359px; top: 121px; position: absolute" Text="Add Class" OnClick="btn_addClass_Click" />
        <asp:Label ID="lbl_noClsName" runat="server" ForeColor="#CC0000" style="z-index: 1; left: 50px; top: 289px; position: absolute; height: 19px" Text="Name Of The Class Is Required" Visible="False"></asp:Label>
    
        <asp:Label ID="lbl_invalidClassName" runat="server" ForeColor="#CC0000" style="z-index: 1; left: 50px; top: 264px; position: absolute; height: 19px" Text="Class Under This Board Already Exists" Visible="False"></asp:Label>
    
        <asp:Label ID="Label2" runat="server" style="z-index: 1; left: 171px; top: 98px; position: absolute; width: 130px" Text="Name Of Class:"></asp:Label>
    
        <asp:Label ID="lbl_success" runat="server" ForeColor="#009900" style="z-index: 1; left: 50px; top: 315px; position: absolute; height: 19px" Text="Class Has Been Added Successfully" Visible="False"></asp:Label>
    
    </div>
    </form>
</body>
</html>
