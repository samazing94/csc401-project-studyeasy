<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Instructor_Upload_Page.aspx.cs" Inherits="Uploads_Teacher_Upload_Page" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<%@ Register Assembly="Media-Player-ASP.NET-Control" Namespace="Media_Player_ASP.NET_Control" TagPrefix="cc1" %>

<!DOCTYPE html>

<html>


<head runat="server">
    <title>Lecture Upload Page</title>
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
                <li><a href="Instructor_Account.aspx"><span class="fa fa-id-card-o"></span>Instructor Account</a>
                <li><a href="My_Lectures.aspx"><span class="fa fa-book"></span>My Lectures</a>
                <li><a href="Notifications.aspx"><span class="fa fa-bolt"></span>Notifications</a>
                <li><a href="/Login/Login_Page.aspx"><span class="fa fa-sign-out"></span>Log Out</a>
            </ul>
        </header>
        <div class="container-fluid">
            <div class="row">
                <div class="course_content">
                    <p>
                        <asp:Label ID="Label1" runat="server" Text="Course Name:" Font-Bold="True"></asp:Label>
                        <asp:Label ID="lbl_crsName" runat="server" Text="A level Physics Unit 4"></asp:Label>
                    </p>
                    <p>
                        <asp:Label ID="Label2" runat="server" Text="Instructor:" Font-Bold="True"></asp:Label>
                        <asp:Label ID="lbl_inst_ID" runat="server" Text="nz881"></asp:Label>
                    </p>
                    <p>
                        <asp:Label ID="Label3" runat="server" Text="Board:" Font-Bold="True"></asp:Label>
                        <asp:Label ID="lbl_boardName" runat="server" Text="Cambridge" Font-Bold="False" Font-Italic="False"></asp:Label>
                    </p>
                    <p>
                        <asp:Label ID="Label4" runat="server" Text="Lecture Number:" Font-Bold="True"></asp:Label>
                        <asp:Label ID="lbl_lectureNumber" runat="server" Text="number of lecture"></asp:Label>
                    </p>
                   

                    <p>
                        <asp:Label ID="Label5" runat="server" Text="Upload A Video"></asp:Label> <asp:FileUpload ID="upl_video" runat="server" />
                    </p>
                    <p>
                        <asp:Label ID="Label6" runat="server" Text="Upload Documents Max(3)"></asp:Label>   <asp:FileUpload ID="upl_document" runat="server" AllowMultiple="true" />
                    </p>
                    <p>
                        <asp:Label ID="Label7" runat="server" Text="Add A Short Description"></asp:Label>
                    </p>

                 
                    
                    <asp:TextBox ID="tb_description" runat="server" TextMode="MultiLine"></asp:TextBox>
                     <p>
                        <asp:Button ID="btn_postLecture" runat="server" OnClick="btn_upload_Click" Text="Post Lecture" />
                    </p>

                    <asp:Label ID="lbl_noFiles" runat="server" ForeColor="#CC0000" Text="Upload atleast 1 video file or document file" Visible="False" Font-Size="Large"></asp:Label>
                    <asp:Label ID="lbl_maxFiles" runat="server" ForeColor="#CC0000" Text="Cannot upload more than 3 documents" Visible="False" Font-Size="Large"></asp:Label><br/>
                    <asp:Label ID="lbl_invalidExtension" runat="server" ForeColor="#CC0000" Text="Video file must be .mp4 format. Document file must be .txt/.pdf/.docx/.doc/.pptx/.ppt format" Visible="False"></asp:Label><br/>
                    <asp:Label ID="lbl_noDescription" runat="server" ForeColor="#CC0000" Text="Lecture Must Contain Description" Visible="False"></asp:Label> <br/>
                    <asp:Label ID="lbl_success" runat="server" ForeColor="#00CC00" Text="Lecture has been uploaded successfully" Visible="False"></asp:Label> <br/>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
