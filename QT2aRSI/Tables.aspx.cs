using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WingtipToys.QT2aRSI
{
    public partial class Tables : System.Web.UI.Page
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
        protected void btnEmployees_Click(object sender, EventArgs e)
        {
            if (btnEmployees.Text == "Employees")
            {
                dtvEmployees.Visible = true;
                gvEmployees.Visible = true;
                btnEmployees.Text = "Hide Employees";
                lblEmployees.Visible = true;
            }
            else
            {
                dtvEmployees.Visible = false;
                gvEmployees.Visible = false;
                btnEmployees.Text = "Employees";
                lblEmployees.Visible = false;
            }
        }
        protected void btnCompanies_Click(object sender, EventArgs e)
        {
            if (btnCompanies.Text == "Companies")
            {
                dtvCompany.Visible = true;
                gvCompany.Visible = true;
                btnCompanies.Text = "Hide Companies";
                lblCompanies.Visible = true;
            }
            else
            {
                dtvCompany.Visible = false;
                gvCompany.Visible = false;
                btnCompanies.Text = "Companies";
                lblCompanies.Visible = false;
            }
        }
        protected void btnPrograms_Click(object sender, EventArgs e)
        {
            if (btnPrograms.Text == "Programs")
            {
                dtvPrograms.Visible = true;
                gvPrograms.Visible = true;
                btnPrograms.Text = "Hide Programs";
                lblPrograms.Visible = true;
            }
            else
            {
                dtvPrograms.Visible = false;
                gvPrograms.Visible = false;
                btnPrograms.Text = "Programs";
                lblPrograms.Visible = false;
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
            if (btnPreviousEmployers.Text == "PreviousEmployers")
            {
                dtvPreviousEmployers.Visible = true;
                gvPreviousEmployers.Visible = true;
                btnPreviousEmployers.Text = "Hide PreviousEmployers";
                lblPreviousEmployers.Visible = true;
            }
            else
            {
                dtvPreviousEmployers.Visible = false;
                gvPreviousEmployers.Visible = false;
                btnPreviousEmployers.Text = "PreviousEmployers";
                lblPreviousEmployers.Visible = false;
            }
        }
        protected void btnDocTypes_Click(object sender, EventArgs e)
        {
            if (btnDocTypes.Text == "DocTypes")
            {
                dtvDocTypes.Visible = true;
                gvDocTypes.Visible = true;
                btnDocTypes.Text = "Hide DocTypes";
                lblDocTypes.Visible = true;
            }
            else
            {
                dtvDocTypes.Visible = false;
                gvDocTypes.Visible = false;
                btnDocTypes.Text = "DocTypes";
                lblDocTypes.Visible = false;
            }
        }
        protected void btnDocStatus_Click(object sender, EventArgs e)
        {
            if (btnDocStatus.Text == "DocStatus")
            {
                dtvDocStatus.Visible = true;
                gvDocStatus.Visible = true;
                btnDocStatus.Text = "Hide DocStatus";
                lblDocStatus.Visible = true;
            }
            else
            {
                dtvDocStatus.Visible = false;
                gvDocStatus.Visible = false;
                btnDocStatus.Text = "DocStatus";
                lblDocStatus.Visible = false;
            }
        }
        protected void btnCollectionSites_Click(object sender, EventArgs e)
        {
            if (btnCollectionSites.Text == "CollectionSites")
            {
                dtvCollectionSites.Visible = true;
                gvCollectionSites.Visible = true;
                btnCollectionSites.Text = "Hide CollectionSites";
                lblCollectionSites.Visible = true;
            }
            else
            {
                dtvCollectionSites.Visible = false;
                gvCollectionSites.Visible = false;
                btnCollectionSites.Text = "CollectionSites";
                lblCollectionSites.Visible = false;
            }
        }
        protected void btnLaboratories_Click(object sender, EventArgs e)
        {
            if (btnLaboratories.Text == "Laboratories")
            {
                dtvLabs.Visible = true;
                gvLabs.Visible = true;
                btnLaboratories.Text = "Hide Laboratories";
                lblLaboratories.Visible = true;
            }
            else
            {
                dtvLabs.Visible = false;
                gvLabs.Visible = false;
                btnLaboratories.Text = "Laboratories";
                lblLaboratories.Visible = false;
            }
        }
        protected void btnMedicalReviewOfficers_Click(object sender, EventArgs e)
        {
            if (btnMedicalReviewOfficers.Text == "MedicalReviewOfficers")
            {
                dtvMRO.Visible = true;
                gvMRO.Visible = true;
                btnMedicalReviewOfficers.Text = "Hide MedicalReviewOfficers";
                lblMedicalReviewOfficers.Visible = true;
            }
            else
            {
                dtvMRO.Visible = false;
                gvMRO.Visible = false;
                btnMedicalReviewOfficers.Text = "MedicalReviewOfficers";
                lblMedicalReviewOfficers.Visible = false;
            }
        }
        protected void btnDrugTestTypes_Click(object sender, EventArgs e)
        {
            if (btnDrugTestTypes.Text == "DrugTestTypes")
            {
                dtvDrugTestType.Visible = true;
                gvDrugTestType.Visible = true;
                btnDrugTestTypes.Text = "Hide DrugTestTypes";
                lblDrugTestTypes.Visible = true;
            }
            else
            {
                dtvDrugTestType.Visible = false;
                gvDrugTestType.Visible = false;
                btnDrugTestTypes.Text = "DrugTestTypes";
                lblDrugTestTypes.Visible = false;
            }
        }
        protected void btnDrugTypes_Click(object sender, EventArgs e)
        {
            if (btnDrugTypes.Text == "DrugTypes")
            {
                dtvDrugType.Visible = true;
                gvDrugType.Visible = true;
                btnDrugTypes.Text = "Hide DrugTypes";
                lblDrugTypes.Visible = true;
            }
            else
            {
                dtvDrugType.Visible = false;
                gvDrugType.Visible = false;
                btnDrugTypes.Text = "DrugTypes";
                lblDrugTypes.Visible = false;
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
        protected void dtvCompany_ItemCreated(object sender, EventArgs e)
        {
            if (btnCompanies.Text == "Hide Companies") { MyUtilities2.dtv_AddConfirmDeletePopupOnItemCreatedEvent(sender, e, dtvCompany); }
        }
        protected void dtvPrograms_ItemCreated(object sender, EventArgs e)
        {
            if (btnPrograms.Text == "Hide Programs") { MyUtilities2.dtv_AddConfirmDeletePopupOnItemCreatedEvent(sender, e, dtvPrograms); }
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
            if (btnPreviousEmployers.Text == "Hide PreviousEmployers") { MyUtilities2.dtv_AddConfirmDeletePopupOnItemCreatedEvent(sender, e, dtvPreviousEmployers); }
        }
        protected void dtvDocTypes_ItemCreated(object sender, EventArgs e)
        {
            if (btnDocTypes.Text == "Hide DocTypes") { MyUtilities2.dtv_AddConfirmDeletePopupOnItemCreatedEvent(sender, e, dtvDocTypes); }
        }
        protected void dtvDocStatus_ItemCreated(object sender, EventArgs e)
        {
            if (btnDocStatus.Text == "Hide DocStatus") { MyUtilities2.dtv_AddConfirmDeletePopupOnItemCreatedEvent(sender, e, dtvDocStatus); }
        }
        protected void dtvCollectionSites_ItemCreated(object sender, EventArgs e)
        {
            if (btnCollectionSites.Text == "Hide CollectionSites") { MyUtilities2.dtv_AddConfirmDeletePopupOnItemCreatedEvent(sender, e, dtvCollectionSites); }
        }
        protected void dtvLabs_ItemCreated(object sender, EventArgs e)
        {
            if (btnLaboratories.Text == "Hide Laboratories") { MyUtilities2.dtv_AddConfirmDeletePopupOnItemCreatedEvent(sender, e, dtvLabs); }
        }
        protected void dtvMRO_ItemCreated(object sender, EventArgs e)
        {
            if (btnMedicalReviewOfficers.Text == "Hide MedicalReviewOfficers") { MyUtilities2.dtv_AddConfirmDeletePopupOnItemCreatedEvent(sender, e, dtvMRO); }
        }
        protected void dvtDrugTestType_ItemCreated(object sender, EventArgs e)
        {
            if (btnDrugTestTypes.Text == "Hide DrugTestTypes") { MyUtilities2.dtv_AddConfirmDeletePopupOnItemCreatedEvent(sender, e, dtvDrugTestType); }
        }
        protected void dtvDrugType_ItemCreated(object sender, EventArgs e)
        {
            if (btnDrugTypes.Text == "Hide DrugTypes") { MyUtilities2.dtv_AddConfirmDeletePopupOnItemCreatedEvent(sender, e, dtvDrugType); }
        }
    }
}