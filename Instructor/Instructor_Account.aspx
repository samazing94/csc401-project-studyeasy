<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Instructor_Account.aspx.cs" Inherits="Account_Instructor_Account" %>

<!DOCTYPE html>

<html>

<head runat="server">
    <title>Instructor Account</title>
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
                 <li class ="active"><a href="Instructor_Account.aspx"><span class="fa fa-id-card-o"></span>Instructor Account</a></li>
                <li>
                    <asp:LinkButton ID="lnkBtn_newClass" runat="server" OnClick="lnkBtn_newClass_Click"><span class ="fa fa-plus"></span>New Class</asp:LinkButton></li>
                <li>
                    <asp:LinkButton ID="lnkBtn_notifications" runat="server" OnClick="lnkBtn_notifications_Click"><span class ="fa fa-bolt"></span> Notifications</asp:LinkButton></li>

                <li>
                    <asp:LinkButton ID="lnkbtn_mylectures" runat="server" OnClick="lnkbtn_mylectures_Click"><span class ="fa fa-book"></span>My Lectures</asp:LinkButton></li>
                <li>
                    <asp:LinkButton ID="lnkbtn_logOut" runat="server" OnClick="lnkbtn_logOut_Click"><span class ="fa fa-sign-out"></span>Log Out</asp:LinkButton></li>
            </ul>
        </header>
        <div class="container-fluid">
            <div class="row">


                <div class="welcome">
                    <asp:Label ID="lbl_Welcome" runat="server"></asp:Label>
                </div>



                <div class="profile">
                    <h3><u>Personal Information</u></h3>
                    <div class="text-left">
                        <label for="lbl_instName">Name:</label>
                        <asp:Label ID="lbl_instName" runat="server" class="text-left"></asp:Label>
                    </div>
                    <div class="text-left">
                        <label for="lbl_email">Email:</label>
                        <asp:Label ID="lbl_email" runat="server" class="text-left"></asp:Label>
                    </div>
                    <div class="text-left">
                        <label for="lbl_PN">Phone Number:</label>
                        <asp:Label ID="lbl_PN" runat="server" class="text-left"></asp:Label>
                    </div>
                    <div class="text-left">
                        <label for="lbl_bankName">Bank Name:</label>
                        <asp:Label ID="lbl_bankName" runat="server" class="text-left"></asp:Label>
                    </div>
                    <div class="text-left">
                        <label for="lbl_bankAN">Bank Account Number:</label>
                        <asp:Label ID="lbl_bankAN" runat="server" class="text-left"></asp:Label>
                    </div>
                    <div class="text-left">
                        <label for="lbl_Address">Address:</label>
                        <asp:Label ID="lbl_Address" runat="server" class="text-left"></asp:Label>
                    </div>
                    <div class="text-left">
                        <label for="lbl_DOB">Date of Birth:</label>
                        <asp:Label ID="lbl_DOB" runat="server" class="text-left"></asp:Label>
                    </div>

                    <div class="text-left">
                        <label for="Label8">Link to CV:</label>
                        <asp:LinkButton ID="lnkBtn_resume" runat="server" class="text-left" Text="LinkButton"></asp:LinkButton>
                    </div>

                </div>
            </div>

        </div>
    </form>
</body>

</html>
