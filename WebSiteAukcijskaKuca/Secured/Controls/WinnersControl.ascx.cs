using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Net.Mail;
using System.Net;
using ProvidersLibrary;

public partial class Secured_WinnersControl : System.Web.UI.UserControl
{
    List<string> dates = new List<string>();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType != DataControlRowType.DataRow)
            return;

        DateTime date = DateTime.Parse(DataBinder.Eval(e.Row.DataItem, "DateBirth").ToString());
        dates.Add(date.ToShortDateString());
    }

    protected void GridView1_PreRender(object sender, EventArgs e)
    {
        System.Diagnostics.Debug.WriteLine(dates.Count);
        for (int i = 1; i < dates.Count + 1; i++)
        {
            if (GridView1.Controls[0].Controls[i].Controls[5].FindControl("lblDateBirth") != null)
            {
                ((Label)GridView1.Controls[0].Controls[i].Controls[5].FindControl("lblDateBirth")).Text = dates[i - 1];
            }
        }
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string[] args = e.CommandArgument.ToString().Split(';');
        string email = args[0];
        string firstName = args[3];
        string lastName = args[4];
        string title = args[5];
        string auction = args[1];
        string article = args[2];

        string body = "Dear " + title + " " + firstName + " " + lastName + ", We are happy to inform you that you have won on the Auction '" + auction + "' the Article '" + article +
            "'.Please contact us for farther information. Kind regards, Aukcijska Kuca ITP";

        SmtpClient client = new SmtpClient()
        {
            Host = "smtp.mail.yahoo.com",
            Port = 587,
            EnableSsl = true,
            DeliveryMethod = SmtpDeliveryMethod.Network,
            UseDefaultCredentials = false,
            Credentials = new NetworkCredential()
            {
                UserName = "saricsara490@yahoo.com",
                Password = "dexnbjgyakovdjod"

            }
        };
        MailAddress FromEmail = new MailAddress("saricsara490@yahoo.com", "Aukcijska Kuca ITP");
        MailAddress ToEmail = new MailAddress(email, email);
        MailMessage message = new MailMessage()
        {
            From = FromEmail,
            Subject = "Auction Winner",
            Body = body,
            IsBodyHtml = false
        };
        message.To.Add(ToEmail);
        System.Diagnostics.Debug.WriteLine("Email about to be sent.");

        try
        {
            client.Send(message); lblMessage.Text = "Success"; lblMessage.Visible = true;
        }
        catch (Exception ex) { lblMessage.Text = ex.Message; lblMessage.Visible = true; }
    }
}