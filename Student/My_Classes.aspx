<%@ Page Language="C#" AutoEventWireup="true" CodeFile="My_Classes.aspx.cs" Inherits="Student_My_Classes" %>

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
                <li><a href="Student_Account.aspx"><span class="fa fa-user-o"></span>My Account</a></li>
                <li><a href="Explore_Classes.aspx"><span class="fa fa-institution"></span>Explore Classes</a>
                <li class ="active"><a href="My_Classes.aspx"><span class="fa fa-book"></span>My Classes</a>
                <li><a href="/Login/Login_Page.aspx"><span class="fa fa-sign-out"></span>Log Out</a>
            </ul>
        </header>
        <div>
            <div class="container-fluid">

                <div class="course_content">
                    <label for="lbl_coursesInfo"></label>
                    <h2></><asp:Label ID="lbl_coursesInfo" runat="server" Font-Bold="True" Text="Label"></asp:Label></h2>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
