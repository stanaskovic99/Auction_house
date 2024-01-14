<%@ Control Language="C#" AutoEventWireup="true" CodeFile="InfoControl.ascx.cs" Inherits="Secured_InfoControl" %>

<div class="divTable" >
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:MyLocalSqlServer %>" 
        SelectCommand="Auction_Get" SelectCommandType="StoredProcedure" 
        UpdateCommand="Auction_UpdateAuction" UpdateCommandType="StoredProcedure" >
        <SelectParameters>
            <asp:CookieParameter CookieName="UserId" DbType="Guid" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="DateTime" />
            <asp:Parameter Name="Title" Type="DateTime" />
            <asp:Parameter Name="DateBirth" DbType="Guid" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="PasswordC" Type="DateTime" />
            <asp:CookieParameter CookieName="UserId" DbType="Guid" />
        </UpdateParameters>
    </asp:SqlDataSource>
        <table cellpadding="2" border="1px solid black" 
        style="background-color: #5D7B9D; color: #FFFFFF;">
                            <tr>
                                <td align="center" colspan="2" style="border-style: none; width:200px">
                                    Account settings</td>
                            </tr>
                            <tr>
                                <td align="right" style="border-style: none">
                                    <asp:Label ID="lblFirstName" runat="server" AssociatedControlID="txtFirstName">First Name:</asp:Label>
                                </td>
                                <td class="style1" style="border-style: none">
                                    <asp:TextBox ID="txtFirstName" runat="server" ViewStateMode="Enabled"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="FirstNameRequired" runat="server" 
                                        ControlToValidate="txtFirstName" ErrorMessage="First Name is required." 
                                        ForeColor="Red" Font-Bold="True"
                                        ToolTip="First Name is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="border-style: none">
                                    <asp:Label ID="lblLastName" runat="server" AssociatedControlID="txtLastName">Last Name:</asp:Label>
                                </td>
                                <td class="style1" style="border-style: none">
                                    <asp:TextBox ID="txtLastName" runat="server" ViewStateMode="Enabled"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="LastNameRequired" runat="server" 
                                        ForeColor="Red" Font-Bold="True"
                                        ControlToValidate="txtLastName" ErrorMessage="Last Name is required." 
                                        ToolTip="Last Name is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="border-style: none">
                                    <asp:Label ID="lblTitle" runat="server" AssociatedControlID="txtTitle">Title:</asp:Label>
                                </td>
                                <td class="style1" style="border-style: none">
                                    <asp:TextBox ID="txtTitle" runat="server" ViewStateMode="Enabled"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="TitleRequired" runat="server" 
                                        ForeColor="Red" Font-Bold="True"
                                        ControlToValidate="txtTitle" ErrorMessage="Title is required." 
                                        ToolTip="Title is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
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
                                    <asp:TextBox ID="txtEmail" runat="server" ViewStateMode="Enabled"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="EmailRequired" runat="server" 
                                        ForeColor="Red" Font-Bold="True"
                                        ControlToValidate="txtEmail" ErrorMessage="E-mail is required." 
                                        ToolTip="E-mail is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                           <tr>
                                <td align="center" colspan="2" style="color:Red;border-style: none; font-weight: bold;">
                                    <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                </td>
                            </tr>
                            <tr>
                            <td align="right" colspan="2" style="border-style: none">
                                <asp:Button ID="btnDeleteAccount" runat="server" Text="Delete Account"
                                    onclick="btnDeleteAccount_Click" />
                                <asp:Button ID="btnCreateUser" runat="server" Text="Update"  ValidationGroup="CreateUserWizard1"
                                    onclick="btnUpdateUser_Click" />
                            </td>
                            </tr>
                        </table>
</div>