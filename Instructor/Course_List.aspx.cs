using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using MySql.Data.MySqlClient;
using System.Data;

public partial class Class_Course_List : System.Web.UI.Page
{
    LinkButton lnkButton;
    string board;
    int top=200;
    int lnkButtonID = 1;
    MySqlConnection conn;
    MySqlCommand cmd;
    MySqlDataReader reader;
    string connectionString, queryString;
    

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack)
        {
            board = ddl_boards.SelectedItem.ToString();
            getClassInfo();
        }
    }

    private void getClassInfo()
    {
        try
        {
            connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["StudyEasyConnString"].ToString();
            conn = new MySqlConnection(connectionString);
            conn.Open();

            queryString = "SELECT crs_ID,crs_name,board FROM studyeasy.course WHERE board='" + ddl_boards.SelectedItem.ToString() + "'";

            cmd = new MySqlCommand(queryString, conn);
            reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                lnkButton = new LinkButton();
                lnkButton.ID = reader["crs_ID"].ToString();
                lnkButton.Text = reader["crs_name"].ToString();
                lnkButton.Attributes["runat"] = "server";
                lnkButton.Attributes["style"] = " top: 30%; left: 45%; position: absolute; text-decoration:none; color:white; text-align:center";
                lnkButton.Style.Add("top", top.ToString() + "px");
                top += 30;
                lnkButton.Click += new EventHandler(lnkButton_Click);
                form1.Controls.Add(lnkButton);
            }

            reader.Close();
            conn.Close();
        }
        catch (Exception e) { }
    }

    protected void lnkButton_Click(object sender, EventArgs e)
    {
        LinkButton clickedControl = (LinkButton)sender;
        Session.Add("Crs ID", clickedControl.ID);
        Response.Redirect("Instructor_Upload_Page.aspx");
    }
}