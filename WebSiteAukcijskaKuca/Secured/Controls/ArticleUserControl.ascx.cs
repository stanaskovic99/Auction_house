using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Secured_ArticleUserControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Write(SqlDataSource1.SelectParameters["AuctionId"].DefaultValue);
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataKey key = GridView1.SelectedDataKey;
        string auctionId = key.Values["AuctionId"].ToString();
        string articleId = key.Values["ArticleId"].ToString();
        Response.Redirect("./DateOffer.aspx?AuctionId=" + auctionId+"&ArticleId="+articleId+"&UserId="+Request.Cookies["UserId"].Value);
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" + e.Row.RowIndex);
            e.Row.ToolTip = "Click to select this row.";
        }
    }
}