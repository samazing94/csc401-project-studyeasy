using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

public partial class Student_My_Classes : System.Web.UI.Page
{
    MySqlConnection conn;
    MySqlCommand cmd;
    MySqlDataReader reader;

    Label lbl_enrlmntInfo;
    LinkButton lnkBtn_Lecture;

    string queryString, connectionString;
    string std_ID;
    int top = 20;

    protected void Page_Load(object sender, EventArgs e)
    {
        std_ID = (string)Session["Std User_ID"];
        //std_ID = "nz881";
        lbl_coursesInfo.Text = "Displaying courses and lectures enrolled in by, " + std_ID;
        getEnrolledClasses();
    }

    private void getEnrolledClasses()
    {
        try
        {
            connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["StudyEasyConnString"].ToString();
            conn = new MySqlConnection(connectionString);
            conn.Open();

            queryString = "SELECT " +
                        "enrollment.date, enrollment.time," +
                        "lecture.lct_ID, lecture.inst_ID, lecture.lct_num," +
                        "course.crs_name, course.board " +
                        "FROM " +
                        "(enrollment, lecture, course) " +
                        "WHERE " +
                        "lecture.lct_ID=enrollment.lct_ID AND course.crs_ID=lecture.crs_ID AND enrollment.std_ID = '" + std_ID + "'";

            cmd = new MySqlCommand(queryString, conn);
            cmd.CommandType = System.Data.CommandType.Text;
            reader = cmd.ExecuteReader();

            while(reader.Read())
            {
                lbl_enrlmntInfo = new Label();
                lbl_enrlmntInfo.Text = reader["crs_name"].ToString() + "," + reader["board"].ToString() + "<br />" +
                                     "Instructor: " + reader["inst_ID"].ToString() + "<br />" +
                                     "Enrolled on " + reader["date"].ToString() +
                                     " at " + reader["time"].ToString();

                lbl_enrlmntInfo.Font.Size = 12;
                lbl_enrlmntInfo.Font.Bold = true;
                lbl_enrlmntInfo.Attributes["style"] = " left: 33%; position: absolute; text-decoration:none;  max - width: 700px; margin: 100px auto; padding: 3em 6em; font - size:1.1em; color: #eee;";
                lbl_enrlmntInfo.Style.Add("top", top.ToString() + "%");
                form1.Controls.Add(lbl_enrlmntInfo);
                top += 32;

                lnkBtn_Lecture = new LinkButton();
                lnkBtn_Lecture.ID = reader["lct_ID"].ToString();
                lnkBtn_Lecture.Text = "Lecture_" + reader["lct_num"].ToString();
                lnkBtn_Lecture.Font.Size = 12;
                lnkBtn_Lecture.Attributes["style"] = " left: 39.5%; position: absolute; text-decoration:none; padding: .5em .5em; margin - left: 5.2em; color: #eee;";
                lnkBtn_Lecture.Style.Add("top", top.ToString() + "%");
                lnkBtn_Lecture.Click += new EventHandler(lnkBtn_Lecture_Click);
                form1.Controls.Add(lnkBtn_Lecture);
                top += 10;
            }

            conn.Close();
            reader.Close();
        }
        catch (Exception e) { Response.Write("Error: " + e); }
    }

    protected void lnkBtn_Lecture_Click(object sender, EventArgs e)
    {
        LinkButton clickedButton = (LinkButton)sender;
        Session.Add("Lct ID", clickedButton.ID);
        Response.Redirect("Lecture_Room.aspx");
    }
}