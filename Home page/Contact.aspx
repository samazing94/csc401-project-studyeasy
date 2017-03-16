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
            <li><a href="default.aspx"><span class="glyphicon glyphicon-star"></span><span class="menu-label">Home</span></a>
            <li><a href="Registration/RegisterAs.aspx"><span class="fa fa-user-plus"></span><span class="menu-label">Register</span></a>
            <li><a href="/Login/Login_Page.aspx"><span class="fa fa-user-o"></span><span class="menu-label">Login</span></a>
            <li><a href="courses.aspx"><span class="fa fa-book"></span><span class="menu-label">Courses</span></a>
            <li class="active"><a href="Contact.aspx"><span class="fa fa-comment-o"></span><span class="menu-label">Contact</span></a>
        </ul>
    </header>
    <div class="container-fluid">
        <div class="row">
            <form id="form1" runat="server">
                <div class="ali">
                    <div class="profile-card col-sm-6 col-md-4">
                        <div class="thumbnail">
                            <img src="../images/sam.jpg">
                            <div class="caption">
                                <h3>Samina Hossain-Jamil</h3>
                                <p>Design Enthusiast Dwarf Lassy, Computer Science, 1421163</p>
                                <p><a href="https://www.facebook.com/saminaxhossain" class="btn btn-primary" role="button">Facebook</a> <a href="mailto:samina.hossain@outlook.com" class="btn btn-default" role="button">E-mail</a></p>
                            </div>
                        </div>
                    </div>

                    <div class="profile-card col-sm-6 col-md-4">
                        <div class="thumbnail">
                            <img src="../images/shahriar1.jpg">
                            <div class="caption">
                                <h3>Shahriar Rahman Dipon</h3>
                                <p>The Numeric Magician Guy, Computer Science, 1321533</p>
                                <p><a href="https://www.facebook.com/shahriar.rahman.5036?fref=ufi" class="btn btn-primary" role="button">Facebook</a> <a href="mailto:shahriar294@gmail" class="btn btn-default" role="button">E-mail</a></p>
                            </div>
                        </div>
                    </div>
                    <div class="profile-card col-sm-6 col-md-4">
                        <div class="thumbnail">
                            <img src="../images/nafi.jpg">
                            <div class="caption">
                                <h3>Nafi Uz Zaman</h3>
                                <p>Slim-C Sharp Maniac Shady, Computer Science, 1310552</p>
                                <p><a href="https://www.facebook.com/nafi.zaman.180" class="btn btn-primary" role="button">Facebook</a> <a href="mailto:zamannafi@yahoo.com" class="btn btn-default" role="button">E-mail</a></p>
                            </div>
                        </div>
                    </div>

                    <div class="profile-card col-sm-6 col-md-4">
                        <div class="thumbnail">
                            <img src="../images/towsif.jpg">
                            <div class="caption">
                                <h3>Towsif Zahin Khan</h3>
                                <p>Game Dev Macho Baldy, Computer Science, 1410703</p>
                                <p><a href="https://www.facebook.com/SaitenHazard?pnref=story" class="btn btn-primary" role="button">Facebook</a> <a href="mailto:ankondrift@gmail" class="btn btn-default" role="button">E-mail</a></p>
                            </div>
                        </div>
                    </div>

                    <div class="profile-card col-sm-6 col-md-4">
                        <div class="thumbnail">
                            <img src="../images/tusher.jpg">
                            <div class="caption">
                                <h3>Shairil Hossain Tusher</h3>
                                <p>Marathon Programmer Simple Man, Computer Science, 1430853</p>
                                <p><a href="https://www.facebook.com/shairilhossaintusher" class="btn btn-primary" role="button">Facebook</a> <a href="mailto:tusher@gmail" class="btn btn-default" role="button">E-mail</a></p>
                            </div>
                        </div>
                    </div>

                </div>
            </form>
        </div>
    </div>
</body>
</html>
