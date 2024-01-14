using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Secured_ArticleControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Insert" && Page.IsValid)
        {
            TextBox articleName = (TextBox)GridView1.FooterRow.FindControl("txtArticleName1");
            TextBox estimatedAge = (TextBox)GridView1.FooterRow.FindControl("txtEstimatedAge1");
            CheckBox damaged = (CheckBox)GridView1.FooterRow.FindControl("chbDamaged2");
            TextBox startPrice = (TextBox)GridView1.FooterRow.FindControl("txtStartPrice1");
            TextBox comment = (TextBox)GridView1.FooterRow.FindControl("txtComment2");


            SqlDataSource1.InsertParameters["ArticleName"].DefaultValue = articleName.Text;
            SqlDataSource1.InsertParameters["EstimatedAge"].DefaultValue = estimatedAge.Text;
            SqlDataSource1.InsertParameters["Damaged"].DefaultValue = damaged.Checked.ToString();
            SqlDataSource1.InsertParameters["StartPrice"].DefaultValue = startPrice.Text;
            SqlDataSource1.InsertParameters["Comment"].DefaultValue = comment.Text;
            SqlDataSource1.Insert();

        }

        if (e.CommandName == "InsertEmpty" && Page.IsValid)
        {
            TextBox articleName = (TextBox)GridView1.Controls[0].Controls[1].Controls[0].FindControl("txtArticleName1");
            TextBox estimatedAge = (TextBox)GridView1.Controls[0].Controls[1].Controls[0].FindControl("txtEstimatedAge1");
            CheckBox damaged = (CheckBox)GridView1.Controls[0].Controls[1].Controls[0].FindControl("chbDamaged2");
            TextBox startPrice = (TextBox)GridView1.Controls[0].Controls[1].Controls[0].FindControl("txtStartPrice1");
            TextBox comment = (TextBox)GridView1.Controls[0].Controls[1].Controls[0].FindControl("txtComment2");


            SqlDataSource1.InsertParameters["ArticleName"].DefaultValue = articleName.Text;
            SqlDataSource1.InsertParameters["EstimatedAge"].DefaultValue = estimatedAge.Text;
            SqlDataSource1.InsertParameters["Damaged"].DefaultValue = damaged.Checked.ToString();
            SqlDataSource1.InsertParameters["StartPrice"].DefaultValue = startPrice.Text;
            SqlDataSource1.InsertParameters["Comment"].DefaultValue = comment.Text;
            SqlDataSource1.Insert();

        }
    }

}