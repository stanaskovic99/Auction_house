using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using ProvidersLibrary;

public partial class Secured_InfoControl : System.Web.UI.UserControl
{
    MyMembershipProvider provider;
    protected void Page_Load(object sender, EventArgs e)
    {
        provider = (MyMembershipProvider)Membership.Provider;
        if (!IsPostBack)
        {            
            MyUser user = provider.getUserById(Request.Cookies["UserId"].Value);
            txtFirstName.Text = user.FirstName;
            txtLastName.Text = user.LastName;
            txtEmail.Text = user.Email;
            txtTitle.Text = user.Title;
            Calendar1.Text = user.DateBirth.ToLocalTime().ToString("yyyy-MM-dd");
        }
        
    }
    protected void btnUpdateUser_Click(object sender, EventArgs e)
    {
        string firstname = txtFirstName.Text;
        string lastname = txtLastName.Text;
        string email = txtEmail.Text;
        string title = txtTitle.Text;
        DateTime datebirth = DateTime.Parse(Calendar1.Text);
        MyUser old_user = provider.getUserById(Request.Cookies["UserId"].Value);
        MyUser new_user = new MyUser(firstname,lastname,title,datebirth,email,old_user.Password,old_user.Id, old_user.Approved,old_user.Rejected);
        MyUser result = provider.UpdateUser(new_user);
        if (result == null)
            Response.Write("Unsuccesfull");
    }

    protected void btnDeleteAccount_Click(object sender, EventArgs e)
    {
        bool result = provider.DeleteAccount(Request.Cookies["UserId"].Value);
        if(!result)
            return;

        FormsAuthentication.SignOut();
        FormsAuthentication.RedirectToLoginPage();
    }
}