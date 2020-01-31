using DevExpress.Web;
using Oracle.ManagedDataAccess.Client;
using System;
using System.Configuration;

namespace MergePDFExample
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void uploadcontrolAddAttachment_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
        {
            if (!e.IsValid)
            {
                return;
            }

            Session["FILE"] = e.UploadedFile.FileBytes;
            Session["FILENAME"] = e.UploadedFile.FileName;
            e.CallbackData = e.UploadedFile.FileName;
        }

        protected void callbackpanelAdd_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            try
            {
                using (var connection = new OracleConnection(ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString))
                {
                    connection.Open();
                    string query = "INSERT INTO TABLEMERGEPDF (TITLE, FILEATTACHMENT, FILENAME) VALUES (:TITLE, :FILEATTACHMENT, :FILENAME)";
                    using (var cmd = new OracleCommand(query, connection))
                    {
                        cmd.Parameters.Add("TITLE", OracleDbType.NVarchar2).Value = textboxTitle.Text;
                        cmd.Parameters.Add("FILEATTACHMENT", OracleDbType.Blob).Value = Session["FILE"];
                        cmd.Parameters.Add("FILENAME", OracleDbType.NVarchar2).Value = Session["FILENAME"];
                        cmd.ExecuteNonQuery();
                    }
                    ASPxEdit.ClearEditorsInContainer(callbackpanelAdd);
                    labelMessage.Text = "Successfull added!";
                    labelMessage.Visible = true;
                    
                }
            }
            catch (OracleException ex)
            {
                labelMessage.Text = ex.Message;
                labelMessage.Visible = true;
            }
            
        }
    }
}