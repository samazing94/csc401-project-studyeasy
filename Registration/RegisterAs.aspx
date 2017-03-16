<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegisterAs.aspx.cs" Inherits="Account_RegisterAs" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Choose Registration</title>
    <script src="../Scripts/jquery-3.1.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <link href="../Content/bootstrap.css" rel="stylesheet" />
    <link href="../Content/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="../Content/font-awesome.min.css" rel="stylesheet" />
    <link href="../Content/main.css" rel="stylesheet" />
    <link href="../Content/sticky_menu.css" rel="stylesheet" />
</head>
<body>
    <header>
        <div id="logo">
            <img src="/images/logo1.png" height="26" width="140" />
        </div>
        <ul class="menu">

            <li><a href="../Home page/default.aspx"><span class="glyphicon glyphicon-star"></span>Home</a>
            <li class ="active"><a href="RegisterAs.aspx"><span class="fa fa-user-plus"></span>Register</a>
            <li><a href="/Login/Login_Page.aspx"><span class="fa fa-user-o"></span>Login</a>
            <li><a href="../Home page/courses.aspx"><span class="fa fa-book"></span>Courses</a>
            <li><a href="../Home page/Contact.aspx"><span class="fa fa-comment-o"></span>Contact</a>
        </ul>
    </header>
    <div class="container-fluid">
        <div class="row">
            <form id="form1" runat="server">
                <div class="title">
                    <h1>How Would You Like To Contribute?</h1>
                </div>
                <div class="selection">
                    <div class="teacher">
                        <div>Register as Instructor</div>
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Pictures/teacher.jpg" OnClick="ImageButton1_Click" />
                    </div>
                    <div class="student">
                        <div>Register as Student</div>
                        <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/Pictures/student.jpg" OnClick="ImageButton4_Click" />
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
