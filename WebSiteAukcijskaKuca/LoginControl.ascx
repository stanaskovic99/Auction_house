<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LoginControl.ascx.cs" Inherits="LoginControl" %>

<div style="width: 285px">
    <asp:Label ID="lblMessage" runat="server" style="margin-left:-60px;" Visible="False" Font-Bold="True" ForeColor="#000066"></asp:Label><br /><br />
<table cellpadding="2" border="1px solid black">
    <tr style="border-width: 0px; border-style: none;">
        <td align="center" colspan="2" style="border-style: none">
            <b>Log In</b>
        </td>
    </tr>
    <tr>
        <td align="right" style="border-style: none">
            <asp:Label ID="lblEmail" runat="server" AssociatedControlID="txtEmail">Email:</asp:Label>
        </td>
        <td style="border-style: none">
            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="EmailRequired" runat="server" 
                ControlToValidate="txtEmail" ErrorMessage="Email is required." 
                ToolTip="Email is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td align="right" style="border-style: none">
            <asp:Label ID="lblPassword" runat="server" AssociatedControlID="txtPassword">Password:</asp:Label>
        </td>
        <td style="border-style: none">
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                ControlToValidate="txtPassword" ErrorMessage="Password is required." 
                ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td colspan="2" style="border-style: none">
            <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." />
        </td>
    </tr>
    <tr>            
        <td colspan="2" style="border-style: none">
            <a href="RegistrationPage.aspx">Registration</a>
    </tr>
    <tr>
        <td align="center" colspan="2" style="color:Red;border-style: none">
            <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
        </td>
    </tr>
    <tr>
        <td align="right" colspan="2" style="border-style: none">
            <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" 
                ValidationGroup="Login1" onclick="LoginButton_Click" />
        </td>
    </tr>
</table>
</div>