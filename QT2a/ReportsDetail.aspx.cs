using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WingtipToys.QT2a
{
    public partial class ReportsDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["EmployeeID"] != null) 
            {
                dtvEmployee.Visible = true;
            }
            if (Request.QueryString["DocID"] != null)
            {
                dtvDocument.Visible = true;
            }
        }
    }
}