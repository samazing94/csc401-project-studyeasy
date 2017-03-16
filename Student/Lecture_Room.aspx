<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Lecture_Room.aspx.cs" Inherits="Student_Lecture_Room" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Lecture Room</title>
    <style type="text/css">
        #iframe_docViewer {
            z-index: 1;
            left: 564px;
            top: 110px;
            position: absolute;
        }

        #form1 {
            height: 100%;
        }
    </style>
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
                <li>
                    <a href="Student_Account.aspx"><span class="fa fa-user-o"></span>My Account</a></li>
                <li class ="active"><a href="Lecture_Room.aspx"><span class="glyphicon glyphicon-education"></span>Lecture Room</a></li>
                <li><a href="Explore_Classes.aspx"><span class="fa fa-institution"></span>Explore Classes</a>
                <li><a href="My_Classes.aspx"><span class="fa fa-book"></span>My Classes</a>
                <li><a href="/Login/Login_Page.aspx"><span class="fa fa-sign-out"></span>Log Out</a>
            </ul>
        </header>
        <div class="container-fluid">
            <div class="row">
                <div class="title">
                    <h1>
                        <asp:Label ID="Label1" runat="server" Text="Welcome To The Lecture Room"></asp:Label></h1>
                </div>
                <div class="course_content">
                    <div>
                        <label for="lbl_crsName">Course Name:</label>
                        <asp:Label ID="lbl_crsName" runat="server" Text="Label"></asp:Label>
                    </div>
                    <div>
                        <label for="lbl_Board">Board:</label>
                        <asp:Label ID="lbl_Board" runat="server" Text="Label"></asp:Label>
                    </div>
                    <div>
                        <label for="lbl_inst_ID">Instructor:</label>
                        <asp:Label ID="lbl_inst_ID" runat="server" Text="Label"></asp:Label>
                    </div>
                    <div>
                        <label for="lbl_lctNum">Lecture Number:</label>
                        <asp:Label ID="lbl_lctNum" runat="server" Text="Label"></asp:Label>
                    </div>
                    <div>
                        <label for="lbl_Desc">Lecture Description:</label>
                        <asp:Label ID="lbl_Desc" runat="server" Text="Label"></asp:Label>
                    </div>

                    <p>
                        <asp:Label ID="Label7" runat="server" Text="Video Lecture"></asp:Label></p>
                    <p>
                        <asp:Label ID="Label8" runat="server" Text="Lecture Documents:" Font-Underline="True"></asp:Label></p>



                    <video runat="server" style="border-style: solid; width: 100%; height: 340px" controls id="vdo_mediaPlayer">
                        <source type="video/mp4" />
                    </video>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
