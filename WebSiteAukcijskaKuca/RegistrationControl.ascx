<%@ Control Language="C#" AutoEventWireup="true" CodeFile="RegistrationControl.ascx.cs" Inherits="RegistrationControl" %>

  <script type="text/javascript" language="javascript">
      function CheckOnlyOneCheckBox(checkbox) {
          var checkBoxList = checkbox.parentNode.parentNode.parentNode.parentNode;
          var list = checkBoxList.getElementsByTagName("input");
          for (var i = 0; i < list.length; i++) {
              if (list[i] != checkbox && checkbox.checked) {
                  list[i].checked = false;
              }
          }
      }

  </script> 

<div style="height: 474px">
    <asp:Label ID="lblMessage" runat="server" Text="Waiting for administartor to approve registration." style="margin-left:-60px;" Visible="False" Font-Bold="True" ForeColor="#000066"></asp:Label><br /><br />
<table cellpadding="2" border="1px solid black">
                            <tr >
                                <td align="center" colspan="2"style="border-style: none">
                                    <b>Sign Up for Your New Account</b></td>
                            </tr>
                            <tr>
                                <td align="right"style="border-style: none">
                                    <asp:Label ID="lblFirstName" runat="server" AssociatedControlID="txtFirstName">First Name:</asp:Label>
                                </td>
                                <td class="style1" style="border-style: none">
                                    <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="FirstNameRequired" runat="server" 
                                        ControlToValidate="txtFirstName" ErrorMessage="First Name is required." 
                                        ForeColor="Red" ToolTip="First Name is required." 
                                        ValidationGroup="CreateUserWizard1" Font-Bold="True">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="border-style: none">
                                    <asp:Label ID="lblLastName" runat="server" AssociatedControlID="txtLastName">Last Name:</asp:Label>
                                </td>
                                <td class="style1" style="border-style: none">
                                    <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="LastNameRequired" runat="server" 
                                        ControlToValidate="txtLastName" ErrorMessage="Last Name is required." 
                                        Font-Bold="True" ForeColor="Red" ToolTip="Last Name is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="border-style: none">
                                    <asp:Label ID="lblTitle" runat="server" AssociatedControlID="txtTitle">Title:</asp:Label>
                                </td>
                                <td class="style1" style="border-style: none">
                                    <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="TitleRequired" runat="server" 
                                        ControlToValidate="txtTitle" ErrorMessage="Title is required." 
                                        Font-Bold="True" ToolTip="Title is required."  ForeColor="Red" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="border-style: none">
                                    <asp:Label ID="lblDateBirth" runat="server" AssociatedControlID="txtTitle">Date of Birth:</asp:Label>
                                </td>
                                <td class="style1" style="border-style: none">           
                                    <asp:TextBox id="Calendar1" runat="server" type="date" Width="167px"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ControlToValidate="Calendar1" ErrorMessage="Date of birth is required." 
                                       Font-Bold="True" ToolTip="Date of birth is required."  ForeColor="Red" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="border-style: none">
                                    <asp:Label ID="lblEmail" runat="server" AssociatedControlID="txtEmail">E-mail:</asp:Label>
                                </td>
                                <td class="style1" style="border-style: none">
                                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="EmailRequired" runat="server" 
                                        ControlToValidate="txtEmail" ErrorMessage="E-mail is required." 
                                        Font-Bold="True" ToolTip="E-mail is required." ForeColor="Red" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="border-style: none">
                                    <asp:Label ID="lblPassword" runat="server" AssociatedControlID="txtPassword">Password:</asp:Label>
                                </td>
                                <td class="style1" style="border-style: none">
                                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                        ControlToValidate="txtPassword" ErrorMessage="Password is required." 
                                        Font-Bold="True" ToolTip="Password is required." ForeColor="Red" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
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
                                        ControlToValidate="txtConfirmPassword" 
                                        ErrorMessage="Confirm Password is required." 
                                        ToolTip="Confirm Password is required." 
                                       Font-Bold="True" ValidationGroup="CreateUserWizard1" ForeColor="Red">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="border-style: none">
                                    Role:</td>
                                <td class="style1" style="border-style: none">
                                    <asp:CheckBoxList ID="CheckBoxList1" runat="server"  >
                                        <asp:ListItem Selected="True" class="regRole" Text="Customer" Value="Customer" onclick="CheckOnlyOneCheckBox(this);"></asp:ListItem>
                                        <asp:ListItem Text="Administrator" Value="Administrator" onclick="CheckOnlyOneCheckBox(this);"></asp:ListItem>
                                    </asp:CheckBoxList>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="color:Red;border-style: none">
                                    <asp:CompareValidator ID="PasswordCompare" runat="server" 
                                        ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" 
                                        Display="Dynamic" 
                                        ErrorMessage="The Password and Confirmation Password must match." 
                                        ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                                </td>
                            </tr>
                             <tr>
                                <td align="center" colspan="2" style="color:Red;border-style: none; font-weight: bold;">
                                    <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                </td>
                            </tr>
                            <tr>
                            <td align="right" colspan="2" style="border-style: none">
                                <asp:Button ID="btnLogin" runat="server" CausesValidation="False" Text="Login" 
                                    onclick="btnLogin_Click"/>
                                <asp:Button ID="btnCreateUser" runat="server" Text="Create User" ValidationGroup="CreateUserWizard1"
                                    onclick="btnCreateUser_Click" />
                            </td>
                            </tr>
                        </table>    
</div>