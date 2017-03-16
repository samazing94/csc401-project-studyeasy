<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Explore_Classes.aspx.cs" Inherits="Student_View_Classes" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Explore Classes
    </title>
    <script src="../Scripts/jquery-3.1.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <link href="../Content/bootstrap.css" rel="stylesheet" />
    <link href="../Content/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="../Content/font-awesome.min.css" rel="stylesheet" />
    <link href="../Content/main.css" rel="stylesheet" />
    <link href="../Content/sticky_menu.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <div id="logo">
                <img src="/images/logo1.png" height="26" width="140" />
            </div>
            <ul class="menu">

                <li><a href="../Home page/default.aspx"><span class="glyphicon glyphicon-star"></span>Home</a>
                <li><a href="Lecture_Room.aspx"><span class="glyphicon glyphicon-education"></span>Lecture Room</a></li>
                <li><a href="Student_Account.aspx"><span class="fa fa-user-o"></span>My Account</a></li>
                <li class ="active"><a href="Explore_Classes.aspx"><span class="fa fa-institution"></span>Explore Classes</a>
                <li><a href="My_Classes.aspx"><span class="fa fa-book"></span>My Classes</a>
                <li><a href="/Login/Login_Page.aspx"><span class="fa fa-sign-out"></span>Log Out</a>
            </ul>
        </header>
        <div>
            <div class="container-fluid">
                <div class="row">

                    <div class="courseList">
                        <asp:DropDownList ID="ddl_Board" runat="server">
                            <asp:ListItem>Dhaka Board</asp:ListItem>
                            <asp:ListItem>Khulna Board</asp:ListItem>
                            <asp:ListItem>Edexcel</asp:ListItem>
                            <asp:ListItem>Cambridge</asp:ListItem>
                            <asp:ListItem>Madrasa</asp:ListItem>
                        </asp:DropDownList>
                        <asp:Button ID="btn_searchClasses" runat="server" Text="Search Classes" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
