<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Course_List.aspx.cs" Inherits="Class_Course_List" %>

<!DOCTYPE html>

<html>

<head runat="server">
    <title>Course List</title>
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
                <li><a href="Instructor_Account.aspx"><span class="fa fa-id-card-o"></span>Instructor Account</a>
                <li class="active"><a href="Course_List.aspx" class="active"><span class="fa fa-book"></span>Course List</a>
                <li><a href="My_Lectures.aspx"><span class="fa fa-book"></span>My Lectures</a>
                <li><a href="Notifications.aspx"><span class="fa fa-bolt"></span>Notifications</a>
                <li><a href="/Login/Login_Page.aspx"><span class="fa fa-sign-out"></span>Log Out</a>
            </ul>
        </header>
        <div class="container-fluid">
            <div class="row">

                <div class="courseList">
                    <asp:DropDownList ID="ddl_boards" runat="server">
                        <asp:ListItem>Dhaka Board</asp:ListItem>
                        <asp:ListItem>Khulna Board</asp:ListItem>
                        <asp:ListItem>Cambridge</asp:ListItem>
                        <asp:ListItem>Edexcel</asp:ListItem>
                        <asp:ListItem>Madrasa</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Button ID="btn_searchClasses" runat="server" Text="Search Classes" />

                </div>
            </div>
        </div>
    </form>
</body>
</html>
