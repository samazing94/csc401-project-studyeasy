using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;
using System.Text;
using System.Globalization;
using SautinSoft;
using MySql.Data.MySqlClient;

public partial class Uploads_Teacher_Upload_Page : System.Web.UI.Page
{
    string rootFolder,lecture_Folder;
    string videoFileName, videoFileExtension;
    string[] documentFileNames;
    string[] documentFileExtensions;
    string[] documentFileNamesWithoutExtension;
    int lecture_Num;
    string crs_ID,queryString, connectionString=System.Configuration.ConfigurationManager.ConnectionStrings["StudyEasyConnString"].ToString();
    MySqlConnection conn;
    MySqlCommand cmd;
    MySqlDataReader reader;
    bool invalid_Lecture;

    protected void Page_Load(object sender, EventArgs e)
    {
        lbl_inst_ID.Text = (string)Session["Inst User_Id"];
        crs_ID = (string)Session["Crs ID"];
        //crs_ID = "DBD_1";
        setCrsInfo();
        findlecture_NumNumber();
        lbl_lectureNumber.Text = lecture_Num.ToString();
        //lbl_lectureNumber.Text = "1";
    }

    private void setCrsInfo()
    {
        try
        {
            conn = new MySqlConnection(connectionString);
            conn.Open();

            queryString = "SELECT crs_name,board FROM studyeasy.course WHERE crs_ID = '" + crs_ID + "'";
            cmd = new MySqlCommand(queryString, conn);
            reader = cmd.ExecuteReader();
            reader.Read();

           if(reader.HasRows)
            {
                lbl_crsName.Text = reader["crs_name"].ToString();
                lbl_boardName.Text = reader["board"].ToString();
            }

            reader.Close();
            conn.Close();
        }
        catch (Exception e) { Response.Write("Error: " + e); }
    }

    private void findlecture_NumNumber()
    {
        try
        {
            conn = new MySqlConnection(connectionString);
            conn.Open();

            queryString = "SELECT count(crs_ID) FROM studyeasy.lecture WHERE crs_ID = '" + crs_ID + "' AND inst_ID = '" + lbl_inst_ID.Text + "' ";
            cmd = new MySqlCommand(queryString, conn);
            lecture_Num = Convert.ToInt32(cmd.ExecuteScalar());
            lecture_Num++;

            conn.Close();
        }
        catch (Exception e) { Response.Write("Error: " + e); }
    }

    protected void btn_upload_Click(object sender, EventArgs e)
    {
        invalid_Lecture = false;

        if(lbl_noFiles.Visible || lbl_maxFiles.Visible || lbl_invalidExtension.Visible || lbl_noDescription.Visible) lbl_noFiles.Visible = lbl_maxFiles.Visible = lbl_invalidExtension.Visible = lbl_noDescription.Visible = false;

        rootFolder = "C:\\Users\\Nafi\\Desktop\\IUB Autumn '16\\CSC 401\\Project\\StudyEasy\\Lectures\\" + lbl_inst_ID.Text + "_" + lbl_boardName.Text + "_" + lbl_crsName.Text;
        lecture_Folder = rootFolder + "\\Lecture" + lbl_lectureNumber.Text + "\\";

        if (validFiles() == false)
        {
            invalid_Lecture = true;
        }

        if (tb_description.Text == "")
        {
            lbl_noDescription.Visible = true;
            invalid_Lecture = true;
        }

        if (invalid_Lecture == false && successfulUpload() == true)
        {
            createDirectory();
            saveFilesToDirectory();
            if (upl_document.HasFiles)
            {
                convertDocumentFiles();
                deleteDocumentFiles();
            }

            upl_document.Enabled = false;
            upl_video.Enabled = false;
            btn_postLecture.Enabled = false;
            lbl_success.Visible = true;

            Response.AddHeader("REFRESH", "2;URL=\\Instructor\\Instructor_Account.aspx");
        }
    }

    private void deleteDocumentFiles()
    {
        for (int i = 0; i < documentFileNames.Length-1; i++)
        {
            if (File.Exists(lecture_Folder + documentFileNames[i]) == true && documentFileExtensions[i]!=".pdf")
            {
                File.Delete(lecture_Folder + documentFileNames[i]);
            }
        }
    }

    private void createDirectory()
    {
        if (Directory.Exists(rootFolder) == false) Directory.CreateDirectory(rootFolder);
        if (Directory.Exists(lecture_Folder) == false) Directory.CreateDirectory(lecture_Folder);
    }

