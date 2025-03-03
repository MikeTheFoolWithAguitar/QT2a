using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WingtipToys.Models;

namespace WingtipToys.QT2aRSI
{
    public partial class Roles : System.Web.UI.Page
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
        }
        protected void btnAddUserToRole_Click(object sender, EventArgs e)
        {
            // PART 1 - Add the user to the S Table.
            // open the db connection and setup a command and reader
            String connStr = ConfigurationManager.ConnectionStrings["QT2a"].ConnectionString;
            System.Data.SqlClient.SqlConnection dbconn = new System.Data.SqlClient.SqlConnection(connStr);
            dbconn.Open();
            // see if the UserName is already in the Securities Table
            // if yes, skip adding the user and continue to assign a role.
            String sql2 = "select UserName from Securities where UserName='" + txtUserName.Text + "'";
            System.Data.SqlClient.SqlCommand dbcomm2 = new System.Data.SqlClient.SqlCommand(sql2, dbconn);
            System.Data.SqlClient.SqlDataReader dbread;
            dbread = dbcomm2.ExecuteReader();
            if (!dbread.HasRows)
            {
                dbread.Close();
                String strProgID = "NULL";
                if (ddlProgram.SelectedValue != "") { strProgID = ddlProgram.SelectedValue; }
                String sql = "INSERT INTO Securities (UserName,CompID,ProgID,FName,LName,LastUpdated,UpdatedBy) VALUES ('" + txtUserName.Text + "'," + ddlCompany.SelectedValue + "," + strProgID + ",'" + txtFName.Text + "','" + txtLName.Text + "','" + txtLastUpdated.Text + "','" + txtUpdatedBy.Text + "')";
                System.Data.SqlClient.SqlCommand dbcomm = new System.Data.SqlClient.SqlCommand(sql, dbconn);
                dbcomm.ExecuteNonQuery();

                // close the db objects
                dbcomm.Dispose();
            }
            // close the db objects
            dbread.Dispose();
            dbcomm2.Dispose();
            dbconn.Close();
            dbconn.Dispose();

            // PART 2 - Add the User to the Identity Role
            // Access the application context and create result variables.
            Models.ApplicationDbContext context = new ApplicationDbContext();
            IdentityResult IdRoleResult;
            IdentityResult IdUserResult;

            // Create a RoleStore object by using the ApplicationDbContext object. 
            // The RoleStore is only allowed to contain IdentityRole objects.
            var roleStore = new RoleStore<IdentityRole>(context);

            // Create a RoleManager object that is only allowed to contain IdentityRole objects.
            // When creating the RoleManager object, you pass in (as a parameter) a new RoleStore object. 
            var roleMgr = new RoleManager<IdentityRole>(roleStore);

            // Create a UserManager object based on the UserStore object and the ApplicationDbContext  
            // object. Note that you can create new objects and use them as parameters in
            // a single line of code, rather than using multiple lines of code, as you did
            // for the RoleManager object.
            var userMgr = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(context));

            // add the UserName to the selected role.
            string strUserName = txtUserName.Text;
            string strRole = ddlRole.SelectedValue.ToString();
            if (!userMgr.IsInRole(userMgr.FindByEmail(strUserName).Id, strRole))
            {
                IdUserResult = userMgr.AddToRole(userMgr.FindByEmail(strUserName).Id, strRole);
            }
            Response.Redirect("~/Default.aspx");
        }
    }//class
}//namspace