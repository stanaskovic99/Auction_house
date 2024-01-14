<%@ Control Language="C#" AutoEventWireup="true" CodeFile="OfferesControl.ascx.cs" Inherits="Secured_OfferesControl" %>

<div class="divTableOffers">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MyLocalSqlServer %>" 
            SelectCommand="OfferedPrices_Get" SelectCommandType="StoredProcedure" >
        </asp:SqlDataSource>

        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" 
            AutoGenerateColumns="False" DataKeyNames="ArticleId,AuctionId,Id,UserId"
            CellPadding="4" 
            DataSourceID="SqlDataSource1" 
            ForeColor="#3366CC" 
            GridLines="None" BorderStyle="None"  EmptyDataText="Currently no offers are made." ShowHeaderWhenEmpty="true">
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
                <asp:TemplateField HeaderText="Start Price ($)" SortExpression="StartPrice">
                    <ItemTemplate>
                        <asp:Label ID="lblStartPrice" runat="server" Text='<%# Eval("StartPrice") %>'></asp:Label>
                    </ItemTemplate>     
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Time" SortExpression="Time" >
                    <ItemTemplate>
                        <asp:Label ID="lblTime" runat="server" Text='<%# Eval("Time") %>'></asp:Label>
                    </ItemTemplate>                   
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Offered Price" SortExpression="OfferedPrice" >
                    <ItemTemplate>
                        <asp:Label ID="lblOfferedPrice" runat="server" Text='<%# Eval("OfferedPrice") %>'></asp:Label>
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