    private bool validFiles()
    {
        if (upl_document.HasFile == false && upl_video.HasFile == false)
        {
            lbl_noFiles.Visible = true;
            return false;
        }

        if (upl_video.HasFile == true)
        {
            videoFileName = upl_video.FileName;
            videoFileExtension = Path.GetExtension(videoFileName).ToLower();

            if (videoFileExtension != ".mp4")
            {
                lbl_invalidExtension.Visible = true;
                return false;
            }
        }

        if (upl_document.HasFiles == true || upl_document.HasFile == true)
        {
            if (Request.Files.Count > 4)
            {
                lbl_maxFiles.Visible = true;
                return false;
            }
            else
            {
                documentFileNames = new string[Request.Files.Count];
                documentFileExtensions = new string[Request.Files.Count];
                documentFileNamesWithoutExtension = new string[Request.Files.Count];
                int i = 0;

                foreach(HttpPostedFile postedFile in upl_document.PostedFiles)
                {
                    documentFileNames[i] = postedFile.FileName;
                    documentFileExtensions[i] = Path.GetExtension(documentFileNames[i]).ToLower();
                    documentFileNamesWithoutExtension[i] = Path.GetFileNameWithoutExtension(documentFileNames[i]).ToLower();
                    i++;
                }

                for (int j = 0; j < documentFileExtensions.Length-1; j++)
                {
                    if (documentFileExtensions[j] != ".txt" && 
                        documentFileExtensions[j] != ".pdf" && 
                        documentFileExtensions[j] != ".docx" &&
                        documentFileExtensions[j] != ".doc" &&
                        documentFileExtensions[j] != ".pptx" &&
                        documentFileExtensions[j] != ".ppt")
                    {
                        lbl_invalidExtension.Visible = true;
                        return false;
                    }
                }
            }
        }

        return true;
    }

    private void saveFilesToDirectory()
    {
        if(upl_video.HasFile)upl_video.SaveAs(lecture_Folder + videoFileName);
        if(upl_document.HasFiles)
        {
            foreach (HttpPostedFile fileuploaded in upl_document.PostedFiles)
            {
                fileuploaded.SaveAs(lecture_Folder + fileuploaded.FileName);
            }
        }

        File.WriteAllText(lecture_Folder + "Desc.txt", tb_description.Text);
        
    }

    private void convertDocumentFiles()
    {
        UseOffice u = new UseOffice();
        int ret;
        string inputFileAndPath,outputFileAndPath;
        for (int i = 0; i < documentFileNames.Length - 1; i++) 
        {
            inputFileAndPath = Path.GetFullPath(Path.Combine(Directory.GetCurrentDirectory(), lecture_Folder + documentFileNames[i]));
            outputFileAndPath = Path.GetFullPath(Path.Combine(Directory.GetCurrentDirectory(), lecture_Folder + documentFileNamesWithoutExtension[i] + ".pdf"));

            if (documentFileExtensions[i] == ".doc")
            {
                ret = u.ConvertFile(inputFileAndPath, outputFileAndPath, UseOffice.eDirection.DOC_to_PDF);
            }
            else if (documentFileExtensions[i] == ".docx")
            {
                ret = u.ConvertFile(inputFileAndPath, outputFileAndPath, UseOffice.eDirection.DOCX_to_PDF);
            }
            else if (documentFileExtensions[i] == ".ppt")
            {
                ret = u.ConvertFile(inputFileAndPath, outputFileAndPath, UseOffice.eDirection.PPT_to_PDF);
            }
            else if (documentFileExtensions[i] == ".pptx")
            {
                ret = u.ConvertFile(inputFileAndPath, outputFileAndPath, UseOffice.eDirection.PPTX_to_PDF);
            }
            else if(documentFileExtensions[i]==".txt")
            {
                ret = u.ConvertFile(inputFileAndPath, outputFileAndPath, UseOffice.eDirection.TEXT_to_PDF);
            }
        }
    }

    private bool successfulUpload()
    {
        try
        {
            conn = new MySqlConnection(connectionString);
            conn.Open();


            queryString = "INSERT INTO studyeasy.lecture (inst_ID,crs_ID,lct_num) VALUES ( '" + lbl_inst_ID.Text + "','" + crs_ID + "','" + lecture_Num + "' )";

            cmd = new MySqlCommand(queryString, conn);
            cmd.ExecuteNonQuery();

            conn.Close();
        }
        catch (Exception e)
        {
            Response.Write("Error: " + e);
            return false;
        }

        return true;
    }
}
