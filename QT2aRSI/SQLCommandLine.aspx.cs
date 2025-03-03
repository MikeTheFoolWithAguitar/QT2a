using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WingtipToys.QT2aRSI
{
    public partial class SQLCommandLine : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                Page.Validate(); // check the validation controls on the server side
                if (!Page.IsValid)
                {
                    // if not valid, keep the user on the form somewhere
                }   // else just proceed to the event handlers
            }
            else // this is not a post back, coming into the page the first time
            {
            } // end else this is not a post back, coming into the page the first time
        }// end page load
        protected void btnNonQuery_Click(object sender, EventArgs e)
        {
            String connStr = ConfigurationManager.ConnectionStrings["QT2a"].ConnectionString;
            System.Data.SqlClient.SqlConnection dbconn = new System.Data.SqlClient.SqlConnection(connStr);
            dbconn.Open();
            String sql = txtSQLCommandLine.Text;
            System.Data.SqlClient.SqlCommand dbcomm = new System.Data.SqlClient.SqlCommand(sql, dbconn);
            dbcomm.ExecuteNonQuery();
            lblNonQuery.Visible = true;
            lblNonQuery.Text = "SQL Command Executed = " + txtSQLCommandLine.Text;
            dbconn.Close();
            dbconn.Dispose();
            dbcomm.Dispose();
        }
        protected void btnQuery_Click(object sender, EventArgs e)
        {
            // open the db connection and setup a command and reader
            String connStr = ConfigurationManager.ConnectionStrings["QT2a"].ConnectionString;
            System.Data.SqlClient.SqlConnection dbconn = new System.Data.SqlClient.SqlConnection(connStr);
            dbconn.Open();
            String sql = txtSQLCommandLine.Text;
            System.Data.SqlClient.SqlCommand dbcomm = new System.Data.SqlClient.SqlCommand(sql, dbconn);
            System.Data.SqlClient.SqlDataReader dbread;
            // execute the command for the contact types
            dbread = dbcomm.ExecuteReader();
            if (dbread.HasRows)
            {
                gvQueryResults.DataSource = dbread;
                gvQueryResults.DataBind();
            }
            // close the db objects
            dbread.Close();
            dbconn.Close();
            dbconn.Dispose();
            dbcomm.Dispose();
        }
        protected void btnSQLCommand_Click(object sender, EventArgs e)
        {
            // open the db connection and setup a command and reader
            String connStr = ConfigurationManager.ConnectionStrings["QT2a"].ConnectionString;
            System.Data.SqlClient.SqlConnection dbconn = new System.Data.SqlClient.SqlConnection(connStr);
            dbconn.Open();
            String sql = txtSQLCommandLine.Text;
            System.Data.SqlClient.SqlCommand dbcomm = new System.Data.SqlClient.SqlCommand(sql, dbconn);
            String strSQLCommandLine =txtSQLCommandLine.Text.Substring(0,6).ToLower();
            if (strSQLCommandLine == "select")
            {
                System.Data.SqlClient.SqlDataReader dbread;
                // execute the command for the contact types
                dbread = dbcomm.ExecuteReader();
                if (dbread.HasRows)
                {
                    gvQueryResults.DataSource = dbread;
                    gvQueryResults.DataBind();
                }
                dbread.Close();
            }
            else
            {
                dbcomm.ExecuteNonQuery();
                lblNonQuery.Visible = true;
                lblNonQuery.Text = "SQL Command Executed = " + txtSQLCommandLine.Text;
            }
            // close the db objects
            dbconn.Close();
            dbconn.Dispose();
            dbcomm.Dispose();
        }
    }
}