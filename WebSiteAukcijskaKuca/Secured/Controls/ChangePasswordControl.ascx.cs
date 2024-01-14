using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using ProvidersLibrary;

public partial class Secured_ChangePasswordControl : System.Web.UI.UserControl
{
    MyMembershipProvider MembershipProvider;
    MyRoleProvider RoleProvider;
    protected void Page_Load(object sender, EventArgs e)
    {
        MembershipProvider = (MyMembershipProvider)Membership.Provider;
        RoleProvider = (MyRoleProvider)Roles.Provider;
        if (!IsPostBack)
        {
            MyUser user = MembershipProvider.getUserById(Request.Cookies["UserId"].Value);
            txtEmail.Text = user.Email;
        }
    }
    protected void btnCreateUser_Click(object sender, EventArgs e)
    {
        string email = txtEmail.Text;
        string password = txtPassword.Text;

        MyUser user = MembershipProvider.FindUsersByEmail(email);      

    }
}