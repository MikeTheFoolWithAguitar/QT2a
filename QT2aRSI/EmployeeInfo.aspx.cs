using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WingtipToys.QT2aRSI
{
    public partial class EmployeeInfo : System.Web.UI.Page
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
        protected void sdsEmployee_Selecting(object sender, SqlDataSourceCommandEventArgs e)
        {
            int dummyvariablenotused;
            if (Int32.TryParse(e.Command.Parameters[0].Value.ToString(), out dummyvariablenotused))
            {
            }
            else
            {
                // The Select Parameter for the EmployeeID has been hacked, don't execute the command
                Response.Redirect("https://qualifiedtruckers.com/");
            }
        }
        protected void btnEmployees_Click(object sender, EventArgs e)
        {
            if (btnEmployees.Text == "Employee Info")
            {
                dtvEmployees.Visible = true;
                //            gvEmployees.Visible = true;
                btnEmployees.Text = "Hide Employee Info";
                lblEmployees.Visible = true;
            }
            else
            {
                dtvEmployees.Visible = false;
                //            gvEmployees.Visible = false;
                btnEmployees.Text = "Employee Info";
                lblEmployees.Visible = false;
            }
        }
        protected void btnDocuments_Click(object sender, EventArgs e)
        {
            if (btnDocuments.Text == "Documents")
            {
                dtvDocuments.Visible = true;
                gvDocuments.Visible = true;
                btnDocuments.Text = "Hide Documents";
                lblDocuments.Visible = true;
            }
            else
            {
                dtvDocuments.Visible = false;
                gvDocuments.Visible = false;
                btnDocuments.Text = "Documents";
                lblDocuments.Visible = false;
            }
        }
        protected void btnDrugTestResults_Click(object sender, EventArgs e)
        {
            if (btnDrugTestResults.Text == "DrugTestResults")
            {
                dtvDrugTestResults.Visible = true;
                gvDrugTestResults.Visible = true;
                btnDrugTestResults.Text = "Hide DrugTestResults";
                lblDrugTestResults.Visible = true;
            }
            else
            {
                dtvDrugTestResults.Visible = false;
                gvDrugTestResults.Visible = false;
                btnDrugTestResults.Text = "DrugTestResults";
                lblDrugTestResults.Visible = false;
            }
        }
        protected void btnPreviousEmployers_Click(object sender, EventArgs e)
        {
            if (btnPreviousEmployers.Text == "CurrentAndPreviousEmployers")
            {
                dtvPreviousEmployers.Visible = true;
                gvPreviousEmployers.Visible = true;
                btnPreviousEmployers.Text = "Hide CurrentAndPreviousEmployers";
                lblPreviousEmployers.Visible = true;
            }
            else
            {
                dtvPreviousEmployers.Visible = false;
                gvPreviousEmployers.Visible = false;
                btnPreviousEmployers.Text = "CurrentAndPreviousEmployers";
                lblPreviousEmployers.Visible = false;
            }
        }
        protected void ddlEmployee_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmployee.SelectedValue != "")
            {
                btnEmployees.Visible = true;
                btnDocuments.Visible = true;
                btnDrugTestResults.Visible = true;
                btnPreviousEmployers.Visible = true;
            }
            else
            {
                btnEmployees.Visible = false;
                btnEmployees.Text = "Employee Info";
                btnDocuments.Visible = false;
                btnDocuments.Text = "Documents";
                btnDrugTestResults.Visible = false;
                btnDrugTestResults.Text = "DrugTestResults";
                btnPreviousEmployers.Visible = false;
                btnPreviousEmployers.Text = "CurrentAndPreviousEmployers";
                lblEmployees.Visible = false;
                lblDocuments.Visible = false;
                lblDrugTestResults.Visible = false;
                lblPreviousEmployers.Visible = false;
                dtvEmployees.Visible = false;
                dtvDocuments.Visible = false;
                gvDocuments.Visible = false;
                dtvDrugTestResults.Visible = false;
                gvDrugTestResults.Visible = false;
                dtvPreviousEmployers.Visible = false;
                gvPreviousEmployers.Visible = false;
            }
        }
        // these are for the confirm delete popup when deleting a record
        protected void gvRowDataBound(object sender, GridViewRowEventArgs e)
        {
            MyUtilities2.gv_AddConfirmDeletePopupOnRowDataBoundEvent(sender, e);
        }
        protected void dtvEmployee_ItemCreated(object sender, EventArgs e)
        {
            if (btnEmployees.Text == "Hide Employees") { MyUtilities2.dtv_AddConfirmDeletePopupOnItemCreatedEvent(sender, e, dtvEmployees); }
        }
        protected void dtvDocuments_ItemCreated(object sender, EventArgs e)
        {
            if (btnDocuments.Text == "Hide Documents") { MyUtilities2.dtv_AddConfirmDeletePopupOnItemCreatedEvent(sender, e, dtvDocuments); }
        }
        protected void dtvDrugTestResults_ItemCreated(object sender, EventArgs e)
        {
            if (btnDrugTestResults.Text == "Hide DrugTestResults") { MyUtilities2.dtv_AddConfirmDeletePopupOnItemCreatedEvent(sender, e, dtvDrugTestResults); }
        }
        protected void dtvPreviousEmployers_ItemCreated(object sender, EventArgs e)
        {
            if (btnPreviousEmployers.Text == "Hide CurrentAndPreviousEmployers") { MyUtilities2.dtv_AddConfirmDeletePopupOnItemCreatedEvent(sender, e, dtvPreviousEmployers); }
        }
    }
}