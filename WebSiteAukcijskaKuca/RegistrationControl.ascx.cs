using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using ProvidersLibrary;

public partial class RegistrationControl : System.Web.UI.UserControl
{
    MyMembershipProvider MembershipProvider;
    MyRoleProvider RoleProvider;
    protected void Page_Load(object sender, EventArgs e)
    {
        MembershipProvider = (MyMembershipProvider)Membership.Provider;
        RoleProvider = (MyRoleProvider)Roles.Provider;
        lblMessage.Visible = false;
    }
    protected void btnCreateUser_Click(object sender, EventArgs e)
    {
        
        string firstname = txtFirstName.Text;
        string lastname = txtLastName.Text;
        string email = txtEmail.Text;
        string password = txtPassword.Text;
        string title = txtTitle.Text;
        string role = CheckBoxList1.SelectedValue; 

        DateTime datebirth = DateTime.Parse(Calendar1.Text);
        MyUser user = MembershipProvider.CreateUser(firstname, lastname, title, datebirth, email, password);

        if (user == null)
        {
            ErrorMessage.Text = "Email already registered";
            return;
        }

        RoleProvider.AddUserToRole(user.Id, role);

        if (role == "Administrator")
        {
            lblMessage.Visible = true;
            return;
        }

        HttpCookie c = new HttpCookie("UserId");
        c.Value = user.Id;
        c.Path = Request.ApplicationPath;
        c.Expires = DateTime.MaxValue;
        Response.Cookies.Add(c);
        FormsAuthentication.RedirectFromLoginPage(user.FirstName, true);  

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/LoginPage.aspx");
    }
}