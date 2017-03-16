<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login_Page.aspx.cs" Inherits="Login_Login_Page" %>

<style>
    form {
        max-width: 700px;
        margin: 100px auto;
        background-color: rgba(220,220,220, .5);
        padding: 3em 6em;
    }
</style>
<html>
<head runat="server">
    <title>Login</title>
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

            <li><a href="../Home Page/default.aspx"><span class="glyphicon glyphicon-star"></span>Home</a>
            <li><a href="../Registration/RegisterAs.aspx"><span class="fa fa-user-plus"></span>Register</a>

            <li><a href="../Home Page/courses.aspx"><span class="fa fa-book"></span>Courses</a>
            <li><a href="../Home Page/Contact.aspx"><span class="fa fa-comment-o"></span>Contact</a>
            <li class ="active"><a href="Login_Page.aspx"><span class="fa fa-user-o"></span>Login</a>
        </ul>
    </header>
    <div class="container-fluid">
        <div class="row">
            <form id="form1" runat="server">

                <div class="form-group">
                    <label for="tb_userID">User ID:</label>
                    <asp:TextBox ID="tb_userID" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="tb_Password">Password:</label>
                    <asp:TextBox ID="tb_Password" runat="server" TextMode="Password" class="form-control"></asp:TextBox>
                </div>
                <p>
                    <asp:RadioButton ID="rbtn_student" runat="server" Text="I am a student" GroupName="Teacher_Or_Student" />
                    <asp:RadioButton ID="rbtn_instructor" runat="server" Text="I am an instructor" GroupName="Teacher_Or_Student" />
                </p>
                <p>
                    <asp:Button ID="btn_Login" runat="server" OnClick="btn_Login_Click" Text="Login" />
                    <asp:Button ID="btn_register" runat="server" OnClick="btn_register_Click" Text="Register" />
                </p>

                <p>
                    <asp:Label ID="label_invalidUser" runat="server" Style="z-index: 1; left: 27px; top: 186px; position: absolute; width: 278px" Text="Invalid User Name OR Password!!" ForeColor="#CC0000" Visible="False"></asp:Label>
                </p>
                <p>


                    <asp:Label ID="label_userNotSpecified" runat="server" Style="z-index: 1; left: 312px; top: 140px; position: absolute; width: 245px" Text="Please Select Who You Are" ForeColor="#CC0000" Visible="False"></asp:Label>
                </p>
            </form>
        </div>
    </div>
</body>
</html>
