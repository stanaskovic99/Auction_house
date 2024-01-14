<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ArticleBidUserControl.ascx.cs" Inherits="Secured_Controls_ArticleBidUserControl" %>


<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:MyLocalSqlServer %>" 
    SelectCommand="ArticlePerAuction_GetArticleToBid" 
    SelectCommandType="StoredProcedure"></asp:SqlDataSource>

<asp:SqlDataSource ID="SqlDataSource20" runat="server" 
    ConnectionString="<%$ ConnectionStrings:MyLocalSqlServer %>" 
    SelectCommand="ArticlePerAuction_GetArticleToBid_0" 
    SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:Parameter DefaultValue="0" Name="minAge" Type="Int32" />
        <asp:Parameter DefaultValue="0" Name="minPrice" Type="Double" />
        <asp:Parameter DefaultValue="True" Name="Damaged" Type="Boolean" />
    </SelectParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="SqlDataSource21" runat="server" 
    ConnectionString="<%$ ConnectionStrings:MyLocalSqlServer %>" 
    SelectCommand="ArticlePerAuction_GetArticleToBid_1" 
    SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:Parameter DefaultValue="0" Name="minAge" Type="Int32" />
        <asp:Parameter DefaultValue="0" Name="minPrice" Type="Double" />
        <asp:Parameter DefaultValue="true" Name="Damaged" Type="Boolean" />
        <asp:Parameter Name="maxAge" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="SqlDataSource22" runat="server" 
    ConnectionString="<%$ ConnectionStrings:MyLocalSqlServer %>" 
    SelectCommand="ArticlePerAuction_GetArticleToBid_2" 
    SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:Parameter DefaultValue="0" Name="minAge" Type="Int32" />
        <asp:Parameter DefaultValue="0" Name="minPrice" Type="Double" />
        <asp:Parameter DefaultValue="true" Name="Damaged" Type="Boolean" />
        <asp:Parameter Name="maxPrice" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="SqlDataSource23" runat="server" 
    ConnectionString="<%$ ConnectionStrings:MyLocalSqlServer %>" 
    SelectCommand="ArticlePerAuction_GetArticleToBid_3" 
    SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:Parameter DefaultValue="0" Name="minAge" Type="Int32" />
        <asp:Parameter DefaultValue="0" Name="minPrice" Type="Double" />
        <asp:Parameter DefaultValue="true" Name="Damaged" Type="Boolean" />
        <asp:Parameter Name="maxPrice" Type="Int32" />
        <asp:Parameter Name="maxAge" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>

    <table class="divTable">
        <tr>
            <td>
                <fieldset class="fieldsetL">
                    <asp:TextBox ID="txtMinAge" runat="server" Width="50px"></asp:TextBox>
                    <asp:Label ID="Label1" runat="server" Text=" < Estimated Age < "></asp:Label>
                    <asp:TextBox ID="txtMaxAge" runat="server"  Width="50px"></asp:TextBox>
                </fieldset>
            </td>                
            <td>
                <fieldset class="fieldsetL">                    
                    <asp:Label ID="Label3" runat="server" Text="Damaged : "></asp:Label>
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem Text="Yes" Value="True" />
                        <asp:ListItem Text="No" Value="False" />
                    </asp:DropDownList>
                </fieldset>
            </td>
            <td>
                <fieldset class="fieldsetL">
                    <asp:TextBox ID="txtMinPrice" runat="server" Width="50px"></asp:TextBox>
                    <asp:Label ID="Label2" runat="server" Text=" < Start Price < "></asp:Label>
                    <asp:TextBox ID="txtMaxPrice" runat="server"  Width="50px"></asp:TextBox>
                </fieldset>
            </td>
            <td >
                <asp:Button ID="btnFilter" runat="server" Text="Filter" class="filter" 
                    onclick="btnFilter_Click"/>
            </td>
            <td>
                <asp:Button ID="btnReset" runat="server" Text="Reset" class="filter" 
                    onclick="btnReset_Click"/>
            </td>
        </tr>
    </table>

<div class="divTable">
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
    AllowSorting="True" AutoGenerateColumns="False" 
    DataKeyNames="AuctionId,ArticleId" DataSourceID="SqlDataSource1" 
        ShowHeaderWhenEmpty="True" 
        EmptyDataText="Currently no articles are open for bidding." CellPadding="4" 
        ForeColor="#333333" GridLines="None" onrowdatabound="GridView1_RowDataBound"
            onselectedindexchanged="GridView1_SelectedIndexChanged" class="hover">
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    <Columns>
        <asp:TemplateField HeaderText="Auction Name" SortExpression="AuctionName">
            <ItemTemplate>
                <asp:Label ID="lblAuctionName" runat="server" Text='<%# Eval("AuctionName") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="End Time" SortExpression="TimeEnd">
            <ItemTemplate>
                <asp:Label ID="lblTimeEnd" runat="server" Text='<%# Eval("TimeEnd") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Article Name" SortExpression="ArticleName">
            <ItemTemplate>
                <asp:Label ID="lblArticleName" runat="server" Text='<%# Eval("ArticleName") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Estimated Age" SortExpression="EstimatedAge">
            <ItemTemplate>
                <asp:Label ID="lblEstimatedAge" runat="server" Text='<%# Eval("EstimatedAge") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Damaged" SortExpression="Damaged">
            <ItemTemplate>
                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Eval("Damaged") %>' 
                    Enabled="false" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Start Price ($)" SortExpression="StartPrice">
            <ItemTemplate>
                <asp:Label ID="lblStartPrice" runat="server" Text='<%# Eval("StartPrice") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Comment" SortExpression="Comment">
            <ItemTemplate>
                <asp:TextBox ID="txtComment" runat="server" Text='<%# Eval("Comment") %>' TextMode="MultiLine" Enabled="False"></asp:TextBox>
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