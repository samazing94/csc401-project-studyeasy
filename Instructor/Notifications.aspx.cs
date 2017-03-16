using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

public partial class Instructor_Notifications : System.Web.UI.Page
{
    Label lbl_notif;

    MySqlConnection conn;
    MySqlCommand cmd;
    MySqlDataReader reader;

    string queryString, connectionString, inst_ID;
    int top = 120;

    protected void Page_Load(object sender, EventArgs e)
    {
        inst_ID = (string)Session["Inst User_ID"];
        //inst_ID = "Mr. Bones";
        getNotifications();
        lbl_welcomeMsg.Text = "Welcome to the notification center, " + inst_ID;
    }

    private void getNotifications()
    {
        try
        {
            connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["StudyEasyConnString"].ToString();
            conn = new MySqlConnection(connectionString);
            conn.Open();

            queryString = "SELECT " +
                         "transaction.amount," +
                         "enrollment.std_ID,enrollment.date,enrollment.time," +
                         "lecture.lct_num," +
                         "course.crs_name,course.board " +
                         "FROM " +
                         "transaction,enrollment,lecture,course " +
                         "WHERE " +
                         "transaction.ermt_ID = enrollment.ermt_ID AND " +
                         "enrollment.lct_ID = lecture.lct_ID AND " +
                         "lecture.crs_ID = course.crs_ID AND " +
                         "lecture.inst_ID = '" + inst_ID + "'";

            cmd = new MySqlCommand(queryString, conn);
            reader = cmd.ExecuteReader();

            while(reader.Read())
            {
                lbl_notif = new Label();
                lbl_notif.Text = reader["std_ID"].ToString() + " has enrolled in " + "<br />" +
                                 reader["crs_name"].ToString() + ", registered under the board, " +
                                 reader["board"].ToString() + ", in Lecture: " + reader["lct_num"].ToString() + "<br />" +
                                 " on " + reader["date"].ToString() + " at " + reader["time"].ToString() + ". <br/>";
                if (reader["lct_num"].ToString() != "1") lbl_notif.Text += "An amount of " + reader["amount"].ToString() + " has been sent to your bank account. <br />" + "Please check your email for further transaction information.";

                lbl_notif.Font.Bold = true;
                lbl_notif.Font.Size = 10;
                lbl_notif.Attributes["style"] = " top: 200px; left: 35%; position: absolute; text-decoration:none;  max - width: 700px; margin: 100px auto; padding: 3em 6em; font - size:1.1em; color: #eee;";
                lbl_notif.Style.Add("top", top.ToString() + "px");
                form1.Controls.Add(lbl_notif);
                top += 150;
            }
            reader.Close();
            conn.Close();

            conn.Open();
            queryString = "UPDATE " +
                        "transaction,enrollment,lecture,course " +
                        "SET " +
                        "transaction.viewed='1' " +
                        "WHERE " +
                        "transaction.ermt_ID = enrollment.ermt_ID AND " +
                        "enrollment.lct_ID = lecture.lct_ID AND " +
                        "lecture.crs_ID = course.crs_ID AND " +
                        "lecture.inst_ID = '" + inst_ID + "'";

            cmd = new MySqlCommand(queryString, conn);
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        catch (Exception e) { Response.Write("Error: " + e); }
    }
}