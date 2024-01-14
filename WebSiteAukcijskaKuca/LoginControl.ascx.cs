using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using ProvidersLibrary;

public partial class LoginControl : System.Web.UI.UserControl
{
    MyMembershipProvider provider;
    MyRoleProvider roleProvider;
    protected void Page_Load(object sender, EventArgs e)
    {
        provider = (MyMembershipProvider)Membership.Provider;
        roleProvider = (MyRoleProvider)Roles.Provider;
        lblMessage.Visible = false;
    }
    protected void LoginButton_Click(object sender, EventArgs e)
    {
        if (!provider.ValidateUser(txtEmail.Text, txtPassword.Text))
        {
            lblMessage.Text = "Wrong email or password.";
            lblMessage.Visible = true;
            return;
        }

        MyUser user = provider.FindUsersByEmail(txtEmail.Text);

        if (!user.Approved && !user.Rejected)
        {
            lblMessage.Text = "Your request for registration still hasn't been approved.";
            lblMessage.Visible = true;
            return;
        }

        if (!user.Approved && user.Rejected)
        {
            lblMessage.Text = "Your request for registration has been rejected.";
            lblMessage.Visible = true;
            return;
        }

        if (user.Approved && user.Rejected)
        {
            lblMessage.Text = "Your account has been deleted.";
            lblMessage.Visible = true;
            return;
        }

        HttpCookie c = new HttpCookie("UserId");
        c.Value = user.Id;
        c.Path = Request.ApplicationPath;
        c.Expires = DateTime.MaxValue;
        Response.Cookies.Add(c);
        FormsAuthentication.SetAuthCookie(user.FirstName, RememberMe.Checked);

        if (roleProvider.IsUserInRole(txtEmail.Text, "Administrator"))
        {
            Response.Redirect("./Secured/Pages/Admin/AuctionAdmin.aspx");
            return;
        }

        Response.Redirect("./Secured/Pages/AuctionUser.aspx");
    }
}