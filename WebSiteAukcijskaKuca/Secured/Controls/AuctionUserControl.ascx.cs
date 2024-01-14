using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Secured_AuctionUserControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataKey key = GridView1.SelectedDataKey;
        string auctionId = key.Value.ToString();
        Response.Redirect("./ArticlesUser.aspx?AuctionId=" + auctionId);
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType != DataControlRowType.DataRow)
            return;

        DateTime date = DateTime.Parse(DataBinder.Eval(e.Row.DataItem, "Date").ToString());
        DateTime startTime = DateTime.Parse(DataBinder.Eval(e.Row.DataItem, "TimeStart").ToString());
        DateTime endTime = DateTime.Parse(DataBinder.Eval(e.Row.DataItem, "TimeEnd").ToString());

        DateTime now = DateTime.Now;
        DateTime start = new DateTime(date.Year, date.Month, date.Day, startTime.Hour, startTime.Minute, startTime.Second);
        DateTime end = new DateTime(date.Year, date.Month, date.Day, endTime.Hour, endTime.Minute, endTime.Second);

        e.Row.Cells[1].Text = date.ToShortDateString();

        if (now < start || now > end)
        {
            e.Row.BackColor = System.Drawing.Color.DarkGray;
            return;
        }
          
        e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" + e.Row.RowIndex);
        e.Row.ToolTip = "Click to select this row.";       
               
    }

}