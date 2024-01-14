<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ApproveRegistrationControl.ascx.cs" Inherits="Secured_CreateAdminControl" %>

<div class="divTableRequests">
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:MyLocalSqlServer %>" 
    SelectCommand="UserInRole_GetWaitingApproval" 
    SelectCommandType="StoredProcedure" UpdateCommand="UserInRole_UpdateApproval" 
    UpdateCommandType="StoredProcedure">
    <UpdateParameters>
        <asp:Parameter Name="UserId" DbType="Guid" />
        <asp:Parameter Name="Approved" Type="Boolean" />
    </UpdateParameters>
</asp:SqlDataSource>
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
    DataKeyNames="UserId,RoleId" DataSourceID="SqlDataSource1" ForeColor="#333333" 
    GridLines="None" onrowcommand="GridView1_RowCommand" 
        ShowHeaderWhenEmpty="True" 
        EmptyDataText="Currently no requests waiting for approval.">
    <AlternatingRowStyle BackColor="White" ForeColor="#284775"/>
    <Columns>
        <asp:TemplateField HeaderText="FirstName" SortExpression="FirstName">
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("FirstName") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="LastName" SortExpression="LastName">
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Eval("LastName") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Title" SortExpression="Title">
            <ItemTemplate>
                <asp:Label ID="Label3" runat="server" Text='<%# Eval("Title") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="DateBirth" SortExpression="DateBirth">
            <ItemTemplate>
                <asp:Label ID="Label4" runat="server" Text='<%# Eval("DateBirth") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Email" SortExpression="Email">
            <ItemTemplate>
                <asp:Label ID="Label5" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>        
            <ItemTemplate>
                <asp:ImageButton ID="btnSave" runat="server" ImageUrl="~/images/approve.jfif"  ValidationGroup="edit"  CommandArgument='<%# Eval("UserId") %>'
                CommandName="Approve" ToolTip="Save" Width="20px" Height="20px" />
                <asp:ImageButton ID="btnCancel" runat="server" ImageUrl="~/images/cancel_icon.png"  ValidationGroup="edit"  CommandArgument='<%# Eval("UserId") %>'
                CommandName="Reject" ToolTip="Save" Width="20px" Height="20px" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    <EditRowStyle BackColor="#999999" />
    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    <SortedAscendingCellStyle BackColor="#E9E7E2" />
    <SortedAscendingHeaderStyle BackColor="#506C8C" />
    <SortedDescendingCellStyle BackColor="#FFFDF8" />
    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
</asp:GridView>

</div>