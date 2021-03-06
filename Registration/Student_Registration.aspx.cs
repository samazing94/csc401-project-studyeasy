﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

public partial class Registration_Student_Registration : System.Web.UI.Page
{
    MySqlConnection conn;
    MySqlCommand cmd;
    MySqlDataReader reader;
    string queryString, connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["StudyEasyConnString"].ToString();
    string relation, bankName;
    bool invalid = true;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_Submit_Click(object sender, EventArgs e)
    {
        invalid = false;

        if (lbl_invalidEmail.Visible || lbl_invalidID.Visible || lbl_warning.Visible || lbl_invalidPass.Visible) lbl_invalidPass.Visible = lbl_invalidID.Visible = lbl_invalidEmail.Visible = lbl_warning.Visible = false;

        validate();
        getCheckedButtonNames();
        if (invalid == false)
        {
            saveUserInfoToDatabase();
            if (invalid == false) Response.AddHeader("REFRESH", "0.5;URL=\\Login\\Login_Page.aspx");
        }
    }

    private void saveUserInfoToDatabase()
    {
        try
        {
            conn = new MySqlConnection(connectionString);
            conn.Open();

            queryString = "INSERT INTO studyeasy.student " +
                          "(std_ID,std_fname,std_lname,email,password,grdn_fname,grdn_lname,grdn_relation,std_phone,grdn_phone,std_bname,std_b_acc_num,address,DOB) " +
                          "VALUES ('" + tb_userID.Text + "','" + tb_fname.Text + "','" + tb_lname.Text + "','" + tb_email.Text + "','" + tb_password.Text + "','" + tb_grdFname.Text + "','" + tb_grdLname.Text + "','" + relation + "','" + tb_stdPN.Text + "','" + tb_grdPN.Text + "','" + bankName + "','" + tb_bAccNum.Text + "','" + tb_address.Text + "','" + tb_dob.Text + "')";

            cmd = new MySqlCommand(queryString, conn);
            cmd.ExecuteNonQuery();

            conn.Close();
        }
        catch (Exception e) { lbl_warning.Visible = true; invalid = true; }
    }

    private void getCheckedButtonNames()
    {
        if (Father_rbtn.Checked == true) relation = Father_rbtn.Text;
        else if (Mother_rbtn.Checked == true) relation = Mother_rbtn.Text;
        else if (Sibling_rbtn.Checked == true) relation = Sibling_rbtn.Text;
        else relation = Other_rbtn.Text;

        if (rbtn_BA.Checked == true) bankName = rbtn_BA.Text;
        else if (rbtn_StdCh.Checked == true) bankName = rbtn_StdCh.Text;
        else bankName = rbtn_EBl.Text;
    }

    private void validate()
    {   
        if(tb_password.Text.Length > 14 || tb_password.Text.Length < 6 || 
           tb_password.Text.Count(char.IsLetter) == 0 || tb_password.Text.Count(char.IsDigit) == 0)
        {
            lbl_invalidPass.Visible = true;
            invalid = true;
            return;
        }

        else if (tb_userID.Text == "" || tb_fname.Text == "" || tb_lname.Text == "" || tb_email.Text == "" || tb_password.Text == "" ||
            tb_grdFname.Text == "" || tb_grdLname.Text == "" || tb_stdPN.Text == "" || tb_grdPN.Text == "" || tb_bAccNum.Text == "" ||
            tb_address.Text == "" || tb_dob.Text == "" || tb_dob.Text == "YYYY/MM/DD")
        {
            lbl_emptyFields.Visible = true;
            invalid = true;
            return;
        }

        try
        {
            conn = new MySqlConnection(connectionString);
            conn.Open();

            queryString = "SELECT std_ID as idem FROM student WHERE std_ID = '" + tb_userID.Text + "' UNION SELECT inst_ID FROM instructor WHERE inst_ID = '" + tb_userID.Text + "' UNION SELECT email FROM student WHERE email = '" + tb_email.Text + "'";

            cmd = new MySqlCommand(queryString, conn);
            reader = cmd.ExecuteReader();
            reader.Read();

            if(reader.HasRows && reader["idem"].ToString() == tb_userID.Text)
            {
                lbl_invalidID.Visible = true;
                invalid = true;
            }
            else if(reader.HasRows && reader["idem"].ToString() == tb_email.Text)
            {
                lbl_invalidEmail.Visible = true;
                invalid = true;
            }

            reader.Close();
            conn.Close();
        }
        catch (Exception e) { Response.Write(e); }
    }
}