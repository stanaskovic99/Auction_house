using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Secured_AuctionControl : System.Web.UI.UserControl
{
    List<string> dates = new List<string>();
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Insert" && Page.IsValid)
        {
            TextBox auctionName = (TextBox)GridView1.FooterRow.FindControl("txtAuctionName1");
            TextBox date = (TextBox)GridView1.FooterRow.FindControl("txtDate1");
            TextBox startTime = (TextBox)GridView1.FooterRow.FindControl("txtTimeStart1");
            TextBox endTime = (TextBox)GridView1.FooterRow.FindControl("txtTimeEnd1");

            SqlDataSource1.InsertParameters["AuctionName"].DefaultValue = auctionName.Text;
            SqlDataSource1.InsertParameters["Date"].DefaultValue = date.Text;
            SqlDataSource1.InsertParameters["TimeStart"].DefaultValue = startTime.Text;
            SqlDataSource1.InsertParameters["TimeEnd"].DefaultValue = endTime.Text;
            SqlDataSource1.Insert();

        }
        if (e.CommandName == "InsertEmpty" && Page.IsValid)
        {
            TextBox auctionName = (TextBox)GridView1.Controls[0].Controls[1].Controls[0].FindControl("txtAuctionName1");
            TextBox date = (TextBox)GridView1.Controls[0].Controls[1].Controls[0].FindControl("txtDate1");
            TextBox startTime = (TextBox)GridView1.Controls[0].Controls[1].Controls[0].FindControl("txtTimeStart1");
            TextBox endTime = (TextBox)GridView1.Controls[0].Controls[1].Controls[0].FindControl("txtTimeEnd1");

            SqlDataSource1.InsertParameters["AuctionName"].DefaultValue = auctionName.Text;
            SqlDataSource1.InsertParameters["Date"].DefaultValue = date.Text;
            SqlDataSource1.InsertParameters["TimeStart"].DefaultValue = startTime.Text;
            SqlDataSource1.InsertParameters["TimeEnd"].DefaultValue = endTime.Text;
            SqlDataSource1.Insert();            
        }
    }

    protected void DateCustomInsert1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        CustomValidator validator = (CustomValidator)source;
        string inputString = ((TextBox)GridView1.FooterRow.FindControl("txtDate1")).Text;
             
        DateTime dDate;

        if(!DateTime.TryParse(inputString, out dDate))
        {
            validator.ErrorMessage = "Date format wrong. Needed: dd/mm/yyyy";
            args.IsValid = false;
            return;
        }

        if (dDate < DateTime.Now.AddDays(-1))
        {
            validator.ErrorMessage = "Date must be in future.";
            args.IsValid = false;
            return;
        }

        args.IsValid = true;       
        
    }

    protected void DateCustomInsertEmpty1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        CustomValidator validator = (CustomValidator)source;
        string inputString = ((TextBox)GridView1.Controls[0].Controls[1].Controls[0].FindControl("txtDate1")).Text;
       
        DateTime dDate;

        if (!DateTime.TryParse(inputString, out dDate))
        {
            validator.ErrorMessage = "Date format wrong. Needed: dd/mm/yyyy";
            args.IsValid = false;
            return;
        }

        if (dDate < DateTime.Now.AddDays(-1))
        {
            validator.ErrorMessage = "Date must be in future.";
            args.IsValid = false;
            return;
        }

        args.IsValid = true;

    }

    protected void DateCustomEdit_ServerValidate(object source, ServerValidateEventArgs args)
    {
        CustomValidator validator = (CustomValidator)source;
        string inputString = "";

        for (int i = 0; i < GridView1.Rows.Count + 2; i++)
        {
            if ((TextBox)GridView1.Controls[0].Controls[i].Controls[1].FindControl("txtDate") != null)
            {
                inputString = ((TextBox)GridView1.Controls[0].Controls[i].Controls[1].FindControl("txtDate")).Text;
            }
        }   
        DateTime dDate;

        if (!DateTime.TryParse(inputString, out dDate))
        {
            validator.ErrorMessage = "Date format wrong. Needed: dd/mm/yyyy";
            args.IsValid = false;
            return;
        }
        args.IsValid = true;
    }

    protected void StartVsEnd_ServerValidate(object source, ServerValidateEventArgs args)
    {
        CustomValidator validator = (CustomValidator)source;
        string date = ((TextBox)GridView1.FooterRow.FindControl("txtDate1")).Text;
        string start = ((TextBox)GridView1.FooterRow.FindControl("txtTimeStart1")).Text;
        string end = ((TextBox)GridView1.FooterRow.FindControl("txtTimeEnd1")).Text;        
        
        DateTime dDateStart;
        DateTime dDateEnd;

        DateTime.TryParse(start, out dDateStart);
        DateTime.TryParse(end, out dDateEnd);

        if(getTime(date,start) < DateTime.Now)
        {
            validator.ErrorMessage = "Starting time has already passed. Set time in future.";
            args.IsValid = false;
            return;
        }

        if (dDateEnd < dDateStart)
        {
            validator.ErrorMessage = "Ending time can't be before start time.";
            args.IsValid = false;
            return;
        }

        args.IsValid = true;

    }

    protected void StartVsEndEmpty_ServerValidate(object source, ServerValidateEventArgs args)
    {
        CustomValidator validator = (CustomValidator)source;
        string date = ((TextBox)GridView1.Controls[0].Controls[1].Controls[0].FindControl("txtDate1")).Text;
        string start = ((TextBox)GridView1.Controls[0].Controls[1].Controls[0].FindControl("txtTimeStart1")).Text;
        string end = ((TextBox)GridView1.Controls[0].Controls[1].Controls[0].FindControl("txtTimeEnd1")).Text;

        DateTime dDateStart;
        DateTime dDateEnd;

        DateTime.TryParse(start, out dDateStart);
        DateTime.TryParse(end, out dDateEnd);

        if (getTime(date, start) < DateTime.Now)
        {
            validator.ErrorMessage = "Starting time has already passed. Set time in future.";
            args.IsValid = false;
            return;
        }

        if (dDateEnd < dDateStart)
        {
            validator.ErrorMessage = "Ending time can't be before start time.";
            args.IsValid = false;
            return;
        }

        args.IsValid = true;

    }

    protected void ValidStartTimeCustom_ServerValidate(object source, ServerValidateEventArgs args)
    {
        CustomValidator validator = (CustomValidator)source;
        string start = ((TextBox)GridView1.FooterRow.FindControl("txtTimeStart1")).Text;

        DateTime dDateStart;

        if (!DateTime.TryParse(start, out dDateStart))
        {
            validator.ErrorMessage = "Start time format wrong.";
            args.IsValid = false;
            return;
        }

        if(!(DateTime.Parse("00:00:00") <= DateTime.Parse(start) && DateTime.Parse(start) <= DateTime.Parse("23:59:59")))
        {
            validator.ErrorMessage = "Start time out of range.";
            args.IsValid = false;
            return;
        }

        args.IsValid = true;

    }

    protected void ValidStartTimeEmptyCustom_ServerValidate(object source, ServerValidateEventArgs args)
    {
        CustomValidator validator = (CustomValidator)source;
        string start = ((TextBox)GridView1.Controls[0].Controls[1].Controls[0].FindControl("txtTimeStart1")).Text;
        DateTime dDateStart;

        if (!DateTime.TryParse(start, out dDateStart))
        {
            validator.ErrorMessage = "Start time format wrong.";
            args.IsValid = false;
            return;
        }

        if (!(DateTime.Parse("00:00:00") <= DateTime.Parse(start) && DateTime.Parse(start) <= DateTime.Parse("23:59:59")))
        {
            validator.ErrorMessage = "Start time out of range.";
            args.IsValid = false;
            return;
        }

        args.IsValid = true;

    }

    protected void ValidEndTimeCustom_ServerValidate(object source, ServerValidateEventArgs args)
    {
        CustomValidator validator = (CustomValidator)source;

        string end = ((TextBox)GridView1.FooterRow.FindControl("txtTimeEnd1")).Text;

        DateTime dDateEnd;

        if (!DateTime.TryParse(end, out dDateEnd))
        {
            validator.ErrorMessage = "End time format wrong.";
            args.IsValid = false;
            return;
        }

        if (!(DateTime.Parse("00:00:00") <= DateTime.Parse(end) && DateTime.Parse(end) <= DateTime.Parse("23:59:59")))
        {
            validator.ErrorMessage = "End time out of range.";
            args.IsValid = false;
            return;
        }

        args.IsValid = true;

    }

    protected void ValidEndTimeEmptyCustom_ServerValidate(object source, ServerValidateEventArgs args)
    {
        CustomValidator validator = (CustomValidator)source;

        string end = ((TextBox)GridView1.Controls[0].Controls[1].Controls[0].FindControl("txtTimeEnd1")).Text;

        DateTime dDateEnd;

        if (!DateTime.TryParse(end, out dDateEnd))
        {
            validator.ErrorMessage = "End time format wrong.";
            args.IsValid = false;
            return;
        }

        if (!(DateTime.Parse("00:00:00") <= DateTime.Parse(end) && DateTime.Parse(end) <= DateTime.Parse("23:59:59")))
        {
            validator.ErrorMessage = "End time out of range.";
            args.IsValid = false;
            return;
        }

        args.IsValid = true;

    }

    private DateTime getTime(string date, string time)
    {
        DateTime date1 = DateTime.Parse(date);
        DateTime time1 = DateTime.Parse(time);

        return new DateTime(date1.Year,date1.Month,date1.Day,time1.Hour,time1.Minute,time1.Second);
    }
   
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType != DataControlRowType.DataRow)
            return;

        DateTime date = DateTime.Parse(DataBinder.Eval(e.Row.DataItem, "Date").ToString());
        dates.Add(date.ToShortDateString());
    }
    
    protected void GridView1_PreRender(object sender, EventArgs e)
    {
        System.Diagnostics.Debug.WriteLine(dates.Count);
        for (int i = 1; i < dates.Count + 1; i++)
        {
            if (GridView1.Controls[0].Controls[i].Controls[1].FindControl("lblDate") != null)
            {
                ((Label)GridView1.Controls[0].Controls[i].Controls[1].FindControl("lblDate")).Text = dates[i - 1];
            }
            
            if (GridView1.Controls[0].Controls[i].Controls[1].FindControl("txtDate") != null)
            {
                ((TextBox)GridView1.Controls[0].Controls[i].Controls[1].FindControl("txtDate")).Text = dates[i - 1];
            }
        }
    }
}