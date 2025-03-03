using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WingtipToys.QT2aRSI
{
    public partial class RandomSelection : System.Web.UI.Page
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
                // open the db connection and setup a command and reader
                String connStr = ConfigurationManager.ConnectionStrings["QT2a"].ConnectionString;
                System.Data.SqlClient.SqlConnection dbconn = new System.Data.SqlClient.SqlConnection(connStr);
                dbconn.Open();
                String sql = "Select ProgID, ProgName from Programs order by ProgName";
                System.Data.SqlClient.SqlCommand dbcomm = new System.Data.SqlClient.SqlCommand(sql, dbconn);
                System.Data.SqlClient.SqlDataReader dbread;
                dbread = dbcomm.ExecuteReader();
                if (dbread.HasRows)
                {
                    ddlProgram.DataSource = dbread;
                    ddlProgram.DataTextField = "ProgName";
                    ddlProgram.DataValueField = "ProgID";
                    ddlProgram.DataBind();
                }
                // close the db objects
                dbread.Close();
                dbconn.Close();
                dbconn.Dispose();
                dbcomm.Dispose();
            } // end else this is not a post back, coming into the page the first time
        } // end page load
        protected void ddlProgram_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblRandomlySelectedEmployee.Visible = false;
            lblRandomlySelectedEmployeeFName.Visible = false;
            lblRandomlySelectedEmployeeMInitial.Visible = false;
            lblRandomlySelectedEmployeeLName.Visible = false;
            lblAddRandomSelectionRecord.Visible = false;
            btnAddRandomSelectionRecord.Visible = false;
        } // end ddlProgram_SelectedIndexChanged
        protected void btnAddRandomSelectionRecord_Click(object sender, EventArgs e)
        {
            // open the db connection and setup a command and reader
            String connStr = ConfigurationManager.ConnectionStrings["QT2a"].ConnectionString;
            System.Data.SqlClient.SqlConnection dbconn = new System.Data.SqlClient.SqlConnection(connStr);
            dbconn.Open();
            // select all companies in this program
            String sql = "INSERT INTO DrugTestResults(EmployeeID, RandomDate, DrugTestTypeID) VALUES (" + lblRandomlySelectedEmployeeID.Text + ",'" + DateTime.Now + "',2)";
            System.Data.SqlClient.SqlCommand dbcomm = new System.Data.SqlClient.SqlCommand(sql, dbconn);
            dbcomm.ExecuteScalar();

            // close the db objects
            dbconn.Close();
            dbconn.Dispose();
            dbcomm.Dispose();
            Response.Redirect("~");
        }
        protected void btnRandomSelection_Click(object sender, EventArgs e)
        {
            // set up the company list string that will be like (10,14)
            String strCompanyList = "";
            // open the db connection and setup a command and reader
            String connStr = ConfigurationManager.ConnectionStrings["QT2a"].ConnectionString;
            System.Data.SqlClient.SqlConnection dbconn = new System.Data.SqlClient.SqlConnection(connStr);
            dbconn.Open();
            // select all companies in this program
            String sql = "Select CompID from Companies where ProgID=" + ddlProgram.SelectedValue;
            System.Data.SqlClient.SqlCommand dbcomm = new System.Data.SqlClient.SqlCommand(sql, dbconn);
            System.Data.SqlClient.SqlDataReader dbread;
            dbread = dbcomm.ExecuteReader();
            if (!dbread.HasRows)
            {
                lblRandomlySelectedEmployee.Visible = true;
                lblRandomlySelectedEmployee.Text = "No companies in that program.";
                lblRandomlySelectedEmployeeFName.Visible = false;
                lblRandomlySelectedEmployeeMInitial.Visible = false;
                lblRandomlySelectedEmployeeLName.Visible = false;
                lblAddRandomSelectionRecord.Visible = false;
                btnAddRandomSelectionRecord.Visible = false;
                ddlProgram.Focus();
            }
            else // dbread has rows, there are companies in the selected program
            {
                strCompanyList = "(";
                while (dbread.Read())
                {
                    strCompanyList = strCompanyList + dbread["CompID"].ToString() + ",";
                }
                // should look like this "(10,14," truncate the last , and replace it with a )
                strCompanyList = strCompanyList.Substring(0, strCompanyList.Length - 1);
                strCompanyList = strCompanyList + ")";

                // debug code Response.Write(" StringCompanList "); Response.Write(strCompanyList); Response.End();

                // for Consort 6 Only Select CDL Drivers
                String strCDLclause = " ";
                if (ddlProgram.SelectedValue == "6")
                {
                    strCDLclause = " and e.CDLdriver='true'";
                }
                // Random Selection Pool - Select all current employees from all companies in this program
                // Make two calls - one to get the count and one to get the data
                dbread.Close();
                sql = "Select count(*) as count from Employees e, PrevEmployers p where p.EmployeeId=e.EmployeeId and p.CompId in  " + strCompanyList + " and p.terminationdate is null " + strCDLclause;
                System.Data.SqlClient.SqlCommand dbcommCount = new System.Data.SqlClient.SqlCommand(sql, dbconn);
                System.Data.SqlClient.SqlDataReader dbreadCount;
                dbreadCount = dbcommCount.ExecuteReader();
                int PoolCount = 0;
                if (dbreadCount.HasRows)
                {
                    dbreadCount.Read();
                    PoolCount = Convert.ToInt32(dbreadCount["count"].ToString());
                }
                else { Response.Write("Error: Could not get the pool count"); Response.End(); }
                // Now get the data
                dbreadCount.Close();
                sql = "Select e.FName, e.LName, e.MInitial, e.EmployeeId, p.compid from Employees e, PrevEmployers p where p.EmployeeId=e.EmployeeId and p.CompId in  " + strCompanyList + " and p.terminationdate is null " + strCDLclause;
                System.Data.SqlClient.SqlCommand dbcommPool = new System.Data.SqlClient.SqlCommand(sql, dbconn);
                System.Data.SqlClient.SqlDataReader dbreadPool;
                dbreadPool = dbcommPool.ExecuteReader();
                String RandomlySelectedEmployeeID = "";
                String RandomlySelectedEmployeeFName = "";
                String RandomlySelectedEmployeeMInitial = "";
                String RandomlySelectedEmployeeLName = "";
                // generate a Random Number from 1 to PoolCount. (the +1 is because the max parameter is excluded)
                // (from https://msdn.microsoft.com/en-us/library/2dx6wyd4%28v=vs.110%29.aspx)
                // (from http://stackoverflow.com/questions/2706500/how-do-i-generate-a-random-int-number-in-c)
                Random random = new Random();
                int RandomNumber = random.Next(1, PoolCount + 1);
                if (dbreadPool.HasRows)
                {
                    // loop thru pool and select employee based on the random number
                    int i = 1;
                    while (dbreadPool.Read())
                    {
                        if (i == RandomNumber)
                        {
                            RandomlySelectedEmployeeID = dbreadPool["EmployeeID"].ToString();
                            RandomlySelectedEmployeeFName = dbreadPool["FName"].ToString();
                            RandomlySelectedEmployeeMInitial = dbreadPool["MInitial"].ToString();
                            RandomlySelectedEmployeeLName = dbreadPool["LName"].ToString();
                        }
                        i++;
                    }
                    lblRandomlySelectedEmployee.Visible = true;
                    lblRandomlySelectedEmployee.Text = "The Following Person Has Been Randomly Selected From All Employees In The Program Above:";
                    lblRandomlySelectedEmployeeID.Text = RandomlySelectedEmployeeID;
                    lblRandomlySelectedEmployeeFName.Visible = true;
                    lblRandomlySelectedEmployeeFName.Text = RandomlySelectedEmployeeFName;
                    lblRandomlySelectedEmployeeMInitial.Visible = true;
                    lblRandomlySelectedEmployeeMInitial.Text = RandomlySelectedEmployeeMInitial;
                    lblRandomlySelectedEmployeeLName.Visible = true;
                    lblRandomlySelectedEmployeeLName.Text = RandomlySelectedEmployeeLName;
                    lblAddRandomSelectionRecord.Visible = true;
                    lblAddRandomSelectionRecord.Text = "Would you like to add a record to the DrugTestResults table?";
                    btnAddRandomSelectionRecord.Visible = true;

                    // debug code Response.Write("DEBUG MODE IS TURNED ON. SQL "); Response.Write(sql); Response.Write(" PoolCount "); Response.Write(PoolCount.ToString()); Response.Write(" RandomNumber "); Response.Write(RandomNumber.ToString()); Response.Write(" RandomlySelectedEmployeeID "); Response.Write(RandomlySelectedEmployeeID); Response.End();
                }       // end dbreadPool.HasRows
                else    // No rows in the Pool
                {
                    lblRandomlySelectedEmployee.Visible = true;
                    lblRandomlySelectedEmployee.Text = "No records in the random pool.";
                    lblRandomlySelectedEmployeeFName.Visible = false;
                    lblRandomlySelectedEmployeeMInitial.Visible = false;
                    lblRandomlySelectedEmployeeLName.Visible = false;
                    lblAddRandomSelectionRecord.Visible = false;
                    btnAddRandomSelectionRecord.Visible = false;
                } // end No rows in the Pool

                // close the db objects
                dbreadPool.Close();
                dbreadCount.Close();
                dbcommCount.Dispose();
                dbcommPool.Dispose();
            } // end else dbread has rows

            // close the db objects
            dbread.Close();
            dbconn.Close();
            dbconn.Dispose();
            dbcomm.Dispose();
        }//end btnRandomSelection_Click    
    }// end class RandemSelection
}// end namespace WingtipToys.QT2aRSI
