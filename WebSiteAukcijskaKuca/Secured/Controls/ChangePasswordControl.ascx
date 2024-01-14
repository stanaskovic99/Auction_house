<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ChangePasswordControl.ascx.cs" Inherits="Secured_ChangePasswordControl" %>

<div class="divTable" style="margin-bottom: 40px;">
    
<table cellpadding="2" border="1px solid black" 
        style="background-color: #5D7B9D; color: #FFFFFF;">
                            <tr>
                                <td align="center" colspan="2" style="border-style: none">
                                    Change password</td>
                            </tr>
                            <tr>
                                <td align="right" style="border-style: none">
                                    <asp:Label ID="lblEmail" runat="server" AssociatedControlID="txtEmail">E-mail:</asp:Label>
                                </td>
                                <td class="style1" style="border-style: none">
                                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ForeColor="Red" Font-Bold="True"
                                        ControlToValidate="txtEmail" ErrorMessage="E-mail is required." 
                                        ToolTip="E-mail is required." ValidationGroup="CreateUserWizard11">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="border-style: none">
                                    <asp:Label ID="lblPassword" runat="server" AssociatedControlID="txtPassword">Password:</asp:Label>
                                </td>
                                <td class="style1" style="border-style: none">
                                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ForeColor="Red" Font-Bold="True"
                                        ControlToValidate="txtPassword" ErrorMessage="Password is required." 
                                        ToolTip="Password is required." ValidationGroup="CreateUserWizard11">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="border-style: none">
                                    <asp:Label ID="lblConfirmPassword" runat="server" 
                                        AssociatedControlID="txtConfirmPassword">Confirm Password:</asp:Label>
                                </td>
                                <td class="style1" style="border-style: none">
                                    <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" 
                                        ControlToValidate="txtConfirmPassword" ForeColor="Red" Font-Bold="True"
                                        ErrorMessage="Confirm Password is required." 
                                        ToolTip="Confirm Password is required." ValidationGroup="CreateUserWizard11">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="border-style: none">
                                    <asp:CompareValidator ID="PasswordCompare" runat="server" 
                                        ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" 
                                        Display="Dynamic" 
                                        ErrorMessage="The Password and Confirmation Password must match." 
                                        ValidationGroup="CreateUserWizard11"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="color:Red; border-style: none">
                                    <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                </td>
                            </tr>
                            <tr>
                            <td align="right" colspan="2" style="border-style: none">
                                <asp:Button ID="btnCreateUser" runat="server" Text="Change password" ValidationGroup="CreateUserWizard11" 
                                    onclick="btnCreateUser_Click" />
                            </td>
                            </tr>
                        </table>

    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="CreateUserWizard11" style="text-align:left; color:Red;"/>
</div>