<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Notifications.aspx.cs" Inherits="Instructor_Notifications" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Notifications</title>
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
                <li><a href="Course_List.aspx" class="active"><span class="fa fa-book"></span>Course List</a>
                <li class ="active"><a href="Notifications.aspx"><span class="fa fa-bolt"></span>Notifications</a>
                <li><a href="/Login/Login_Page.aspx"><span class="fa fa-sign-out"></span>Log Out</a>
            </ul>
        </header>
        <div class="container-fluid">
            <div class="row">
                <div class="title">
                <h2> <asp:Label ID="lbl_welcomeMsg" runat="server" Text="Welcome to the notification center, "></asp:Label></h2>

                </div>
            </div>
        </div>
    </form>
</body>
</html>
