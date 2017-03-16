using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

public partial class Login_Login_Page : System.Web.UI.Page
{
    MySqlConnection conn;
    MySqlCommand cmd;
    MySqlDataReader reader;

    string queryString, connString;
    bool userExists,allFieldsFilled;

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void btn_Login_Click(object sender, EventArgs e)
    {
        allFieldsFilled = true;
        userExists = false;

        if (label_userNotSpecified.Visible == true) label_userNotSpecified.Visible = false;
        if (label_invalidUser.Visible == true) label_invalidUser.Visible = false;

        if(tb_userID.Text=="" || tb_Password.Text=="")
        {
            label_invalidUser.Visible = true;
        }
        else if(rbtn_student.Checked==false && rbtn_instructor.Checked==false)
        {
            label_userNotSpecified.Visible = true;
            allFieldsFilled = false;
        }

        if(allFieldsFilled==true)
        {
            checkLoginInfo();
            if (userExists == true)
            {
                if (rbtn_student.Checked == true) Response.Redirect("\\Student\\Student_Account.aspx");
                else Response.Redirect("\\Instructor\\Instructor_Account.aspx");
            }
            else label_invalidUser.Visible = true;
        }
    }

    private void checkLoginInfo()
    {
        try
        {   
            connString = System.Configuration.ConfigurationManager.ConnectionStrings["StudyEasyConnString"].ToString();

            conn = new MySqlConnection(connString);
            conn.Open();

            if (rbtn_student.Checked == true) queryString = "SELECT * FROM studyeasy.student WHERE std_ID = '" + tb_userID.Text + "' AND password = '" + tb_Password.Text + "'";
            else queryString = "SELECT * FROM studyeasy.instructor WHERE inst_ID = '" + tb_userID.Text + "' AND password = '" + tb_Password.Text + "'";

            cmd = new MySqlCommand(queryString, conn);
            reader = cmd.ExecuteReader();
            reader.Read();

            if(reader.HasRows)
            {
                if (rbtn_student.Checked)
                {
                    userExists = true;
                    setStudentInfo();
                }
                else if (rbtn_instructor.Checked)
                {
                    userExists = true;
                    setInstructorInfo();
                }
            }

            conn.Close();
            reader.Close();
        }
        catch(Exception e) { Response.Write(e); }
    }

    private void setStudentInfo()
    {
        Session.Add("Std User_ID", reader["std_ID"].ToString());
        Session.Add("Std Name", reader["std_fname"].ToString() + " " + reader["std_lname"]);
        Session.Add("Std Email", reader["email"].ToString());
        Session.Add("Std Password", reader["password"].ToString());
        Session.Add("Grdn Name", reader["grdn_fname"].ToString() + " " + reader["grdn_lname"].ToString());
        Session.Add("Grdn Relation", reader["grdn_relation"].ToString());
        Session.Add("Std Phone", reader["std_phone"].ToString());
        Session.Add("Grdn Phone", reader["grdn_phone"].ToString());
        Session.Add("Std Bank", reader["std_bname"].ToString());
        Session.Add("Std Bank Acc Num", reader["std_b_acc_num"].ToString());
        Session.Add("Std Address", reader["address"].ToString());
        Session.Add("Std DOB", reader["DOB"].ToString());
    }

    private void setInstructorInfo()
    {
        Session.Add("Inst User_ID", reader["inst_ID"].ToString());
        Session.Add("Inst Name", reader["inst_fname"].ToString() + " " + reader["inst_lname"].ToString());
        Session.Add("Inst Email", reader["email"].ToString());
        Session.Add("Inst Password", reader["password"].ToString());
        Session.Add("Inst Phone", reader["phone"].ToString());
        Session.Add("Inst Bank", reader["inst_bname"].ToString());
        Session.Add("Inst Bank Acc Num", reader["inst_b_acc_num"].ToString());
        Session.Add("Inst Address", reader["address"].ToString());
        Session.Add("Inst CV", reader["cv_link"].ToString());
        Session.Add("Inst DOB", reader["DOB"].ToString());
    }

    protected void btn_register_Click(object sender, EventArgs e)
    {
        Response.Redirect("\\Registration\\RegisterAs.aspx");
    }
}