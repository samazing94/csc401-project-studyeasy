using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class StudyEasy_Administrator_Document_Viewer : System.Web.UI.Page
{
    string sourceFileLocation, destinationLocation;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["Doc"] != null && Request.QueryString["Dir"] != null)
        {
            sourceFileLocation = Request.QueryString["Dir"] + Request.QueryString["Doc"];
            destinationLocation = "C:/Users/Nafi/Desktop/IUB Autumn '16/CSC 401/Project/StudyEasy/StudyEasy_Administrator/" + Request.QueryString["Doc"];
            File.Copy(sourceFileLocation, destinationLocation, true);
            iframe_docViewer.Attributes["src"] = Request.QueryString["Doc"];
            TextBox1.Text = Request.QueryString["Doc"];
            //if (Button1.Enabled == false && Image1.Visible == false)
            //{
            //    Button1.Enabled = true;
            //    Image1.Visible = true;
            //}
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Image1.Visible = false;
        File.Delete(destinationLocation);
        Button1.Enabled = false;
    }
}