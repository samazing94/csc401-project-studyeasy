<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Student_Account.aspx.cs" Inherits="Account_Student_Account" %>

<!DOCTYPE html>

<html>

<head runat="server">
    <title>Student Account</title>
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
                <li class ="active"><a href="Student_Account.aspx"><span class="fa fa-user-o"></span>My Account</a></li>
                    <li><asp:LinkButton ID="lnkBtn_myClasses" runat="server" OnClick="lnkBtn_myClasses_Click"><span class="fa fa-book"></span>My Classes</asp:LinkButton></li>
                <li>
                    <asp:LinkButton ID="lnkBtn_explrCls" runat="server" OnClick="lnkBtn_explrCls_Click"><span class="fa fa-institution"></span>Explore Classes</asp:LinkButton></li>
                <li>
                    <asp:LinkButton ID="lnkbtn_logOut" runat="server" OnClick="lnkbtn_logOut_Click"><span class="fa fa-sign-out"></span>Log Out</asp:LinkButton>

            </ul>
        </header>
        <div class="container-fluid">
            <div class="row">

                <div class="welcome">
                    <label for="lbl_Welcome" runat="server"></label>
                    <asp:Label ID="lbl_Welcome" runat="server" Text="Welcome to the student account,"></asp:Label>
                </div>
            </div>

            <div class="profile">
                <h3><u>Personal Information</u></h3>
                <div class="text-left">
                    <label for="lbl_stdName">Name:</label>
                    <asp:Label ID="lbl_stdName" runat="server" class="text-left"></asp:Label>
                </div>
                <div class="text-left">
                    <label for="lbl_email">Email:</label>
                    <asp:Label ID="lbl_email" runat="server" class="text-left"></asp:Label>
                </div>
                <div class="text-left">
                    <label for="lbl_grdName">Guardian Name:</label>
                    <asp:Label ID="lbl_grdName" runat="server" class="text-left"></asp:Label>
                </div>
                <div class="text-left">
                    <label for="lbl_grdnRelation">Relationship with Guardian:</label>
                    <asp:Label ID="lbl_grdnRelation" runat="server" class="text-left"></asp:Label>
                    <div class="text-left">
                        <label for="lbl_stdPN">Student Phone Number:</label>
                        <asp:Label ID="lbl_stdPN" runat="server" class="text-left"></asp:Label>
                    </div>
                    <div class="text-left">
                        <label for="lbl_grdnPN">Guardian Phone Number:</label>
                        <asp:Label ID="lbl_grdnPN" runat="server" class="text-left"></asp:Label>
                    </div>
                    <div class="text-left">
                        <label for="lbl_bankName">Bank Name:</label>
                        <asp:Label ID="lbl_bankName" runat="server" class="text-left"></asp:Label>
                    </div>
                    <div class="text-left">
                        <label for="lbl_bankAccNum">Bank Account Number:</label>
                        <asp:Label ID="lbl_bankAccNum" runat="server" class="text-left"></asp:Label>
                    </div>
                    <div class="text-left">
                        <label for="lbl_Address">Address:</label>
                        <asp:Label ID="lbl_address" runat="server" class="text-left"></asp:Label>
                    </div>
                    <div class="text-left">
                        <label for="lbl_DOB">Date of Birth:</label>
                        <asp:Label ID="lbl_DOB" runat="server" class="text-left"></asp:Label>
                    </div>

                </div>
            </div>

        </div>
    </form>
</body>
</html>
