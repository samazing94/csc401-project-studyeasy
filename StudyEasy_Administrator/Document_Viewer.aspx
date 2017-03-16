<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Document_Viewer.aspx.cs" Inherits="StudyEasy_Administrator_Document_Viewer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #iframe_docViewer {
            z-index: 1;
            left: 10px;
            top: 15px;
            position: absolute;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        <iframe id="iframe_docViewer" runat="server" width="580px" height="650px"></iframe>
                
        <asp:TextBox ID="TextBox1" runat="server" style="z-index: 1; left: 464px; top: 18px; position: absolute; height: 40px; width: 120px;" ReadOnly="True"></asp:TextBox>
    </div>
        <p>
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Pictures/image.png" style="z-index: 1; left: 10px; top: 13px; position: absolute; height: 657px; width: 585px" />
        </p>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="z-index: 1; left: 601px; top: 367px; position: absolute" Text="Button" />
    </form>
</body>
</html>
