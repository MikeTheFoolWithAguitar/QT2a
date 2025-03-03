using SendGrid;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WingtipToys.QT2a
{
    public partial class Reports : System.Web.UI.Page
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

                String sql = "SQL STRING NOT SET YET";
                // populate the company ddl
                if (HttpContext.Current.User.IsInRole("RSI"))
                {
                    sql = "select * from Companies order by companyname";
                }// end if RSI
                else // role is not SuperUser, this is for a company 
                {
                    // get the company for this user
                    sql = "select CompID from Securities where UserName='" + HttpContext.Current.User.Identity.Name+"'";
                    System.Data.SqlClient.SqlCommand dbcomm1 = new System.Data.SqlClient.SqlCommand(sql, dbconn);
                    int intCompID = (int)dbcomm1.ExecuteScalar();
                    sql = "select * from companies where compid=" + intCompID + " order by companyname";
                    dbcomm1.Dispose();
                } // end else not RSI

                System.Data.SqlClient.SqlCommand dbcommCompany = new System.Data.SqlClient.SqlCommand(sql, dbconn);
                System.Data.SqlClient.SqlDataReader dbreadCompany; // new reader for the company
                dbreadCompany = dbcommCompany.ExecuteReader(); //execute command
                if (dbreadCompany.HasRows)
                {
                    if (HttpContext.Current.User.IsInRole("RSI"))
                    {
                        ddlCompany.DataSource = dbreadCompany;
                        ddlCompany.DataTextField = "CompanyName";
                        ddlCompany.DataValueField = "CompID";
                        ddlCompany.DataBind();
                    }
                    else
                    {
                        dbreadCompany.Read();
                        ddlCompany.Items.FindByValue("").Selected = true;
                        ddlCompany.Items.FindByValue("").Text = dbreadCompany["CompanyName"].ToString();
                        ddlCompany.Items.FindByValue("").Value = dbreadCompany["CompID"].ToString();
                    }
                }

                // close the db objects
                dbreadCompany.Close();
                dbconn.Close();
                dbconn.Dispose();
                dbcommCompany.Dispose();
            }//end else this is not a post back
        }//end Page_Load
        protected void btnEmployeeList_Click(object sender, EventArgs e)
        {
            if (ddlCompany.SelectedValue == "") { ddlCompany.Focus(); }
            else
            {
                // open the db connection and setup a command and reader
                String connStr = ConfigurationManager.ConnectionStrings["QT2a"].ConnectionString;
                System.Data.SqlClient.SqlConnection dbconn = new System.Data.SqlClient.SqlConnection(connStr);
                dbconn.Open();
                String sql = "select e.employeeid, e.LName+', '+e.Fname as EmployeeName  from employees e, prevemployers p where e.EmployeeID = p.EmployeeID and p.CompID =" + ddlCompany.SelectedValue + " and p.TerminationDate is null order by LName, FName";
                System.Data.SqlClient.SqlCommand dbcomm = new System.Data.SqlClient.SqlCommand(sql, dbconn);
                System.Data.SqlClient.SqlDataReader dbread;
                dbread = dbcomm.ExecuteReader(); //execute command
                if (dbread.HasRows)
                {
                    repeaterEmployeeList.DataSource = dbread;
                    repeaterEmployeeList.DataBind();
                    repeaterEmployeeList.Visible = true;
                    lblEmployeeListNoEmployees.Visible = true;
                    lblEmployeeListNoEmployees.Text = "Email the Employee List to an email address below:";
                    btnEmployeeListEmail.Visible = true;
                    txtUserNameEmployeeList.Visible = true;
                }
                else // no data, clear the repeater by setting the datasource to null and then databind
                {
                    repeaterEmployeeList.DataSource = null;
                    repeaterEmployeeList.DataBind();
                    repeaterEmployeeList.Visible = false;
                    lblEmployeeListNoEmployees.Visible = true;
                }

                // close the db objects
                dbread.Close();
                dbconn.Close();
                dbconn.Dispose();
                dbcomm.Dispose();
            }
        }
        protected void btnRandomList_Click(object sender, EventArgs e)
        {
            if (ddlCompany.SelectedValue == "") { ddlCompany.Focus(); }
            else
            {
                // open the db connection and setup a command and reader
                String connStr = ConfigurationManager.ConnectionStrings["QT2a"].ConnectionString;
                System.Data.SqlClient.SqlConnection dbconn = new System.Data.SqlClient.SqlConnection(connStr);
                dbconn.Open();
                String sql = "select e.employeeid, e.LName+', '+e.Fname as EmployeeName, e.CDLDriver, d.randomdate, d.collectiondate  from employees e, prevemployers p, drugtestresults d where e.EmployeeID = p.EmployeeID and p.CompID =" + ddlCompany.SelectedValue + " and p.TerminationDate is null and d.EmployeeId=e.EmployeeId and d.RandomDate is not null order by LName, FName, d.RandomDate desc";
                System.Data.SqlClient.SqlCommand dbcomm = new System.Data.SqlClient.SqlCommand(sql, dbconn);
                System.Data.SqlClient.SqlDataReader dbread;
                dbread = dbcomm.ExecuteReader(); //execute command
                if (dbread.HasRows)
                {
                    repeaterRandomList.DataSource = dbread;
                    repeaterRandomList.DataBind();
                    repeaterRandomList.Visible = true;
                    lblRandomListNoEmployees.Visible = true;
                    lblRandomListNoEmployees.Text = "Email the Randomly Selected List to an email address below:";
                    btnRandomListEmail.Visible = true;
                    txtUserNameRandomList.Visible = true;
                }
                else // no data, clear the repeater by setting the datasource to null and then databind
                {
                    repeaterRandomList.DataSource = null;
                    repeaterRandomList.DataBind();
                    repeaterRandomList.Visible = false;
                    lblRandomListNoEmployees.Visible = true;
                }

                // close the db objects
                dbread.Close();
                dbconn.Close();
                dbconn.Dispose();
                dbcomm.Dispose();
            }
        }
        protected void btnDriverQualificationFile_Click(object sender, EventArgs e)
        {
            if (ddlCompany.SelectedValue == "") { ddlCompany.Focus(); }
            else
            {
                // open the db connection and setup a command and reader
                String connStr = ConfigurationManager.ConnectionStrings["QT2a"].ConnectionString;
                System.Data.SqlClient.SqlConnection dbconn = new System.Data.SqlClient.SqlConnection(connStr);
                dbconn.Open();
                String sql = "select e.employeeid, e.LName+', '+e.Fname as EmployeeName  from employees e, prevemployers p where e.EmployeeID = p.EmployeeID and p.CompID =" + ddlCompany.SelectedValue + " and p.TerminationDate is null order by LName, FName";
                System.Data.SqlClient.SqlCommand dbcomm = new System.Data.SqlClient.SqlCommand(sql, dbconn);
                System.Data.SqlClient.SqlDataReader dbread;
                dbread = dbcomm.ExecuteReader(); //execute command
                if (dbread.HasRows)
                {
                    repeaterDQF.DataSource = dbread;
                    repeaterDQF.DataBind();
                    repeaterDQF.Visible = true;
                    lblDQFNoEmployees.Visible = true;
                    lblDQFNoEmployees.Text = "Email the Driver Qualification File to an email address below:";
                    btnEmailDQF.Visible = true;
                    txtUserName.Visible = true;
                }
                else // no data, clear the repeater by setting the datasource to null and then databind
                {
                    repeaterDQF.DataSource = null;
                    repeaterDQF.DataBind();
                    repeaterDQF.Visible = false;
                    lblDQFNoEmployees.Visible = true;
                    btnEmailDQF.Visible = false;
                    txtUserName.Visible = false;
                }

                // close the db objects
                dbread.Close();
                dbconn.Close();
                dbconn.Dispose();
                dbcomm.Dispose();
            }
        }
        protected void repeaterDQF_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            // open the db connection and setup a command and reader
            String sql = "Not set yet";
            String connStr = ConfigurationManager.ConnectionStrings["QT2a"].ConnectionString;
            System.Data.SqlClient.SqlConnection dbconn = new System.Data.SqlClient.SqlConnection(connStr);
            dbconn.Open();
            System.Data.SqlClient.SqlCommand dbcomm = new System.Data.SqlClient.SqlCommand(sql, dbconn);
            System.Data.SqlClient.SqlDataReader dbread;
            int EmpID = 0;
            if ((e.Item.ItemType == ListItemType.Item) ||
                (e.Item.ItemType == ListItemType.AlternatingItem))
            {
                EmpID = Convert.ToInt32(DataBinder.Eval(e.Item.DataItem, "EmployeeID"));
            }
            // Nested Repeater - This technique worked, keep this as a reference.
            // This worked except the part trying to turn on redlight.gif.
            // the repeater was null in the footer.
            //// BEGIN Q200
            //sql = "select top 1 docid,status from documents where employeeid=" + EmpID.ToString() + " and DocTypeID=8 order by docid desc";
            //dbcomm.CommandText = sql;
            //dbread = dbcomm.ExecuteReader(); //execute command
            //// find the nested repeater
            //Repeater repeaterQ200 = (Repeater)e.Item.FindControl("repeaterQ200");
            //if ((e.Item.ItemType == ListItemType.Item) ||
            //    (e.Item.ItemType == ListItemType.AlternatingItem))
            //{
            //    // see if there is a document of this type
            //    if (dbread.HasRows)
            //    {
            //        // we have a document of this type, bind it to the repeater.
            //        repeaterQ200.DataSource = dbread;
            //        repeaterQ200.DataBind();
            //    }
            //}
            //// turn on the redlight in the footer if there are no documents
            //// Repeater repeaterQ200red = (Repeater)e.Item.FindControl("repeaterQ200");
            //// NOT WORKING, the repeater is null
            //if (repeaterQ200 != null && repeaterQ200.Items.Count < 1)
            //{

            //    if (e.Item.ItemType == ListItemType.Footer)
            //    {
            //        Image imageQ200redlight = (Image)e.Item.FindControl("imageQ200redlight");
            //        if (imageQ200redlight != null)
            //        {
            //            imageQ200redlight.Visible = true;
            //        }
            //    }
            //}
            ////        if (repeaterQ200red.Items.Count < 1)
            ////        { 
            ////            //if (e.Item.ItemType == ListItemType.Footer)
            ////            //{
            ////                //Label lblFooter = (Label)e.Item.FindControl("lblEmptyData");
            ////                //if (lblFooter!=null){lblFooter.Visible = true;}                
            ////            //}
            ////        }
            //// END Q200
            //
            //
            // Nested DetailsView 
            // This worked and should be kept as a reference.
            // whatever is selected gets populated into a blank detailsview
            //// BEGIN Q300
            //sql = "select top 1 docid,status from documents where employeeid=" + EmpID.ToString() + " and DocTypeID=9 order by docid desc";
            //dbread.Close();
            //dbcomm.CommandText = sql;
            //dbread = dbcomm.ExecuteReader(); //execute command
            //// find the details view
            //DetailsView dtvQ300 = (DetailsView)e.Item.FindControl("dtvQ300");
            //if ((e.Item.ItemType == ListItemType.Item) ||
            //    (e.Item.ItemType == ListItemType.AlternatingItem))
            //{
            //    // see if there is a document of this type
            //    if (dbread.HasRows)
            //    {
            //        // we have a document of this type, bind it to the detailsview.
            //        dtvQ300.DataSource = dbread;
            //        dtvQ300.DataBind();
            //    }
            //}
            //// END Q300
            // BEGIN Q200
            sql = "select top 1 docid,status from documents where employeeid=" + EmpID.ToString() + " and DocTypeID=8 order by docid desc";
            dbcomm.CommandText = sql;
            dbread = dbcomm.ExecuteReader(); //execute command
            // find the images
            Image imageQ200 = (Image)e.Item.FindControl("imageQ200");
            HyperLink linkQ200 = (HyperLink)e.Item.FindControl("linkQ200");
            if ((e.Item.ItemType == ListItemType.Item) ||
                (e.Item.ItemType == ListItemType.AlternatingItem))
            {
                // reset the image to redlight
                imageQ200.ImageUrl = MyUtilities2.WebsiteUrl + "/Images/redlight.gif";
                linkQ200.ImageUrl = MyUtilities2.WebsiteUrl + "/Images/doc01.gif";
                linkQ200.Visible = true;
                linkQ200.NavigateUrl = "";
                // see if there is a document of this type
                if (dbread.HasRows)
                {
                    // we have a document of this type
                    // check the status and set the image
                    // then create a link for the doc image
                    dbread.Read();
                    if (dbread["Status"].ToString() == "R" || dbread["Status"].ToString() == "CR" || dbread["Status"].ToString() == "PR")
                    { imageQ200.ImageUrl = MyUtilities2.WebsiteUrl+"/Images/greenlight.gif"; }
                    else if (dbread["Status"].ToString() == "E" || dbread["Status"].ToString() == "G")
                    { imageQ200.ImageUrl = MyUtilities2.WebsiteUrl+"/Images/yellowlight.gif"; }
                    else
                    { imageQ200.ImageUrl = MyUtilities2.WebsiteUrl+"/Images/redlight.gif"; }
                    linkQ200.NavigateUrl = MyUtilities2.WebsiteUrl+"QT2a/ReportsDetail.aspx?DocId=" + dbread["DocID"].ToString();
                }
                else // no document of this type
                {
                    // turn off the doc image
                    linkQ200.Visible = false;
                }
            }
            // END Q200
            // BEGIN Q300
            sql = "select top 1 docid,status from documents where employeeid=" + EmpID.ToString() + " and DocTypeID=9 order by docid desc";
            dbread.Close();
            dbcomm.CommandText = sql;
            dbread = dbcomm.ExecuteReader(); //execute command
            // find the images
            Image imageQ300 = (Image)e.Item.FindControl("imageQ300");
            HyperLink linkQ300 = (HyperLink)e.Item.FindControl("linkQ300");
            if ((e.Item.ItemType == ListItemType.Item) ||
                (e.Item.ItemType == ListItemType.AlternatingItem))
            {
                // reset the image to redlight
                imageQ300.ImageUrl = MyUtilities2.WebsiteUrl+"/Images/redlight.gif";
                linkQ300.ImageUrl = MyUtilities2.WebsiteUrl + "/Images/doc01.gif";
                linkQ300.Visible = true;
                linkQ300.NavigateUrl = "";
                // see if there is a document of this type
                if (dbread.HasRows)
                {
                    // we have a document of this type
                    // check the status and set the image
                    // then create a link for the doc image
                    dbread.Read();
                    if (dbread["Status"].ToString() == "R" || dbread["Status"].ToString() == "CR" || dbread["Status"].ToString() == "PR")
                    { imageQ300.ImageUrl = MyUtilities2.WebsiteUrl+"/Images/greenlight.gif"; }
                    else if (dbread["Status"].ToString() == "E" || dbread["Status"].ToString() == "G")
                    { imageQ300.ImageUrl = MyUtilities2.WebsiteUrl+"/Images/yellowlight.gif"; }
                    else
                    { imageQ300.ImageUrl = MyUtilities2.WebsiteUrl+"/Images/redlight.gif"; }
                    linkQ300.NavigateUrl = MyUtilities2.WebsiteUrl+"QT2a/ReportsDetail.aspx?DocId=" + dbread["DocID"].ToString();
                }
                else // no document of this type
                {
                    // turn off the doc image
                    linkQ300.Visible = false;
                }
            }
            // END Q300
            //// BEGIN Q335
            //sql = "select top 1 docid,status from documents where employeeid=" + EmpID.ToString() + " and DocTypeID=12 order by docid desc";
            //dbread.Close();
            //dbcomm.CommandText = sql;
            //dbread = dbcomm.ExecuteReader(); //execute command
            //// find the images
            //Image imageQ335 = (Image)e.Item.FindControl("imageQ335");
            //HyperLink linkQ335 = (HyperLink)e.Item.FindControl("linkQ335");
            //if ((e.Item.ItemType == ListItemType.Item) ||
            //    (e.Item.ItemType == ListItemType.AlternatingItem))
            //{
            //    // reset the image to redlight
            //    imageQ335.ImageUrl = MyUtilities2.WebsiteUrl+"/Images/redlight.gif";
            //    linkQ335.ImageUrl = MyUtilities2.WebsiteUrl + "/Images/doc01.gif";
            //    linkQ335.Visible = true;
            //    linkQ335.NavigateUrl = "";
            //    // see if there is a document of this type
            //    if (dbread.HasRows)
            //    {
            //        // we have a document of this type
            //        // check the status and set the image
            //        // then create a link for the doc image
            //        dbread.Read();
            //        if (dbread["Status"].ToString() == "R" || dbread["Status"].ToString() == "CR" || dbread["Status"].ToString() == "PR")
            //        { imageQ335.ImageUrl = MyUtilities2.WebsiteUrl+"/Images/greenlight.gif"; }
            //        else if (dbread["Status"].ToString() == "E" || dbread["Status"].ToString() == "G")
            //        { imageQ335.ImageUrl = MyUtilities2.WebsiteUrl+"/Images/yellowlight.gif"; }
            //        else
            //        { imageQ335.ImageUrl = MyUtilities2.WebsiteUrl+"/Images/redlight.gif"; }
            //        linkQ335.NavigateUrl = MyUtilities2.WebsiteUrl+"QT2a/ReportsDetail.aspx?DocId=" + dbread["DocID"].ToString();
            //    }
            //    else // no document of this type
            //    {
            //        // turn off the doc image
            //        linkQ335.Visible = false;
            //    }
            //}
            //// END Q335
            // BEGIN Q400
            sql = "select top 1 docid,status from documents where employeeid=" + EmpID.ToString() + " and DocTypeID=21 order by docid desc";
            dbread.Close();
            dbcomm.CommandText = sql;
            dbread = dbcomm.ExecuteReader(); //execute command
            // find the images
            Image imageQ400 = (Image)e.Item.FindControl("imageQ400");
            HyperLink linkQ400 = (HyperLink)e.Item.FindControl("linkQ400");
            if ((e.Item.ItemType == ListItemType.Item) ||
                (e.Item.ItemType == ListItemType.AlternatingItem))
            {
                // reset the image to redlight
                imageQ400.ImageUrl = MyUtilities2.WebsiteUrl+"/Images/redlight.gif";
                linkQ400.ImageUrl = MyUtilities2.WebsiteUrl + "/Images/doc01.gif";
                linkQ400.Visible = true;
                linkQ400.NavigateUrl = "";
                // see if there is a document of this type
                if (dbread.HasRows)
                {
                    // we have a document of this type
                    // check the status and set the image
                    // then create a link for the doc image
                    dbread.Read();
                    if (dbread["Status"].ToString() == "R" || dbread["Status"].ToString() == "CR" || dbread["Status"].ToString() == "PR")
                    { imageQ400.ImageUrl = MyUtilities2.WebsiteUrl+"/Images/greenlight.gif"; }
                    else if (dbread["Status"].ToString() == "E" || dbread["Status"].ToString() == "G")
                    { imageQ400.ImageUrl = MyUtilities2.WebsiteUrl+"/Images/yellowlight.gif"; }
                    else
                    { imageQ400.ImageUrl = MyUtilities2.WebsiteUrl+"/Images/redlight.gif"; }
                    linkQ400.NavigateUrl = MyUtilities2.WebsiteUrl+"QT2a/ReportsDetail.aspx?DocId=" + dbread["DocID"].ToString();
                }
                else // no document of this type
                {
                    // turn off the doc image
                    linkQ400.Visible = false;
                }
            }
            // END Q400
            // BEGIN Q500
            sql = "select top 1 docid,status from documents where employeeid=" + EmpID.ToString() + " and DocTypeID=23 order by docid desc";
            dbread.Close();
            dbcomm.CommandText = sql;
            dbread = dbcomm.ExecuteReader(); //execute command
            // find the images
            Image imageQ500 = (Image)e.Item.FindControl("imageQ500");
            HyperLink linkQ500 = (HyperLink)e.Item.FindControl("linkQ500");
            if ((e.Item.ItemType == ListItemType.Item) ||
                (e.Item.ItemType == ListItemType.AlternatingItem))
            {
                // reset the image to redlight
                imageQ500.ImageUrl = MyUtilities2.WebsiteUrl+"/Images/redlight.gif";
                linkQ500.ImageUrl = MyUtilities2.WebsiteUrl + "/Images/doc01.gif";
                linkQ500.Visible = true;
                linkQ500.NavigateUrl = "";
                // see if there is a document of this type
                if (dbread.HasRows)
                {
                    // we have a document of this type
                    // check the status and set the image
                    // then create a link for the doc image
                    dbread.Read();
                    if (dbread["Status"].ToString() == "R" || dbread["Status"].ToString() == "CR" || dbread["Status"].ToString() == "PR")
                    { imageQ500.ImageUrl = MyUtilities2.WebsiteUrl+"/Images/greenlight.gif"; }
                    else if (dbread["Status"].ToString() == "E" || dbread["Status"].ToString() == "G")
                    { imageQ500.ImageUrl = MyUtilities2.WebsiteUrl+"/Images/yellowlight.gif"; }
                    else
                    { imageQ500.ImageUrl = MyUtilities2.WebsiteUrl+"/Images/redlight.gif"; }
                    linkQ500.NavigateUrl = MyUtilities2.WebsiteUrl+"QT2a/ReportsDetail.aspx?DocId=" + dbread["DocID"].ToString();
                }
                else // no document of this type
                {
                    // turn off the doc image
                    linkQ500.Visible = false;
                }
            }
            // END Q500
            // BEGIN Q600
            sql = "select top 1 docid,status from documents where employeeid=" + EmpID.ToString() + " and DocTypeID=24 order by docid desc";
            dbread.Close();
            dbcomm.CommandText = sql;
            dbread = dbcomm.ExecuteReader(); //execute command
            // find the images
            Image imageQ600 = (Image)e.Item.FindControl("imageQ600");
            HyperLink linkQ600 = (HyperLink)e.Item.FindControl("linkQ600");
            if ((e.Item.ItemType == ListItemType.Item) ||
                (e.Item.ItemType == ListItemType.AlternatingItem))
            {
                // reset the image to redlight
                imageQ600.ImageUrl = MyUtilities2.WebsiteUrl+"/Images/redlight.gif";
                linkQ600.ImageUrl = MyUtilities2.WebsiteUrl + "/Images/doc01.gif";
                linkQ600.Visible = true;
                linkQ600.NavigateUrl = "";
                // see if there is a document of this type
                if (dbread.HasRows)
                {
                    // we have a document of this type
                    // check the status and set the image
                    // then create a link for the doc image
                    dbread.Read();
                    if (dbread["Status"].ToString() == "R" || dbread["Status"].ToString() == "CR" || dbread["Status"].ToString() == "PR")
                    { imageQ600.ImageUrl = MyUtilities2.WebsiteUrl+"/Images/greenlight.gif"; }
                    else if (dbread["Status"].ToString() == "E" || dbread["Status"].ToString() == "G")
                    { imageQ600.ImageUrl = MyUtilities2.WebsiteUrl+"/Images/yellowlight.gif"; }
                    else
                    { imageQ600.ImageUrl = MyUtilities2.WebsiteUrl+"/Images/redlight.gif"; }
                    linkQ600.NavigateUrl = MyUtilities2.WebsiteUrl+"QT2a/ReportsDetail.aspx?DocId=" + dbread["DocID"].ToString();
                }
                else // no document of this type
                {
                    // turn off the doc image
                    linkQ600.Visible = false;
                }
            }
            // END Q600
            //// BEGIN Q610
            //sql = "select top 1 docid,status from documents where employeeid=" + EmpID.ToString() + " and DocTypeID=14 order by docid desc";
            //dbread.Close();
            //dbcomm.CommandText = sql;
            //dbread = dbcomm.ExecuteReader(); //execute command
            //// find the images
            //Image imageQ610 = (Image)e.Item.FindControl("imageQ610");
            //HyperLink linkQ610 = (HyperLink)e.Item.FindControl("linkQ610");
            //if ((e.Item.ItemType == ListItemType.Item) ||
            //    (e.Item.ItemType == ListItemType.AlternatingItem))
            //{
            //    // reset the image to redlight
            //    imageQ610.ImageUrl = MyUtilities2.WebsiteUrl+"/Images/redlight.gif";
            //    linkQ610.ImageUrl = MyUtilities2.WebsiteUrl + "/Images/doc01.gif";
            //    linkQ610.Visible = true;
            //    linkQ610.NavigateUrl = "";
            //    // see if there is a document of this type
            //    if (dbread.HasRows)
            //    {
            //        // we have a document of this type
            //        // check the status and set the image
            //        // then create a link for the doc image
            //        dbread.Read();
            //        if (dbread["Status"].ToString() == "R" || dbread["Status"].ToString() == "CR" || dbread["Status"].ToString() == "PR")
            //        { imageQ610.ImageUrl = MyUtilities2.WebsiteUrl+"/Images/greenlight.gif"; }
            //        else if (dbread["Status"].ToString() == "E" || dbread["Status"].ToString() == "G")
            //        { imageQ610.ImageUrl = MyUtilities2.WebsiteUrl+"/Images/yellowlight.gif"; }
            //        else
            //        { imageQ610.ImageUrl = MyUtilities2.WebsiteUrl+"/Images/redlight.gif"; }
            //        linkQ610.NavigateUrl = MyUtilities2.WebsiteUrl+"QT2a/ReportsDetail.aspx?DocId=" + dbread["DocID"].ToString();
            //    }
            //    else // no document of this type
            //    {
            //        // turn off the doc image
            //        linkQ610.Visible = false;
            //    }
            //}
            //// END Q610
            //// BEGIN Q700
            //sql = "select top 1 docid,status from documents where employeeid=" + EmpID.ToString() + " and DocTypeID=15 order by docid desc";
            //dbread.Close();
            //dbcomm.CommandText = sql;
            //dbread = dbcomm.ExecuteReader(); //execute command
            //// find the images
            //Image imageQ700 = (Image)e.Item.FindControl("imageQ700");
            //HyperLink linkQ700 = (HyperLink)e.Item.FindControl("linkQ700");
            //if ((e.Item.ItemType == ListItemType.Item) ||
            //    (e.Item.ItemType == ListItemType.AlternatingItem))
            //{
            //    // reset the image to redlight
            //    imageQ700.ImageUrl = MyUtilities2.WebsiteUrl+"/Images/redlight.gif";
            //    linkQ700.ImageUrl = MyUtilities2.WebsiteUrl + "/Images/doc01.gif";
            //    linkQ700.Visible = true;
            //    linkQ700.NavigateUrl = "";
            //    // see if there is a document of this type
            //    if (dbread.HasRows)
            //    {
            //        // we have a document of this type
            //        // check the status and set the image
            //        // then create a link for the doc image
            //        dbread.Read();
            //        if (dbread["Status"].ToString() == "R" || dbread["Status"].ToString() == "CR" || dbread["Status"].ToString() == "PR")
            //        { imageQ700.ImageUrl = MyUtilities2.WebsiteUrl+"/Images/greenlight.gif"; }
            //        else if (dbread["Status"].ToString() == "E" || dbread["Status"].ToString() == "G")
            //        { imageQ700.ImageUrl = MyUtilities2.WebsiteUrl+"/Images/yellowlight.gif"; }
            //        else
            //        { imageQ700.ImageUrl = MyUtilities2.WebsiteUrl+"/Images/redlight.gif"; }
            //        linkQ700.NavigateUrl = MyUtilities2.WebsiteUrl+"QT2a/ReportsDetail.aspx?DocId=" + dbread["DocID"].ToString();
            //    }
            //    else // no document of this type
            //    {
            //        // turn off the doc image
            //        linkQ700.Visible = false;
            //    }
            //}
            //// END Q700
            // BEGIN Q800
            sql = "select top 1 docid,status from documents where employeeid=" + EmpID.ToString() + " and DocTypeID=25 order by docid desc";
            dbread.Close();
            dbcomm.CommandText = sql;
            dbread = dbcomm.ExecuteReader(); //execute command
            // find the images
            Image imageQ800 = (Image)e.Item.FindControl("imageQ800");
            HyperLink linkQ800 = (HyperLink)e.Item.FindControl("linkQ800");
            if ((e.Item.ItemType == ListItemType.Item) ||
                (e.Item.ItemType == ListItemType.AlternatingItem))
            {
                // reset the image to redlight
                imageQ800.ImageUrl = MyUtilities2.WebsiteUrl+"/Images/redlight.gif";
                linkQ800.ImageUrl = MyUtilities2.WebsiteUrl + "/Images/doc01.gif";
                linkQ800.Visible = true;
                linkQ800.NavigateUrl = "";
                // see if there is a document of this type
                if (dbread.HasRows)
                {
                    // we have a document of this type
                    // check the status and set the image
                    // then create a link for the doc image
                    dbread.Read();
                    if (dbread["Status"].ToString() == "R" || dbread["Status"].ToString() == "CR" || dbread["Status"].ToString() == "PR")
                    { imageQ800.ImageUrl = MyUtilities2.WebsiteUrl+"/Images/greenlight.gif"; }
                    else if (dbread["Status"].ToString() == "E" || dbread["Status"].ToString() == "G")
                    { imageQ800.ImageUrl = MyUtilities2.WebsiteUrl+"/Images/yellowlight.gif"; }
                    else
                    { imageQ800.ImageUrl = MyUtilities2.WebsiteUrl+"/Images/redlight.gif"; }
                    linkQ800.NavigateUrl = MyUtilities2.WebsiteUrl+"QT2a/ReportsDetail.aspx?DocId=" + dbread["DocID"].ToString();
                }
                else // no document of this type
                {
                    // turn off the doc image
                    linkQ800.Visible = false;
                }
            }
            // END Q800
            // BEGIN Q900
            sql = "select top 1 docid,status from documents where employeeid=" + EmpID.ToString() + " and DocTypeID=16 order by docid desc";
            dbread.Close();
            dbcomm.CommandText = sql;
            dbread = dbcomm.ExecuteReader(); //execute command
            // find the images
            Image imageQ900 = (Image)e.Item.FindControl("imageQ900");
            HyperLink linkQ900 = (HyperLink)e.Item.FindControl("linkQ900");
            if ((e.Item.ItemType == ListItemType.Item) ||
                (e.Item.ItemType == ListItemType.AlternatingItem))
            {
                // reset the image to redlight
                imageQ900.ImageUrl = MyUtilities2.WebsiteUrl+"/Images/redlight.gif";
                linkQ900.ImageUrl = MyUtilities2.WebsiteUrl + "/Images/doc01.gif";
                linkQ900.Visible = true;
                linkQ900.NavigateUrl = "";
                // see if there is a document of this type
                if (dbread.HasRows)
                {
                    // we have a document of this type
                    // check the status and set the image
                    // then create a link for the doc image
                    dbread.Read();
                    if (dbread["Status"].ToString() == "R" || dbread["Status"].ToString() == "CR" || dbread["Status"].ToString() == "PR")
                    { imageQ900.ImageUrl = MyUtilities2.WebsiteUrl+"/Images/greenlight.gif"; }
                    else if (dbread["Status"].ToString() == "E" || dbread["Status"].ToString() == "G")
                    { imageQ900.ImageUrl = MyUtilities2.WebsiteUrl+"/Images/yellowlight.gif"; }
                    else
                    { imageQ900.ImageUrl = MyUtilities2.WebsiteUrl+"/Images/redlight.gif"; }
                    linkQ900.NavigateUrl = MyUtilities2.WebsiteUrl+"QT2a/ReportsDetail.aspx?DocId=" + dbread["DocID"].ToString();
                }
                else // no document of this type
                {
                    // turn off the doc image
                    linkQ900.Visible = false;
                }
            }
            // END Q900

            // close the db objects
            dbread.Close();
            dbconn.Close();
            dbconn.Dispose();
            dbcomm.Dispose();
        }
        protected void btnDAATF_Click(object sender, EventArgs e)
        {
            if (ddlCompany.SelectedValue == "") { ddlCompany.Focus(); }
            else
            {
                // open the db connection and setup a command and reader
                String connStr = ConfigurationManager.ConnectionStrings["QT2a"].ConnectionString;
                System.Data.SqlClient.SqlConnection dbconn = new System.Data.SqlClient.SqlConnection(connStr);
                dbconn.Open();
                String sql = "select e.employeeid, e.LName+', '+e.Fname as EmployeeName  from employees e, prevemployers p where e.EmployeeID = p.EmployeeID and p.CompID =" + ddlCompany.SelectedValue + " and p.TerminationDate is null order by LName, FName";
                System.Data.SqlClient.SqlCommand dbcomm = new System.Data.SqlClient.SqlCommand(sql, dbconn);
                System.Data.SqlClient.SqlDataReader dbread;
                dbread = dbcomm.ExecuteReader(); //execute command
                if (dbread.HasRows)
                {
                    repeaterDAATF.DataSource = dbread;
                    repeaterDAATF.DataBind();
                    repeaterDAATF.Visible = true;
                    lblDAATFNoEmployees.Visible = true;
                    lblDAATFNoEmployees.Text = "Email the Drug and Alcohol Testing File to an email address below:";
                    btnDAATFEmail.Visible = true;
                    txtUserNameDAATF.Visible = true;
                }
                else // no data, clear the repeater by setting the datasource to null and then databind
                {
                    repeaterDAATF.DataSource = null;
                    repeaterDAATF.DataBind();
                    repeaterDAATF.Visible = false;
                    lblDAATFNoEmployees.Visible = true;
                }

                // close the db objects
                dbread.Close();
                dbconn.Close();
                dbconn.Dispose();
                dbcomm.Dispose();
            }
        }
        protected void repeaterDAATF_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            // open the db connection and setup a command and reader
            String sql = "Not set yet";
            String connStr = ConfigurationManager.ConnectionStrings["QT2a"].ConnectionString;
            System.Data.SqlClient.SqlConnection dbconn = new System.Data.SqlClient.SqlConnection(connStr);
            dbconn.Open();
            System.Data.SqlClient.SqlCommand dbcomm = new System.Data.SqlClient.SqlCommand(sql, dbconn);
            System.Data.SqlClient.SqlDataReader dbread;
            int EmpID = 0;
            if ((e.Item.ItemType == ListItemType.Item) ||
                (e.Item.ItemType == ListItemType.AlternatingItem))
            {
                EmpID = Convert.ToInt32(DataBinder.Eval(e.Item.DataItem, "EmployeeID"));
            }
            // BEGIN I210
            sql = "select top 1 docid,status from documents where employeeid=" + EmpID.ToString() + " and DocTypeID=17 order by docid desc";
            dbcomm.CommandText = sql;
            dbread = dbcomm.ExecuteReader(); //execute command
            // find the images
            Image imageI210 = (Image)e.Item.FindControl("imageI210");
            HyperLink linkI210 = (HyperLink)e.Item.FindControl("linkI210");
            if ((e.Item.ItemType == ListItemType.Item) ||
                (e.Item.ItemType == ListItemType.AlternatingItem))
            {
                // reset the image to redlight
                imageI210.ImageUrl = MyUtilities2.WebsiteUrl+"/Images/redlight.gif";
                linkI210.ImageUrl = MyUtilities2.WebsiteUrl + "/Images/doc01.gif";
                linkI210.Visible = true;
                linkI210.NavigateUrl = "";
                // see if there is a document of this type
                if (dbread.HasRows)
                {
                    // we have a document of this type
                    // check the status and set the image
                    // then create a link for the doc image
                    dbread.Read();
                    if (dbread["Status"].ToString() == "R" || dbread["Status"].ToString() == "CR" || dbread["Status"].ToString() == "PR")
                    { imageI210.ImageUrl = MyUtilities2.WebsiteUrl+"/Images/greenlight.gif"; }
                    else if (dbread["Status"].ToString() == "E" || dbread["Status"].ToString() == "G")
                    { imageI210.ImageUrl = MyUtilities2.WebsiteUrl+"/Images/yellowlight.gif"; }
                    else
                    { imageI210.ImageUrl = MyUtilities2.WebsiteUrl+"/Images/redlight.gif"; }
                    linkI210.NavigateUrl = MyUtilities2.WebsiteUrl+"QT2a/ReportsDetail.aspx?DocId=" + dbread["DocID"].ToString();
                }
                else // no document of this type
                {
                    // turn off the doc image
                    linkI210.Visible = false;
                }
            }
            // END I210
            // BEGIN I315
            sql = "select top 1 docid,status from documents where employeeid=" + EmpID.ToString() + " and DocTypeID=18 order by docid desc";
            dbread.Close();
            dbcomm.CommandText = sql;
            dbread = dbcomm.ExecuteReader(); //execute command
            // find the images
            Image imageI315 = (Image)e.Item.FindControl("imageI315");
            HyperLink linkI315 = (HyperLink)e.Item.FindControl("linkI315");
            if ((e.Item.ItemType == ListItemType.Item) ||
                (e.Item.ItemType == ListItemType.AlternatingItem))
            {
                // reset the image to redlight
                imageI315.ImageUrl = MyUtilities2.WebsiteUrl+"/Images/redlight.gif";
                linkI315.ImageUrl = MyUtilities2.WebsiteUrl + "/Images/doc01.gif";
                linkI315.Visible = true;
                linkI315.NavigateUrl = "";
                // see if there is a document of this type
                if (dbread.HasRows)
                {
                    // we have a document of this type
                    // check the status and set the image
                    // then create a link for the doc image
                    dbread.Read();
                    if (dbread["Status"].ToString() == "R" || dbread["Status"].ToString() == "CR" || dbread["Status"].ToString() == "PR")
                    { imageI315.ImageUrl = MyUtilities2.WebsiteUrl+"/Images/greenlight.gif"; }
                    else if (dbread["Status"].ToString() == "E" || dbread["Status"].ToString() == "G")
                    { imageI315.ImageUrl = MyUtilities2.WebsiteUrl+"/Images/yellowlight.gif"; }
                    else
                    { imageI315.ImageUrl = MyUtilities2.WebsiteUrl+"/Images/redlight.gif"; }
                    linkI315.NavigateUrl = MyUtilities2.WebsiteUrl+"QT2a/ReportsDetail.aspx?DocId=" + dbread["DocID"].ToString();
                }
                else // no document of this type
                {
                    // turn off the doc image
                    linkI315.Visible = false;
                }
            }
            // END I315
            // BEGIN I400
            sql = "select top 1 docid,status from documents where employeeid=" + EmpID.ToString() + " and DocTypeID=19 order by docid desc";
            dbread.Close();
            dbcomm.CommandText = sql;
            dbread = dbcomm.ExecuteReader(); //execute command
            // find the images
            Image imageI400 = (Image)e.Item.FindControl("imageI400");
            HyperLink linkI400 = (HyperLink)e.Item.FindControl("linkI400");
            if ((e.Item.ItemType == ListItemType.Item) ||
                (e.Item.ItemType == ListItemType.AlternatingItem))
            {
                // reset the image to redlight
                imageI400.ImageUrl = MyUtilities2.WebsiteUrl+"/Images/redlight.gif";
                linkI400.ImageUrl = MyUtilities2.WebsiteUrl + "/Images/doc01.gif";
                linkI400.Visible = true;
                linkI400.NavigateUrl = "";
                // see if there is a document of this type
                if (dbread.HasRows)
                {
                    // we have a document of this type
                    // check the status and set the image
                    // then create a link for the doc image
                    dbread.Read();
                    if (dbread["Status"].ToString() == "R" || dbread["Status"].ToString() == "CR" || dbread["Status"].ToString() == "PR")
                    { imageI400.ImageUrl = MyUtilities2.WebsiteUrl+"/Images/greenlight.gif"; }
                    else if (dbread["Status"].ToString() == "E" || dbread["Status"].ToString() == "G")
                    { imageI400.ImageUrl = MyUtilities2.WebsiteUrl+"/Images/yellowlight.gif"; }
                    else
                    { imageI400.ImageUrl = MyUtilities2.WebsiteUrl+"/Images/redlight.gif"; }
                    linkI400.NavigateUrl = MyUtilities2.WebsiteUrl+"QT2a/ReportsDetail.aspx?DocId=" + dbread["DocID"].ToString();
                }
                else // no document of this type
                {
                    // turn off the doc image
                    linkI400.Visible = false;
                }
            }
            // END I400
            //// BEGIN I500
            //sql = "select top 1 docid,status from documents where employeeid=" + EmpID.ToString() + " and DocTypeID=20 order by docid desc";
            //dbread.Close();
            //dbcomm.CommandText = sql;
            //dbread = dbcomm.ExecuteReader(); //execute command
            //// find the images
            //Image imageI500 = (Image)e.Item.FindControl("imageI500");
            //HyperLink linkI500 = (HyperLink)e.Item.FindControl("linkI500");
            //if ((e.Item.ItemType == ListItemType.Item) ||
            //    (e.Item.ItemType == ListItemType.AlternatingItem))
            //{
            //    // reset the image to redlight
            //    imageI500.ImageUrl = MyUtilities2.WebsiteUrl+"/Images/redlight.gif";
            //    linkI500.ImageUrl = MyUtilities2.WebsiteUrl + "/Images/doc01.gif";
            //    linkI500.Visible = true;
            //    linkI500.NavigateUrl = "";
            //    // see if there is a document of this type
            //    if (dbread.HasRows)
            //    {
            //        // we have a document of this type
            //        // check the status and set the image
            //        // then create a link for the doc image
            //        dbread.Read();
            //        if (dbread["Status"].ToString() == "R" || dbread["Status"].ToString() == "CR" || dbread["Status"].ToString() == "PR")
            //        { imageI500.ImageUrl = MyUtilities2.WebsiteUrl+"/Images/greenlight.gif"; }
            //        else if (dbread["Status"].ToString() == "E" || dbread["Status"].ToString() == "G")
            //        { imageI500.ImageUrl = MyUtilities2.WebsiteUrl+"/Images/yellowlight.gif"; }
            //        else
            //        { imageI500.ImageUrl = MyUtilities2.WebsiteUrl+"/Images/redlight.gif"; }
            //        linkI500.NavigateUrl = MyUtilities2.WebsiteUrl+"QT2a/ReportsDetail.aspx?DocId=" + dbread["DocID"].ToString();
            //    }
            //    else // no document of this type
            //    {
            //        // turn off the doc image
            //        linkI500.Visible = false;
            //    }
            //}
            //// END I500

            // close the db objects
            dbread.Close();
            dbconn.Close();
            dbconn.Dispose();
            dbcomm.Dispose();
        }
        protected void ddlCompany_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblEmployeeListNoEmployees.Visible = false;
            repeaterEmployeeList.Visible = false;
            lblRandomListNoEmployees.Visible = false;
            repeaterRandomList.Visible = false;
            lblDQFNoEmployees.Visible = false;
            repeaterDQF.Visible = false;
            lblDAATFNoEmployees.Visible = false;
            repeaterDAATF.Visible = false;
        }
        protected void btnEmailDQF_Click(object sender, EventArgs e) 
        {
            // construct the html
            string strHtml = MyUtilities2.GetRepeaterDataToHtml(repeaterDQF);         
            // send the html in an email
            lblDQFNoEmployees.Visible = true;
            if (MyUtilities2.SendEmailHtml(MyUtilities2.WebsiteHelpEmail, txtUserName.Text, "Driver Qualification File", strHtml) == true)
            { lblDQFNoEmployees.Text = "Email sent to "+txtUserName.Text; }
            else
            { lblDQFNoEmployees.Text = "Error: Email not sent"; }
            txtUserName.Text = "";
        }
        protected void btnDAATFEmail_Click(object sender, EventArgs e)
        {
            // construct the html
            string strHtml = MyUtilities2.GetRepeaterDataToHtml(repeaterDAATF);
            // send the html in an email
            lblDAATFNoEmployees.Visible = true;
            if (MyUtilities2.SendEmailHtml(MyUtilities2.WebsiteHelpEmail, txtUserNameDAATF.Text, "Driver Drug And Alcohol Testing File", strHtml) == true)
            { lblDAATFNoEmployees.Text = "Email sent to " + txtUserNameDAATF.Text; }
            else
            { lblDAATFNoEmployees.Text = "Error: Email not sent"; }
            txtUserNameDAATF.Text = "";
        }
        protected void btnEmployeeListEmail_Click(object sender, EventArgs e)
        {
            // construct the html
            string strHtml = MyUtilities2.GetRepeaterDataToHtml(repeaterEmployeeList);
            // send the html in an email
            lblEmployeeListNoEmployees.Visible=true;
            if (MyUtilities2.SendEmailHtml(MyUtilities2.WebsiteHelpEmail, txtUserNameEmployeeList.Text, "Employee List", strHtml) == true)
            { lblEmployeeListNoEmployees.Text = "Email sent to " + txtUserNameEmployeeList.Text; }
            else
            { lblEmployeeListNoEmployees.Text = "Error: Email not sent"; }
            txtUserNameEmployeeList.Text = "";
        }
        protected void btnRandomListEmail_Click(object sender, EventArgs e)
        {
            // construct the html
            string strHtml = MyUtilities2.GetRepeaterDataToHtml(repeaterRandomList);
            // send the html in an email
            lblRandomListNoEmployees.Visible = true;
            if (MyUtilities2.SendEmailHtml(MyUtilities2.WebsiteHelpEmail, txtUserNameRandomList.Text, "Randomly Selected List", strHtml) == true)
            { lblRandomListNoEmployees.Text = "Email sent to " + txtUserNameRandomList.Text; }
            else
            { lblRandomListNoEmployees.Text = "Error: Email not sent"; }
            txtUserNameRandomList.Text = "";
        }
    }
}