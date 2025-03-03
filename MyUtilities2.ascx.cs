using SendGrid;
// MyUtilities2.aspx - Web User Control.
// Created 12/13/14 by Mike.
// These are things used throughout the website.
// There is a MyUtilities.aspx and code behind VB version also that
// was written first before changing to C#. The things in that file
// can be moved and converted into this file if you want. I did not 
// want to move/convert them yet since they work and I did not want
// to break them.
using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MyUtilities2 : System.Web.UI.UserControl
{
    // These are used throught the website as global variables
    public const string WebsiteName = "QualifiedTruckers.com";
    public const string WebsiteUrl = "https://qualifiedtruckers.azurewebsites.net/";
    public const string WebsiteHelpEmail = "help@qualifiedtruckers.com";
    public const string CompanyName = "Regulation Solutions, Inc.";
    public const string CompanyAddress = "9 Prestbury Sq Bldg 3rd Floor Box 39";
    public const string CompanyCity = "Newark";
    public const string CompanyState = "DE";
    public const string CompanyZipCode = "19713";
    public const string CompanyPhone = "302-533-5163";
    public const string CompanyFax = "";
    public const string CompanyEmail = "regman16@comcast.net";


    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public static bool SendEmailHtml(string From, string To,string Subject,string Html)
    {
        try
        {
            // the changes were from regular smtp mail to SendGrid (for Azure)
            //MailMessage mailMessage = new MailMessage();
            var mailMessage = new SendGridMessage();
            //mailMessage.To.Add(txtUserName.Text);
            mailMessage.AddTo(To);
            mailMessage.From = new MailAddress(From);
            mailMessage.Subject = Subject;
            //mailMessage.Body = "Driver Qualification File is being generated...";
            //mailMessage.Text = "Driver Qualification File is being generated...";
            mailMessage.Html = Html;
            //SmtpClient smtpClient = new SmtpClient("smtp.your-isp.com");
            //smtpClient.Send(mailMessage);
            var username = System.Environment.GetEnvironmentVariable("SendGridUserName");
            var pswd = System.Environment.GetEnvironmentVariable("SendGridPassword");
            var credentials = new NetworkCredential(username, pswd);
            var transportWeb = new Web(credentials);

            // Send the email.
            if (transportWeb != null)
            { transportWeb.DeliverAsync(mailMessage); }
            else
            { return false; } // webtransport failed, emial was not sent 

            //Response.Write("Email sent");
        }
        catch (Exception ex)
        {
            return false;// something happened, the email was not sent.
        }
        return true; // ok, the email was sent.
    }
    // This Method is used to render a repeater control
    public static string GetRepeaterDataToHtml(Repeater rpt)
    {
        StringBuilder strBuilder = new StringBuilder();
        StringWriter strWriter = new StringWriter(strBuilder);
        HtmlTextWriter htw = new HtmlTextWriter(strWriter);
        rpt.RenderControl(htw);
        return strBuilder.ToString();
    }

    public static void gv_AddConfirmDeletePopupOnRowDataBoundEvent(object sender, GridViewRowEventArgs e)
    // This Method will add a Javascript confirm delete pop up 
    // to each row in a Gridview. When deleting a record from a Gridview,
    // it will prompt "Are you sure you want to delete this record?"
    // This is used to handle the Gridview RowDataBound event.
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            foreach (DataControlFieldCell cell in e.Row.Cells)
            {
                foreach (Control control in cell.Controls)
                {
                    LinkButton button = control as LinkButton;
                    if (button != null && button.CommandName == "Delete")
                        button.OnClientClick = "return confirm('Are you sure you want to delete this record?');";
                }
            }
        }
    }
    public static void dtv_AddConfirmDeletePopupOnItemCreatedEvent(object sender, EventArgs e, DetailsView dtv)
    // This Method will add a Javascript confirm delete pop up 
    // to the delete linkbutton in a Details View. When deleting a record from a 
    // Details View it will prompt "Are you sure you want to delete this record?"
    // This is used to handle the Details View OnItemCreatedEvent event.
    {        
        // Test FooterRow to make sure all rows have been created 
        if (dtv.FooterRow != null)
        {
            // The command bar is the last element in the Rows collection
            int commandRowIndex = dtv.Rows.Count - 1;
            DetailsViewRow commandRow = dtv.Rows[commandRowIndex];

            // Look for the DELETE button
            DataControlFieldCell cell = (DataControlFieldCell)commandRow.Controls[0];
            foreach (Control ctl in cell.Controls)
            {
                LinkButton link = ctl as LinkButton;
                if (link != null)
                {
                    if (link.CommandName == "Delete")
                    {
                        link.ToolTip = "Click here to delete";
                        link.OnClientClick = "return confirm('Do you really want to delete this record?');";
                    }
                }
            }
        }
    }
}