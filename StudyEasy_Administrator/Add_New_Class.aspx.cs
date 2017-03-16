using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Text.RegularExpressions;

public partial class New_Class_Class_List : System.Web.UI.Page
{
    bool invalidClass;
    string crs_ID,queryString;
    string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["StudyEasyConnString"].ToString();
    int crs_Num;

    MySqlConnection conn;
    MySqlCommand cmd;
    MySqlDataReader reader;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_addClass_Click(object sender, EventArgs e)
    {
        invalidClass = false;
        if (lbl_noClsName.Visible == true || lbl_invalidClassName.Visible == true || lbl_success.Visible == true) lbl_success.Visible = lbl_invalidClassName.Visible = lbl_noClsName.Visible = false;
        if (tb_className.Text == "")
        {
            invalidClass = true;
            lbl_noClsName.Visible = true;
        }

        if (classIsValid() == false)
        {
            invalidClass = true;
            lbl_invalidClassName.Visible = true;
        }

        if (invalidClass == false)
        {
            addClass();
            lbl_success.Visible = true;
        }
    }

    private bool classIsValid()
    {
        try
        {
            conn = new MySqlConnection(connectionString);
            conn.Open();

            queryString = "SELECT COUNT(crs_ID) " +
                          "FROM course " +
                          "WHERE board='" + ddl_boards.SelectedItem.ToString() + "'";
            
            cmd = new MySqlCommand(queryString,conn);
            crs_Num = Convert.ToInt32(cmd.ExecuteScalar());
            crs_Num++;

            conn.Close();

            conn.Open();
            queryString = "SELECT crs_name, board " +
                          "FROM course " +
                          "WHERE crs_name = '" + tb_className.Text + "' AND board='" + ddl_boards.SelectedItem.ToString() + "'";

            cmd = new MySqlCommand(queryString, conn);
            reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                reader.Close();
                conn.Close();
                return false;
            }

            reader.Close();
            conn.Close();
        }
        catch (Exception e) { Response.Write(e); return false; }

        return true;
    }

    private void addClass()
    {
        crs_ID = getBoardID() + "_" + crs_Num.ToString();

        try
        {
            conn = new MySqlConnection(connectionString);
            conn.Open();

            queryString = "INSERT INTO studyeasy.course (crs_ID,crs_name,board) " +
                          "VALUES ('" + crs_ID + "','" + tb_className.Text + "','" + ddl_boards.SelectedItem.ToString() + "')";

            cmd = new MySqlCommand(queryString, conn);
            cmd.ExecuteNonQuery();

            conn.Close();
        }
        catch (Exception e) { Response.Write(e); }
    }

    private string getBoardID()
    {
        if (ddl_boards.SelectedIndex == 0) return "DBD";
        else if (ddl_boards.SelectedIndex == 1) return "KBD";
        else if (ddl_boards.SelectedIndex == 2) return "CMD";
        else if (ddl_boards.SelectedIndex == 3) return "EDL";
        else if (ddl_boards.SelectedIndex == 4) return "MDA";

        return "";
    }

}