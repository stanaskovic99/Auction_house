using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Secured_Controls_ArticleBidUserControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataKey key = GridView1.SelectedDataKey;
        string auctionId = key.Values["AuctionId"].ToString();
        string articleId = key.Values["ArticleId"].ToString();
        Response.Redirect("./DateOffer.aspx?AuctionId=" + auctionId + "&ArticleId=" + articleId + "&UserId=" + Request.Cookies["UserId"].Value);
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" + e.Row.RowIndex);
            e.Row.ToolTip = "Click to select this row.";
        }
    }

    protected void btnFilter_Click(object sender, EventArgs e)
    {
        string minAge = txtMinAge.Text == "" ? "0" : txtMinAge.Text;
        string maxAge = txtMaxAge.Text;
        string damaged = DropDownList1.SelectedValue;
        string minPrice = txtMinPrice.Text == "" ? "0" : txtMinPrice.Text;
        string maxPrice = txtMaxPrice.Text;

        if (maxAge == "" && maxPrice == "")
        {
            GridView1.DataSourceID = "SqlDataSource20";
            SqlDataSource20.SelectParameters["minAge"].DefaultValue = minAge;
            SqlDataSource20.SelectParameters["minPrice"].DefaultValue = minPrice;
            SqlDataSource20.SelectParameters["Damaged"].DefaultValue = damaged;
            SqlDataSource20.Select(new DataSourceSelectArguments());
            return;
        }

        if (maxAge != "" && maxPrice == "")
        {
            GridView1.DataSourceID = "SqlDataSource21";
            SqlDataSource21.SelectParameters["minAge"].DefaultValue = minAge;
            SqlDataSource21.SelectParameters["minPrice"].DefaultValue = minPrice;
            SqlDataSource21.SelectParameters["Damaged"].DefaultValue = damaged;
            SqlDataSource21.SelectParameters["maxAge"].DefaultValue = maxAge;
            SqlDataSource21.Select(new DataSourceSelectArguments());
            return;
        }

        if (maxAge == "" && maxPrice != "")
        {
            GridView1.DataSourceID = "SqlDataSource22";
            SqlDataSource22.SelectParameters["minAge"].DefaultValue = minAge;
            SqlDataSource22.SelectParameters["minPrice"].DefaultValue = minPrice;
            SqlDataSource22.SelectParameters["Damaged"].DefaultValue = damaged;
            SqlDataSource22.SelectParameters["maxPrice"].DefaultValue = maxPrice;
            SqlDataSource22.Select(new DataSourceSelectArguments());
            return;
        }

        
            GridView1.DataSourceID = "SqlDataSource23";
            SqlDataSource23.SelectParameters["minAge"].DefaultValue = minAge;
            SqlDataSource23.SelectParameters["minPrice"].DefaultValue = minPrice;
            SqlDataSource23.SelectParameters["Damaged"].DefaultValue = damaged;
            SqlDataSource23.SelectParameters["maxAge"].DefaultValue = maxAge;
            SqlDataSource23.SelectParameters["maxPrice"].DefaultValue = maxPrice;
            SqlDataSource23.Select(new DataSourceSelectArguments());


    }


    protected void btnReset_Click(object sender, EventArgs e)
    {
        GridView1.DataSourceID = "SqlDataSource1";
        SqlDataSource1.Select(new DataSourceSelectArguments());
        txtMaxAge.Text = "";
        txtMaxPrice.Text = "";
        txtMinAge.Text = "";
        txtMinPrice.Text = "";
    }
}