using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

public partial class Instructor_My_Lectures : System.Web.UI.Page
{
    string instID,queryString,connectionString;

    MySqlConnection conn;
    MySqlCommand cmd;
    MySqlDataReader reader;

    Label lbl_lctInfo;
    LinkButton lnkBtn_lctNum;

    int top = 120;

    protected void Page_Load(object sender, EventArgs e)
    {
        //instID = (string)Session["Inst User_ID"];
        instID = "Mr. Bones";
        lbl_Welcome.Text = "Displaying all the lectures posted by, " + instID;
        getMyLectures();
    }

    private void getMyLectures()
    {
        try
        {
            connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["StudyEasyConnString"].ToString();
            conn = new MySqlConnection(connectionString);
            conn.Open();

            queryString = "SELECT " +
                          "lecture.lct_ID, lecture.lct_num," +
                          "course.crs_name, course.board " +
                          "FROM " +
                          "lecture, course " +
                          "WHERE " +
                          "lecture.inst_ID = '" + instID + "' AND lecture.crs_ID = course.crs_ID ";

            cmd = new MySqlCommand(queryString, conn);
            cmd.CommandType = System.Data.CommandType.Text;
            reader = cmd.ExecuteReader();
            
            while(reader.Read())
            {
                lbl_lctInfo = new Label();
                lbl_lctInfo.Text = "Course Name: "+reader["crs_name"].ToString() +"<br />"+ "Board: " + reader["board"].ToString();
                lbl_lctInfo.Font.Size = 10;
                lbl_lctInfo.Font.Bold = true;
                lbl_lctInfo.Attributes["style"] = "top: 200px; left: 35%; position: absolute; text-decoration:none;  max - width: 700px; margin: 100px auto; padding: 3em 6em; font - size:1.1em; color: #eee;";
                lbl_lctInfo.Style.Add("top", top.ToString() + "px");
                form1.Controls.Add(lbl_lctInfo);

                top += 45;

                lnkBtn_lctNum = new LinkButton();
                lnkBtn_lctNum.ID = reader["lct_ID"].ToString();
                lnkBtn_lctNum.Text = "Lecture_" + reader["lct_num"].ToString();
                lnkBtn_lctNum.Font.Size = 14;
                lnkBtn_lctNum.Attributes["style"] = "top: 200px; left: 33%; position: absolute; text-decoration:none; margin: 100px auto; padding: 2em 6em; font - size:1.1em; color: #eee;";
                lnkBtn_lctNum.Style.Add("top", top.ToString() + "px");
                lnkBtn_lctNum.Click += new EventHandler(lnkBtn_lctNum_Click);
                form1.Controls.Add(lnkBtn_lctNum);

                top += 45;
            }

            reader.Close();
            conn.Close();
                            
        }
        catch (Exception e) { Response.Write(e); }
    }

    protected void lnkBtn_lctNum_Click(object sender, EventArgs e)
    {
        LinkButton clickedButton = (LinkButton)sender;
        Session.Add("Lct ID", clickedButton.ID);
        Response.Redirect("/Student/Lecture_Room.aspx");
    }
}