using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_Student_Account : System.Web.UI.Page
{
    string studentPassword;

    protected void Page_Load(object sender, EventArgs e)
    {
        setStudentInfo();
    }

    private void setStudentInfo()
    {
        lbl_Welcome.Text = "Welcome to the student account, " + (string)(Session["Std User_ID"]);
        lbl_stdName.Text = (string)(Session["Std Name"]);
        lbl_email.Text = (string)(Session["Std Email"]);
        studentPassword = (string)(Session["Std Password"]);
        lbl_grdName.Text = (string)(Session["Grdn Name"]);
        lbl_grdnRelation.Text = (string)(Session["Grdn Relation"]);
        lbl_stdPN.Text = (string)(Session["Std Phone"]);
        lbl_grdnPN.Text = (string)(Session["Grdn Phone"]);
        lbl_bankName.Text = (string)(Session["Std Bank"]);
        lbl_bankAccNum.Text = (string)(Session["Std Bank Acc Num"]);
        lbl_address.Text = (string)(Session["Std Address"]);
        lbl_DOB.Text = (string)(Session["Std DOB"]);
    }

    protected void lnkbtn_logOut_Click(object sender, EventArgs e)
    {
        Response.Redirect("\\Home Page\\Default.aspx");
    }

    protected void lnkBtn_explrCls_Click(object sender, EventArgs e)
    {
        Response.Redirect("Explore_Classes.aspx");
    }

    protected void lnkBtn_myClasses_Click(object sender, EventArgs e)
    {
        Response.Redirect("My_Classes.aspx");
    }
}