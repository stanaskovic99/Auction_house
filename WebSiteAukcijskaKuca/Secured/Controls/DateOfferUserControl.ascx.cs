using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Security;
using ProvidersLibrary;

public partial class Secured_DateOfferUserControl : System.Web.UI.UserControl
{ 
    DateTime start; 
    DateTime end;
    List<string> times = new List<string>();
    bool flag = false;
    protected void Page_Load(object sender, EventArgs e)
    {        
        string auctionId = Request.QueryString["AuctionId"];
        string articleId = Request.QueryString["ArticleId"];
        SqlDataSource1.SelectParameters["AuctionId"].DefaultValue = auctionId;
        SqlDataSource1.SelectParameters["ArticleId"].DefaultValue = articleId;
        DataSourceSelectArguments ds = new DataSourceSelectArguments();
        DataView dv = (DataView)SqlDataSource2.Select(ds);
        setInfoArticle(dv);
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Insert" && Page.IsValid)
        {
            TextBox offer = (TextBox)GridView1.FooterRow.FindControl("txtOfferedPrice");
            string auctionId = Request.QueryString["AuctionId"];
            string articleId = Request.QueryString["ArticleId"];
            string userId = Request.Cookies["UserId"].Value;

            SqlDataSource1.InsertParameters["OfferedPrice"].DefaultValue = offer.Text;
            SqlDataSource1.InsertParameters["AuctionId"].DefaultValue = auctionId;
            SqlDataSource1.InsertParameters["ArticleId"].DefaultValue = articleId;
            SqlDataSource1.InsertParameters["UserId"].DefaultValue = userId;
            SqlDataSource1.Insert();

        }

        if (e.CommandName == "InsertEmpty" && Page.IsValid)
        {
            TextBox offer = (TextBox)GridView1.Controls[0].Controls[1].Controls[0].FindControl("txtOfferedPriceEmpty");
            string auctionId = Request.QueryString["AuctionId"];
            string articleId = Request.QueryString["ArticleId"];
            string userId = Request.Cookies["UserId"].Value;

            SqlDataSource1.InsertParameters["OfferedPrice"].DefaultValue = offer.Text;
            SqlDataSource1.InsertParameters["AuctionId"].DefaultValue = auctionId;
            SqlDataSource1.InsertParameters["ArticleId"].DefaultValue = articleId;
            SqlDataSource1.InsertParameters["UserId"].DefaultValue = userId;
            SqlDataSource1.Insert();
        }
        
    }

    private void setInfoArticle(DataView dv)
    {
        DataRow dr = dv.Table.Rows[0];
        lblName.Text = dr["ArticleName"].ToString();
        lblEstimatedAge.Text = dr["EstimatedAge"].ToString();
        if(Boolean.Parse(dr["Damaged"].ToString()))
            lblDamaged.Text = "Yes";
        else
            lblDamaged.Text = "No";
        lblStartPrice.Text = dr["StartPrice"].ToString();
        if(dr["Comment"] == DBNull.Value)
            lblComment.Text = "None";
        else
            lblComment.Text = dr["Comment"].ToString();

        DateTime date = DateTime.Parse(dr["Date"].ToString());
        DateTime startTime = DateTime.Parse(dr["TimeStart"].ToString());
        DateTime endTime = DateTime.Parse(dr["TimeEnd"].ToString());
        System.Diagnostics.Debug.WriteLine("Date : " + date);
        System.Diagnostics.Debug.WriteLine("Time start : " + startTime);
        System.Diagnostics.Debug.WriteLine("Time end : " + endTime);

        start = new DateTime(date.Year, date.Month, date.Day, startTime.Hour, startTime.Minute, startTime.Second);
        end = new DateTime(date.Year, date.Month, date.Day, endTime.Hour, endTime.Minute, endTime.Second);
        System.Diagnostics.Debug.WriteLine("Start : " + start);
        System.Diagnostics.Debug.WriteLine("End : " + end);
    }

    protected void OfferedPriceCustomValidator_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (!flag)
        {
            CustomValidator validator = (CustomValidator)source;
            double offered = Convert.ToDouble(args.Value);
            double price = Convert.ToDouble(lblStartPrice.Text);
            DateTime now = DateTime.Now;
            System.Diagnostics.Debug.WriteLine("Start : " + start);
            System.Diagnostics.Debug.WriteLine("End : " + end);

            if (offered < price)
            {
                validator.ErrorMessage = "Offered price can't be less than start price.";
                args.IsValid = false;
                return;
            }

            System.Diagnostics.Debug.WriteLine(end);
            if (now < start)
            {
                validator.ErrorMessage = "Auction hasn't started yet.";
                args.IsValid = false;
                return;
            }

            if (now > end)
            {
                validator.ErrorMessage = "Auction has ended.";
                args.IsValid = false;
                return;
            }

            args.IsValid = true;
            flag = true;
        }
    }

    protected void OfferedPriceEmptyCustomValidator_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (!flag)
        {
            CustomValidator validator = (CustomValidator)source;
            double offered = Convert.ToDouble(args.Value);
            double price = Convert.ToDouble(lblStartPrice.Text);
            DateTime now = DateTime.Now;
            System.Diagnostics.Debug.WriteLine("Start : " + start);
            System.Diagnostics.Debug.WriteLine("End : " + end);

            if (offered < price)
            {
                validator.ErrorMessage = "Offered price can't be less than start price.";
                args.IsValid = false;
                return;
            }

            System.Diagnostics.Debug.WriteLine(end);
            if (now < start)
            {
                validator.ErrorMessage = "Auction hasn't started yet.";
                args.IsValid = false;
                return;
            }

            if (now > end)
            {
                validator.ErrorMessage = "Auction has ended.";
                args.IsValid = false;
                return;
            }

            args.IsValid = true;
            flag = true;
        }
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType != DataControlRowType.DataRow)
            return;

        DateTime time = DateTime.Parse(DataBinder.Eval(e.Row.DataItem, "Time").ToString());
        times.Add(time.ToShortTimeString());

        string userId = DataBinder.Eval(e.Row.DataItem, "UserId").ToString();
        if (Request.Cookies["UserId"].Value == userId)
        {
            e.Row.BackColor = System.Drawing.Color.Yellow;
        }
    }

    protected void GridView1_PreRender(object sender, EventArgs e)
    {
        for (int i = 0; i <= times.Count; i++)
        {
            if (GridView1.Controls[0].Controls[i].Controls[0].FindControl("lblTime") != null)
            {
                System.Diagnostics.Debug.WriteLine(i);
                ((Label)GridView1.Controls[0].Controls[i].Controls[0].FindControl("lblTime")).Text = times[i-1];
            }
        }
    }

}