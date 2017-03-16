<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Instructor_Registration.aspx.cs" Inherits="Registration_Instructor_Registration" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Instructor Registration</title>
    <script src="../Scripts/jquery-3.1.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <link href="../Content/bootstrap.css" rel="stylesheet" />
    <link href="../Content/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="../Content/font-awesome.min.css" rel="stylesheet" />
    <link href="../Content/main.css" rel="stylesheet" />
    <link href="../Content/sticky_menu.css" rel="stylesheet" />
    <style>
        form {
            max-width: 700px;
            margin: 100px auto;
            background-color: rgba(220,220,220, .5);
            padding: 3em 6em;
        }
    </style>
</head>
<body>
   <header>
        <div id="logo">
            <img src="/images/logo1.png" height="26" width="140" />
        </div>  
        <ul class="menu">
      
            <li><a href="/Home Page/Default.aspx"><span class="glyphicon glyphicon-star"></span>Home</a>
            <li><a href="/Registration/registerAs.aspx"><span class="fa fa-user-plus"></span>Register</a>
            <li><a href="/Login/Login_Page.aspx"><span class="fa fa-user-o"></span>Login</a>
            <li><a href="/Home Page/courses.aspx"><span class="fa fa-book"></span>Courses</a>
            <li><a href="/Home Page/Contact.aspx"><span class="fa fa-comment-o"></span>Contact</a>
        </ul>
    </header>
    <div class="container-fluid">
        <div class="row">
            <form id="form1" runat="server">
                  <h1>Instructor Registration</h1>
                <div class="form-group">
                    <label for="tb_userID">User ID:</label>
                    <asp:TextBox ID="tb_userID" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                   <label for="tb_password">Password:</label>
                    <asp:TextBox ID="tb_password" runat="server" TextMode="Password" class="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="tb_email">Email:</label>
                    <asp:TextBox ID="tb_email" runat="server" TextMode="Email" class="form-control"></asp:TextBox>

                </div>
                <div class="form-group">
                    <label for="tb_fname">First Name:</label>
                    <asp:TextBox ID="tb_fname" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for = "tb_lname">Last Name:</label>
                    <asp:TextBox ID="tb_lname" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="tb_phone">Phone Number:</label>
                    <asp:TextBox ID="tb_phone" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="bname">Bank Name:</label>
                </div>
                <asp:RadioButton ID="rbtn_StdCh" runat="server" GroupName="bank;" Text="Standard Chartered" />
                <asp:RadioButton ID="rbtn_BA" runat="server"  GroupName="bank;" Text="Bank Asia" />
                <asp:RadioButton ID="rbtn_EBl" runat="server"  GroupName="bank;" Text="EBL" />
                <div> <p>    </p></div>
                <div class="form-group">
                    <label for="tb_bAccNum">Bank Account Number:</label>
                    <asp:TextBox ID="tb_bAccNum" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="tb_address">Address:</label>
                    <asp:TextBox ID="tb_address" runat="server" class="form-control"></asp:TextBox>

                </div>
                <div class="form-group">
                    <label for="tb_dob">Date Of Birth:</label>
                    <asp:TextBox ID="tb_dob" runat="server" TextMode="Date" Text="YYYY/MM/DD" CssClass ="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="tb_linktoCV">Link To CV:</label>
                  <asp:TextBox ID="tb_linktoCV" runat="server" TextMode="Url" CssClass ="form-control"></asp:TextBox>
                </div>


                
                <div>
                    <asp:Button ID="btn_Submit" runat="server" OnClick="btn_Submit_Click" Text="Submit" />
                </div>
                <div>
                    <p class="bg-danger">
                       <asp:Label ID="lbl_invalidID" runat="server" ForeColor="Yellow" Text="User ID already exists!" style="left: 38%; top: 10%; position: absolute" Visible="False"></asp:Label>
                    </p>
                </div>
                <div>
                     <p class="bg-danger">
                         <asp:Label ID="lbl_emptyFields" runat="server" ForeColor="Yellow" Text="Please ensure that all fields have been filled" style="left: 38%; top: 10%; position: absolute" Visible="False"></asp:Label>
                         <asp:Label ID="lbl_invalidPass" runat="server" ForeColor="Yellow" Text="Must be of 6-14 characters and should contain at least 1 letter and digit" style="left: 38%; top: 10%; position: absolute" Visible="False"></asp:Label>
                     </p>
                </div>
                    

            </form>
        </div>
    </div>


    <div> <p class="bg-danger">
        <asp:Label ID="lbl_invalidEmail" runat="server" ForeColor="Yellow" Style="left: 35%; top: 40%; position: absolute" Text="Account under same email ID already exists!" Visible="False"></asp:Label>
        </p>
    </div>
    <div>  <p class="bg-danger"> <asp:Label ID="lbl_warning" runat="server" ForeColor="#FF3300" Style="left: 38%; top: 10%; position: absolute" Text="Error registering. Please check If you have entered all information correctly" Visible="False"></asp:Label></p></div>
   
</body>
</html>
