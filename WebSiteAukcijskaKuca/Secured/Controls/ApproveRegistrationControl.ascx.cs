using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using ProvidersLibrary;

public partial class Secured_CreateAdminControl : System.Web.UI.UserControl
{
    MyMembershipProvider MembershipProvider;
    MyRoleProvider RoleProvider;
    protected void Page_Load(object sender, EventArgs e)
    {
        MembershipProvider = (MyMembershipProvider)Membership.Provider;
        RoleProvider = (MyRoleProvider)Roles.Provider;
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Approve")
        {
            setApproval(true, e.CommandArgument.ToString());
        }

        if (e.CommandName == "Reject")
        {
            setApproval(false, e.CommandArgument.ToString());
        }
    }

    private void setApproval(bool approval, string userId)
    {
        SqlDataSource1.UpdateParameters["UserId"].DefaultValue = userId;
        SqlDataSource1.UpdateParameters["Approved"].DefaultValue = approval.ToString();
        SqlDataSource1.Update();        
    }
}