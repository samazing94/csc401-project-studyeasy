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
            <li class="active"><a href="default.aspx"><span class="glyphicon glyphicon-star"></span>Home</a>
            <li><a href="../Registration/RegisterAs.aspx"><span class="fa fa-user-plus"></span>Register</a>
            <li><a href="../Login/Login_Page.aspx"><span class="fa fa-user-o"></span>Login</a>
            <li><a href="courses.aspx"><span class="fa fa-book"></span>Courses</a>
            <li><a href="Contact.aspx"><span class="fa fa-comment-o"></span>Contact</a>
        </ul>
    </header>
    <div>
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <div class="carousel-caption">
                        <h3 class="intro">Welcome to StudyEasy</h3>
                        <p class="subintro">Study anything cool from School at the leisure of your own home</p>
                    </div>
                    <img src="/images/bgimage.jpg">
                </div>
                <div class="item">
                    <div class="carousel-caption">
                        <h3 class="intro2">Why go to coachings?</h3>
                        <p class="subintro2">When you can just study at home?</p>
                    </div>
                    <img src="/images/bgimage1.jpg">
                </div>
                <div class="item">
                    <div class="carousel-caption">
                        <h3 class="intro3">At any time</h3>
                        <p class="subintro3">At any given place!</p>
                    </div>
                     <img src="/images/bgimage2.jpg">
                </div>
                <!-- Controls -->
                <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
        <div class="row">
            <form id="form1" runat="server">
            </form>
        </div>
    </div>
</body>
</html>
