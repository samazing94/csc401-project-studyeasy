using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using MySql.Data.MySqlClient;

public partial class Student_Lecture_Room : System.Web.UI.Page
{
    MySqlConnection conn;
    MySqlCommand cmd;
    MySqlDataReader reader;

    string queryString, connectionString, lct_ID, lecture_directory, videoDirectory;
    int top=870;

    LinkButton lnkBtn_doc;
    DirectoryInfo d;
    FileInfo[] lecturefiles;

    protected void Page_Load(object sender, EventArgs e)
    {
        lct_ID = (string)Session["Lct ID"];
        //lct_ID = "2";
        getLecture();
        displayFiles();
    }

    private void getLecture()
    {
        lecture_directory = "C:/Users/Nafi/Desktop/IUB Autumn '16/CSC 401/Project/StudyEasy/Lectures/";
        videoDirectory = "../Lectures/";

        try
        {
            connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["StudyEasyConnString"].ToString();
            conn = new MySqlConnection(connectionString);
            conn.Open();

            queryString = "SELECT " +
                          "lecture.inst_ID, lecture.lct_num," +
                          "course.crs_name , course.board " +
                          "FROM " +
                          "(studyeasy.lecture, studyeasy.course) " +
                          "WHERE " +
                          "lecture.lct_ID = '" + lct_ID + "' AND course.crs_ID=lecture.crs_ID";

            cmd = new MySqlCommand(queryString, conn);
            reader = cmd.ExecuteReader();
            reader.Read();

            if(reader.HasRows)
            {
                lecture_directory += reader["inst_ID"].ToString() + "_" + reader["board"].ToString() + "_" + reader["crs_name"] + "/Lecture" + reader["lct_num"].ToString() + "/";
                videoDirectory += reader["inst_ID"].ToString() + "_" + reader["board"].ToString() + "_" + reader["crs_name"] + "/Lecture" + reader["lct_num"].ToString() + "/";

                lbl_crsName.Text = reader["crs_name"].ToString();
                lbl_Board.Text = reader["board"].ToString();
                lbl_inst_ID.Text = reader["inst_ID"].ToString();
                lbl_lctNum.Text = reader["lct_num"].ToString();
            }

            conn.Close();
            reader.Close();
        }
        catch (Exception e) { Response.Write("Error: " + e); }
    }


    private void displayFiles()
    {
        if (Directory.Exists(lecture_directory))
        {
            d = new DirectoryInfo(lecture_directory);
            lecturefiles = d.GetFiles();

            for (int i = 0; i < lecturefiles.Length; i++)
            {
                if (lecturefiles[i].Extension == ".mp4") vdo_mediaPlayer.Attributes.Add("src", videoDirectory + lecturefiles[i].Name);
                else if(lecturefiles[i].Extension == ".txt") lbl_Desc.Text = File.ReadAllText(lecture_directory + lecturefiles[i]);
                else
                {
                    lnkBtn_doc = new LinkButton();
                    lnkBtn_doc.ID = lecturefiles[i].Name;
                    lnkBtn_doc.Text = lecturefiles[i].Name;
                    lnkBtn_doc.Font.Size = 14;
                    lnkBtn_doc.Attributes["style"] = "z-index: 1; left: 334px; position: absolute";
                    lnkBtn_doc.Attributes.Add("href", "\\StudyEasy_Administrator\\Document_Viewer.aspx?Dir=" + lecture_directory + "&Doc=" + lnkBtn_doc.ID);
                    lnkBtn_doc.Attributes.Add("target", "_blank");
                    lnkBtn_doc.Style.Add("top", top.ToString() + "px");
                    lnkBtn_doc.Attributes.Add("OnClick", "getCurtime()");
                    lnkBtn_doc.Click += new EventHandler(buttonClick);
                    form1.Controls.Add(lnkBtn_doc);
                    top += 20;
                }
            }
        }
        else Response.Write("Directory Not Found!");
    }

    protected void buttonClick(object sender, EventArgs e)
    {
        LinkButton clickedDoc = (LinkButton)sender;
    }
}