using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

public partial class Account_Instructor_Account : System.Web.UI.Page
{
    string instructorPassword, queryString, connectionString;
    int notifs;

    MySqlConnection conn;
    MySqlCommand cmd;

    protected void Page_Load(object sender, EventArgs e)
    {
        setTeacherInfo();
        getNotificationCount();
        if (notifs == 0) lnkBtn_notifications.Text = "Notifications";
        else lnkBtn_notifications.Text = "Notifications (" + notifs.ToString() + ")";
    }

    private void setTeacherInfo()
    {   
        lbl_Welcome.Text ="Welcome to the instructor account " + (string)(Session["Inst User_ID"]);
        lbl_instName.Text = (string)(Session["Inst Name"]);
        lbl_email.Text = (string)(Session["Inst Email"]);
        lbl_PN.Text = (string)(Session["Inst Phone"]);
        lbl_bankName.Text = (string)(Session["Inst Bank"]);
        lbl_bankAN.Text = (string)(Session["Inst Bank Acc Num"]);
        lbl_Address.Text = (string)(Session["Inst Address"]);
        lbl_DOB.Text = (string)(Session["Inst DOB"]);
        instructorPassword = (string)(Session["Inst Password"]);
        lnkBtn_resume.Text = (string)(Session["Inst CV"]);
        lnkBtn_resume.PostBackUrl = lnkBtn_resume.Text;
    }

    private void getNotificationCount()
    {
        notifs = 0;

        try
        {
            connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["StudyEasyConnString"].ToString();
            conn = new MySqlConnection(connectionString);
            conn.Open();

            queryString = "SELECT " +
                        "COUNT(viewed) AS notifications " +
                        "FROM " +
                        "transaction, enrollment, lecture, course " +
                        "WHERE " +
                        "transaction.ermt_ID = enrollment.ermt_ID AND " +
                        "enrollment.lct_ID = lecture.lct_ID AND " +
                        "lecture.crs_ID = course.crs_ID AND " +
                        "lecture.inst_ID = '" + (string)Session["Inst User_ID"] + "' AND " +
                        "transaction.viewed='0'";

            cmd = new MySqlCommand(queryString, conn);
            cmd.CommandText = queryString;
            notifs = Convert.ToInt32(cmd.ExecuteScalar());

            conn.Close();
        }
        catch (Exception e) { Response.Write("Error: " + e); }
    }

    protected void lnkbtn_logOut_Click(object sender, EventArgs e)
    {
        Response.Redirect("\\Home Page\\Default.aspx");
    }

    protected void lnkBtn_newClass_Click(object sender, EventArgs e)
    {
        Response.Redirect("Course_List.aspx");
    }

    protected void lnkBtn_notifications_Click(object sender, EventArgs e)
    {
        Response.Redirect("Notifications.aspx");
    }

    protected void lnkbtn_mylectures_Click(object sender, EventArgs e)
    {
        Response.Redirect("My_Lectures.aspx");
    }
}