using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

public partial class Student_View_Classes : System.Web.UI.Page
{
    LinkButton lnk_button;
    int top = 50;
    string connectionString, queryString;
    MySqlConnection conn;
    MySqlCommand cmd;
    MySqlDataReader reader;

    protected void Page_Load(object sender, EventArgs e)
    {   
        if (Page.IsPostBack)
        {
            getClasses();
        }
    }

    protected void getClasses()
    {
        try
        {
            connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["StudyEasyConnString"].ToString();
            conn = new MySqlConnection(connectionString);
            conn.Open();

            queryString = "SELECT * FROM course WHERE board = '" + ddl_Board.SelectedItem.ToString() + "'";

            cmd = new MySqlCommand(queryString, conn);
            reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                lnk_button = new LinkButton();
                lnk_button.ID = reader["crs_ID"].ToString();
                lnk_button.Text = reader["crs_name"].ToString();
                lnk_button.Attributes["style"] = " left: 43%; position: absolute; text-decoration:none;  max - width: 700px;  font - size:1.1em; color: #eee;";
                lnk_button.Style.Add("top", top.ToString() + "%");
                top += 10;
                lnk_button.Click += new EventHandler(lnk_button_Click);
                form1.Controls.Add(lnk_button);
            }

            reader.Close();
            conn.Close();
        }
        catch (Exception ex) { Response.Write("Error: " + ex); }
    }

    private void lnk_button_Click(object sender, EventArgs e)
    {
        LinkButton clickedButton = (LinkButton)sender;
        Session.Add("Crs ID", clickedButton.ID);
        Response.Redirect("Course_Information.aspx");
    }
}