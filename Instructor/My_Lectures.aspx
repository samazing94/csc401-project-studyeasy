<%@ Page Language="C#" AutoEventWireup="true" CodeFile="My_Lectures.aspx.cs" Inherits="Instructor_My_Lectures" %>

<!DOCTYPE html>

<html>

<head runat="server">
    <title>My Lectures</title>
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
                <li class="active"><a href="My_Lectures.aspx"><span class="fa fa-book"></span>My Lectures</a>
                <li><a href="Notifications.aspx"><span class="fa fa-bolt"></span>Notifications</a>
                <li><a href="/Login/Login_Page.aspx"><span class="fa fa-sign-out"></span>Log Out</a>
            </ul>
        </header>
        <div class="container-fluid">
            <div class="row">

                <div id="my_lecture">
                </div>
            </div>
        </div>
        <p>
                    <asp:Label ID="lbl_Welcome" runat="server" Text="Label" style="z-index:0;"></asp:Label>
                </p>
    </form>
</body>
</html>
