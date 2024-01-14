using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Secured_OnGoingControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMessage.Visible = false;
    }

    protected void btnFilter_Click(object sender, EventArgs e)
    {
        string minTime = txtMinTime.Text;
        string maxTime = txtMaxTime.Text;
        string minPrice = txtMinPrice.Text == "" ? "0" : txtMinPrice.Text;
        string maxPrice = txtMaxPrice.Text;

        if (minTime == "" && maxTime == "" && maxPrice == "")
        {
            GridView1.DataSourceID = "SqlDataSource20";
            SqlDataSource20.SelectParameters["minPrice"].DefaultValue = minPrice;
            SqlDataSource20.Select(new DataSourceSelectArguments());
            return;
        }

        //-------1

        if (maxTime == "" && maxPrice == "")
        {
            DateTime dDate;
            if (!DateTime.TryParse(minTime, out dDate))
            {
                lblMessage.Text = "Time format wrong. Needed: dd/mm/yyyy or dd/mm/yyyy hh:mm:ss";
                lblMessage.Visible = true;
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }
            GridView1.DataSourceID = "SqlDataSource21";
            SqlDataSource21.SelectParameters["minTime"].DefaultValue = minTime;
            SqlDataSource21.SelectParameters["minPrice"].DefaultValue = minPrice;
            SqlDataSource21.Select(new DataSourceSelectArguments());
            return;
        }

        if (minTime == "" && maxPrice == "")
        {
            DateTime dDate;
            if (!DateTime.TryParse(maxTime, out dDate))
            {
                lblMessage.Text = "Time format wrong. Needed: dd/mm/yyyy or dd/mm/yyyy hh:mm:ss";
                lblMessage.Visible = true;
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }
            GridView1.DataSourceID = "SqlDataSource22";
            SqlDataSource22.SelectParameters["maxTime"].DefaultValue = maxTime;
            SqlDataSource22.SelectParameters["minPrice"].DefaultValue = minPrice;
            SqlDataSource22.Select(new DataSourceSelectArguments());
            return;
        }

        if (minTime == "" && maxTime == "")
        {            
            GridView1.DataSourceID = "SqlDataSource23";
            SqlDataSource23.SelectParameters["maxPrice"].DefaultValue = maxPrice;
            SqlDataSource23.SelectParameters["minPrice"].DefaultValue = minPrice;
            SqlDataSource23.Select(new DataSourceSelectArguments());
            return;
        }

        //-----2

        if (maxPrice == "")
        {
            DateTime dDate, mDate;
            if (!DateTime.TryParse(minTime, out dDate) || !DateTime.TryParse(maxTime, out mDate))
            {
                lblMessage.Text = "Time format wrong. Needed: dd/mm/yyyy or dd/mm/yyyy hh:mm:ss";
                lblMessage.Visible = true;
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }
            GridView1.DataSourceID = "SqlDataSource24";
            SqlDataSource24.SelectParameters["minPrice"].DefaultValue = minPrice;
            SqlDataSource24.SelectParameters["maxTime"].DefaultValue = maxTime;
            SqlDataSource24.SelectParameters["minTime"].DefaultValue = minTime;
            SqlDataSource24.Select(new DataSourceSelectArguments());
            return;
        }

        if (maxTime == "")
        {
            DateTime dDate;
            if (!DateTime.TryParse(minTime, out dDate))
            {
                lblMessage.Text = "Time format wrong. Needed: dd/mm/yyyy or dd/mm/yyyy hh:mm:ss";
                lblMessage.Visible = true;
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }
            GridView1.DataSourceID = "SqlDataSource25";
            SqlDataSource25.SelectParameters["minPrice"].DefaultValue = minPrice;
            SqlDataSource25.SelectParameters["maxPrice"].DefaultValue = maxPrice;
            SqlDataSource25.SelectParameters["minTime"].DefaultValue = minTime;
            SqlDataSource25.Select(new DataSourceSelectArguments());
            return;
        }

        if (minTime == "")
        {
            DateTime dDate;
            if (!DateTime.TryParse(maxTime, out dDate))
            {
                lblMessage.Text = "Time format wrong. Needed: dd/mm/yyyy or dd/mm/yyyy hh:mm:ss";
                lblMessage.Visible = true;
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }
            GridView1.DataSourceID = "SqlDataSource26";
            SqlDataSource26.SelectParameters["minPrice"].DefaultValue = minPrice;
            SqlDataSource26.SelectParameters["maxPrice"].DefaultValue = maxPrice;
            SqlDataSource26.SelectParameters["maxTime"].DefaultValue = maxTime;
            SqlDataSource26.Select(new DataSourceSelectArguments());
            return;
        }

        DateTime ddDate, mdDate;
        if (!DateTime.TryParse(minTime, out ddDate) || !DateTime.TryParse(maxTime, out mdDate))
        {
            lblMessage.Text = "Time format wrong. Needed: dd/mm/yyyy or dd/mm/yyyy hh:mm:ss";
            lblMessage.Visible = true;
            lblMessage.ForeColor = System.Drawing.Color.Red;
            return;
        }
        GridView1.DataSourceID = "SqlDataSource27";
        SqlDataSource27.SelectParameters["maxPrice"].DefaultValue = maxPrice;
        SqlDataSource27.SelectParameters["minPrice"].DefaultValue = minPrice;
        SqlDataSource27.SelectParameters["maxTime"].DefaultValue = maxTime;
        SqlDataSource27.SelectParameters["minTime"].DefaultValue = minTime;
        SqlDataSource27.Select(new DataSourceSelectArguments());


    }


    protected void btnReset_Click(object sender, EventArgs e)
    {
        GridView1.DataSourceID = "SqlDataSource1";
        SqlDataSource1.Select(new DataSourceSelectArguments());
        txtMaxPrice.Text = "";
        txtMaxTime.Text = "";
        txtMinPrice.Text = "";
        txtMinTime.Text = "";
        lblMessage.Visible = false;
    }
}