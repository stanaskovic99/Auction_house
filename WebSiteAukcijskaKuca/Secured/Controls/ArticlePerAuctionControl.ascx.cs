using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Secured_ArticlePerAuctionControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMessage.Visible = false;
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Insert" && Page.IsValid)
        {
            DropDownList ddAuction = (DropDownList)GridView1.FooterRow.FindControl("DropDownList1");
            DropDownList ddlArticle = (DropDownList)GridView1.FooterRow.FindControl("DropDownList2");

            SqlDataSource1.InsertParameters["AuctionId"].DefaultValue = ddAuction.SelectedValue;
            SqlDataSource1.InsertParameters["ArticleId"].DefaultValue = ddlArticle.SelectedValue;

            int i = SqlDataSource1.Insert();
            if (i == -1)
            {
                lblMessage.Visible = true;
            }

        }

        if (e.CommandName == "InsertEmpty" && Page.IsValid)
        {
            DropDownList ddlAuction = (DropDownList)GridView1.Controls[0].Controls[1].Controls[0].FindControl("DropDownList1");
            DropDownList ddlArticle = (DropDownList)GridView1.Controls[0].Controls[1].Controls[0].FindControl("DropDownList2");

            SqlDataSource1.InsertParameters["AuctionId"].DefaultValue = ddlAuction.SelectedValue;
            SqlDataSource1.InsertParameters["ArticleId"].DefaultValue = ddlArticle.SelectedValue;

            SqlDataSource1.Insert();

        }
    }

}