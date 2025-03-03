using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WingtipToys
{
  public partial class Contact : Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {
        lblCompanyName.Text = MyUtilities2.CompanyName;
        lblCompanyAddress.Text = MyUtilities2.CompanyAddress;
        lblCompanyCityStateZip.Text = MyUtilities2.CompanyCity + ", " + MyUtilities2.CompanyState + "  " + MyUtilities2.CompanyZipCode;
        lblCompanyPhone.Text = MyUtilities2.CompanyPhone;
        lblCompanyEmail.Text = MyUtilities2.CompanyEmail;
        lnkSupport.Text = MyUtilities2.WebsiteHelpEmail;
        lnkSupport.NavigateUrl = "mailto:" + MyUtilities2.WebsiteHelpEmail;
    }
  }
}