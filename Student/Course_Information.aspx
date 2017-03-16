<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Course_Information.aspx.cs" Inherits="Student_Course_Information" %>

<!DOCTYPE html>

<html>

<head runat="server">
    <title>Course Information</title>
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
                    <li class="active"><a href="Course_Information.aspx"><span class ="fa fa-cc-discover"></span>Course Information</a></li>
                <li>
                    <asp:LinkButton ID="lnk_home" runat="server" OnClick="lnk_home_Click"><span class ="fa fa-user-o"></span>My Account</asp:LinkButton></li>

                <li><a href="Explore_Classes.aspx"><span class="fa fa-institution"></span>Explore Classes</a>
                <li><a href="My_Classes.aspx"><span class="fa fa-book"></span>My Classes</a>
                <li><a href="/Login/Login_Page.aspx"><span class="fa fa-sign-out"></span>Log Out</a>
            </ul>
        </header>
        <div class="container-fluid">
            <div class="row">

                <asp:Label ID="lbl_enrolled" runat="server" Font-Bold="False" Style="left: 10px; top: 440px; position: absolute" Text="You have successfully enrolled in this course" ForeColor="#00CC00" Visible="False" Font-Size="Large"></asp:Label>
                <asp:Label ID="lbl_notEnrolled" runat="server" Font-Bold="False" Style=" left: 10px; top: 480px; position: absolute" Text="Enrollment Unsuccessful. Check bank account number" ForeColor="Red" Visible="False" Font-Size="Large"></asp:Label>
                <asp:Label ID="lbl_alreadyEnrlled" runat="server" Font-Bold="False" Style=" left: 115px; top: 698px; position: absolute" Text="You have already enrolled in this course" ForeColor="Red" Visible="False" Font-Size="Large"></asp:Label>

                <asp:Label ID="lbl_checker" runat="server" Text="Label" Visible="False"></asp:Label>

            </div>

            <div class="course_content">
                <p>
                    <label for="lbl_crsName">Course Name:</label>
                    <asp:Label ID="lbl_crsName" runat="server" Text="Label" Font-Size="X-Large"></asp:Label>
                </p>
                <p>
                    <label for="lbl_board">Board:</label>
                    <asp:Label ID="lbl_board" runat="server" Text="Label" Font-Size="X-Large"></asp:Label>
                </p>
            </div>
            <div id="div_Transaction" runat="server">
                <div class="course_content1">
                    <p>
                        <asp:Label ID="lbl_stdID" runat="server" Font-Bold="False" Text="Label"></asp:Label>
                    </p>
                    <p>
                        <asp:Label ID="lbl_lctNum" runat="server" Text="Label"></asp:Label>
                    </p>
                    <p>
                        <asp:Label ID="lbl_enterBAccNum" runat="server" ForeColor="Maroon" Text="Label"></asp:Label>
                    </p>
                    <p>
                        <label for="lbl_enterBAccNum"></label>
                        <asp:TextBox ID="tb_bankAccNo" runat="server" ></asp:TextBox>
                    </p>
                    <asp:Button ID="btn_Done" runat="server" Style=" left: 13.7%; position: absolute" Text="Done" OnClick="btn_Done_Click" />
                    <asp:Button ID="btn_Cancel" runat="server" Style=" left: 22%; position: absolute; right: 402px" Text="Cancel" />
                </div>
            </div>
        </div>

    </form>
</body>
</html>
