<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WinnersControl.ascx.cs" Inherits="Secured_WinnersControl" %>

<div class="divTableOffers">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MyLocalSqlServer %>" 
            SelectCommand="Winners_Get" SelectCommandType="StoredProcedure" >
        </asp:SqlDataSource>

    <asp:Label ID="lblMessage" runat="server" Text="Label" Visible="false"></asp:Label>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" 
            AutoGenerateColumns="False" DataKeyNames="ArticleId,AuctionId"
            CellPadding="4" 
            DataSourceID="SqlDataSource1" 
            ForeColor="#3366CC" onrowcommand="GridView1_RowCommand"
            GridLines="None" ShowFooter="True" BorderStyle="None" EmptyDataText="Currently no history of winners we have." 
            onrowdatabound="GridView1_RowDataBound" onprerender="GridView1_PreRender" ShowHeaderWhenEmpty="True">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:TemplateField HeaderText="Auction Name" SortExpression="AuctionName">
                    <ItemTemplate>
                        <asp:Label ID="lblAuctionName" runat="server" Text='<%# Eval("AuctionName") %>'></asp:Label>
                    </ItemTemplate>                     
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Article Name" SortExpression="ArticleName">
                    <ItemTemplate>
                        <asp:Label ID="lblArticleName" runat="server" Text='<%# Eval("ArticleName") %>'></asp:Label>
                    </ItemTemplate>     
                </asp:TemplateField>
                <asp:TemplateField HeaderText="First Name" SortExpression="FirstName">
                    <ItemTemplate>
                        <asp:Label ID="lblFirstName" runat="server" Text='<%# Eval("FirstName") %>'></asp:Label>
                    </ItemTemplate>                     
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Last Name" SortExpression="LastName">
                    <ItemTemplate>
                        <asp:Label ID="lblLastName" runat="server" Text='<%# Eval("LastName") %>'></asp:Label>
                    </ItemTemplate>     
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Title" SortExpression="Title">
                    <ItemTemplate>
                        <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("Title") %>'></asp:Label>
                    </ItemTemplate>                     
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Date of birth" SortExpression="DateBirth">
                    <ItemTemplate>
                        <asp:Label ID="lblDateBirth" runat="server" Text='<%# Eval("DateBirth") %>'></asp:Label>
                    </ItemTemplate>     
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email" SortExpression="Email">
                    <ItemTemplate>
                        <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                    </ItemTemplate>     
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Offered Price ($)" SortExpression="OfferedPrice" >
                    <ItemTemplate>
                        <asp:Label ID="lblOfferedPrice" runat="server" Text='<%# Eval("OfferedPrice") %>'></asp:Label>
                    </ItemTemplate>                   
                </asp:TemplateField>      
                <asp:TemplateField >
                    <ItemTemplate>
                        <asp:Button ID="btnSend" runat="server" Text="Send Email" CommandArgument='<%#Eval("Email") + ";" +Eval("AuctionName") + ";" +Eval("ArticleName") + ";" +Eval("FirstName") + ";" +Eval("LastName") + ";" +Eval("Title")%>'  CommandName="Email"/>
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