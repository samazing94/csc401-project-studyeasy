using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Linq;
using System.Data;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

public partial class Student_Course_Information : System.Web.UI.Page
{
    MySqlConnection conn;
    MySqlCommand cmd;
    MySqlDataReader reader;

    Label lbl_instName;
    LinkButton lnk_lecture;

    string queryString, connectionString=System.Configuration.ConfigurationManager.ConnectionStrings["StudyEasyConnString"].ToString();
    string crs_name, board, inst_ID = "", std_ID, crs_ID;

    int top = 250,ermt_ID;

    protected void Page_Load(object sender, EventArgs e)
    {
        crs_ID = (string)Session["Crs ID"];
        std_ID = (string)Session["Std User_ID"];
        //crs_ID = "EDL_3";
        //std_ID = "nz881";
        getClassInfo();
        lbl_crsName.Text = crs_name;
        lbl_board.Text = board;
        displayLectures();
        div_Transaction.Visible = false;
    }

    private void getClassInfo()
    {
        try
        {
            conn = new MySqlConnection(connectionString);
            conn.Open();

            queryString = "SELECT * FROM studyeasy.course WHERE crs_ID = '" + crs_ID + "'";

            cmd = new MySqlCommand(queryString, conn);
            reader = cmd.ExecuteReader();
            reader.Read();

            if(reader.HasRows)
            {
                crs_name = reader["crs_name"].ToString();
                board = reader["board"].ToString();
            }

            reader.Close();
            conn.Close();
        }
        catch (Exception e) { Response.Write("Error: " + e); }
    }

    protected void displayLectures()
    {
        try
        {
            conn = new MySqlConnection(connectionString);
            conn.Open();

            queryString = "SELECT * FROM lecture WHERE lecture.crs_ID  = '" + crs_ID + "'";

            cmd = new MySqlCommand(queryString, conn);
            cmd.CommandType = CommandType.Text;
            reader = cmd.ExecuteReader();

            while(reader.Read())
            {
                if (inst_ID != reader["inst_ID"].ToString())
                {
                    top += 50;
                    inst_ID = reader["inst_ID"].ToString();
                    lbl_instName = new Label();
                    lbl_instName.Text = "Instructor: " + inst_ID;
                    lbl_instName.Font.Bold = true;
                    lbl_instName.Attributes["style"] = "left: 43%; position: absolute; text-decoration:none;  max - width: 700px;  font - size:1.1em; color: #eee;";
                    lbl_instName.Font.Size = 14;
                    lbl_instName.Style.Add("top", top.ToString() + "px");
                    form1.Controls.Add(lbl_instName);
                }

                top += 30;
                lnk_lecture = new LinkButton();
                lnk_lecture.ID = reader["lct_ID"].ToString();
                lnk_lecture.Text = "Lecture_" + reader["lct_num"].ToString();
                lnk_lecture.Attributes["style"] = "left: 43%; position: absolute; text-decoration:none;  max - width: 700px;  font - size:1.1em; color: #eee;";
                lnk_lecture.Style.Add("top", top.ToString() + "px");
                lnk_lecture.Click += new EventHandler(lnk_lecture_Click);
                form1.Controls.Add(lnk_lecture);
            }

            reader.Close();
            conn.Close();
        }
        catch (Exception e) { Response.Write("Error: " + e); }
    }

    protected void lnk_lecture_Click(object sender, EventArgs e)
    {
        if (lbl_enrolled.Visible || lbl_notEnrolled.Visible || lbl_alreadyEnrlled.Visible) lbl_notEnrolled.Visible = lbl_enrolled.Visible = lbl_alreadyEnrlled.Visible = false;

        LinkButton selectedLecture = (LinkButton)sender;
        lbl_checker.Text = selectedLecture.ID;

        if (validEnrollment() == false) lbl_alreadyEnrlled.Visible = true;
        else if (selectedLecture.Text.Count(x => x == '1') > 1 || !selectedLecture.Text.Contains("1") || selectedLecture.Text.Contains("10"))
        {
            div_Transaction.Visible = true;
            lbl_stdID.Text = "Student ID: " + std_ID;
            lbl_lctNum.Text = "Lecture: " + selectedLecture.Text;
            lbl_enterBAccNum.Text = "Enter your bank account number to enroll in this course.";
        }
        else
        {
            enrollStudent();
            lbl_enrolled.Visible = true;
        }
    }

    private bool validEnrollment()
    {
        try
        {
            conn = new MySqlConnection(connectionString);
            conn.Open();

            queryString = "SELECT std_ID,lct_ID FROM studyeasy.enrollment WHERE std_ID = '" + std_ID + "' AND lct_ID = '" + lbl_checker.Text + "'";
            cmd = new MySqlCommand(queryString, conn);
            reader = cmd.ExecuteReader();
            reader.Read();

            if (reader.HasRows)
            {
                reader.Close();
                conn.Close();
                return false;
            }

            reader.Close();
            conn.Close();
        }
        catch (Exception e) { Response.Write("Error: " + e); return false; }

        return true;
    }

    protected void btn_Done_Click(object sender, EventArgs e)
    {
        if (validBankAccNumber() == true)
        {
            enrollStudent();
            lbl_enrolled.Visible = true;
        }
        else lbl_notEnrolled.Visible = true;
    }

    private bool validBankAccNumber()
    {
        try
        {
            conn = new MySqlConnection(connectionString);
            conn.Open();

            queryString = "SELECT std_b_acc_num FROM studyeasy.student WHERE std_ID = '" + std_ID + "' AND std_b_acc_num = '" + tb_bankAccNo.Text + "'";
            cmd = new MySqlCommand(queryString, conn);
            reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                reader.Close();
                conn.Close();
                return true;
            }

            reader.Close();
            conn.Close();
        }
        catch (Exception e) { Response.Write("Error: " + e); return false; }

        return false;
    }

    private void enrollStudent()
    {
        try
        {
            conn = new MySqlConnection(connectionString);

            conn.Open();
            queryString = "INSERT INTO studyeasy.enrollment (std_ID, lct_ID, date, time) VALUES ('" + std_ID + "','" + Convert.ToInt32(lbl_checker.Text) + "', CURDATE(), CURTIME())";
            cmd = new MySqlCommand(queryString, conn);
            cmd.ExecuteNonQuery();
            conn.Close();


            conn.Open();
            queryString = "SELECT ermt_ID FROM studyeasy.enrollment ORDER BY ermt_ID DESC LIMIT 1";
            cmd = new MySqlCommand(queryString, conn);
            cmd.CommandText = queryString;
            ermt_ID = (int)cmd.ExecuteScalar();
            conn.Close();

            conn.Open();
            queryString = "INSERT INTO studyeasy.transaction (ermt_ID, amount, viewed) VALUES ('" + ermt_ID + "', '20 TK','" + 0 + "')";
            cmd = new MySqlCommand(queryString, conn);
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        catch (Exception e) { Response.Write("Error: " + e); }
    }

    protected void lnk_home_Click(object sender, EventArgs e)
    {
        Response.Redirect("Student_Account.aspx");
    }
}