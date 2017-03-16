<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,minimum-scale=1,initial-scale=1">
    <title>StudyEasy</title>
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
            <li><a href="default.aspx"><span class="glyphicon glyphicon-star"></span>Home</a>
            <li><a href="/Registration/registerAs.aspx"><span class="fa fa-user-plus"></span>Register</a>
            <li><a href="/Login/Login_Page.aspx"><span class="fa fa-user-o"></span>Login</a>
            <li class="active"><a href="Courses.aspx" class="active"><span class="fa fa-book"></span>Courses</a>
            <li><a href="Contact.aspx"><span class="fa fa-comment-o"></span>Contact</a>
        </ul>
    </header>
    <div class="container-fluid">
        <div class="row">
            <form id="form1" runat="server">
                <span id="c-title">What we currently have enlisted in our awesome portal </span>
                <div class ="aliz">
                <table class= "table table-striped table-hover">
                    <tr>
                        <th>Dhaka Board</th>
                        <th>Khulna Board</th>
                        <th>Madrasa</th>
                        <th>Cambridge</th>
                        <th>Edexcel</th>
                    </tr>
                    <tr>
                        <td>Introduction to Physics</td>
                        <td>Introduction to Physics</td>
                        <td>Introduction to Arabic</td>
                        <td>A Level Physics Unit 4</td>
                        <td>Core Maths 1</td>
                    </tr>
                    <tr>
                        <td>Introduction to Physics II</td>
                        <td>General Maths A</td>
                        <td>Islamic Studies</td>
                        <td>A Level Physics Unit 5</td>
                        <td>Core Maths 2</td>
                    </tr>
                    <tr>
                        <td>Electric Maths 1</td>
                        <td>General Maths B</td>
                        <td>N/A</td>
                        <td>English Literature</td>
                        <td>Chemistry Unit 1</td>
                    </tr>
                    <tr>
                        <td>Linear Algebra</td>
                        <td>N/A</td>
                        <td>Islamic Calendar</td>
                        <td>Electric Maths 1</td>
                        <td>Quantum Physics</td>
                    </tr>
                </table>
                    </div>
            </form>
        </div>

    </div>
</body>
</html>
