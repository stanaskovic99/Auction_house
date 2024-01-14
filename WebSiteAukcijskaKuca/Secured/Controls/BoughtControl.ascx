<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BoughtControl.ascx.cs" Inherits="Secured_BoughtControl" %>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:MyLocalSqlServer %>" 
    SelectCommand="Winners_GetByUserId" SelectCommandType="StoredProcedure" >
    <SelectParameters> 
        <asp:CookieParameter CookieName="UserId" Name="UserId" DbType="Guid" /> 
    </SelectParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="SqlDataSource20" runat="server" 
    ConnectionString="<%$ ConnectionStrings:MyLocalSqlServer %>" 
    SelectCommand="Winners_GetByUserId_0" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:CookieParameter CookieName="UserId" DbType="Guid" Name="UserId"/>
        <asp:Parameter DefaultValue="0" Name="minPrice" Type="Double" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource21" runat="server" 
    ConnectionString="<%$ ConnectionStrings:MyLocalSqlServer %>" 
    SelectCommand="Winners_GetByUserId_1" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:CookieParameter CookieName="UserId" DbType="Guid" Name="UserId"/>
        <asp:Parameter DefaultValue="0" Name="minPrice" Type="Double" />
        <asp:Parameter Name="minTime" Type="DateTime" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource22" runat="server" 
    ConnectionString="<%$ ConnectionStrings:MyLocalSqlServer %>" 
    SelectCommand="Winners_GetByUserId_2" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:CookieParameter CookieName="UserId" DbType="Guid" Name="UserId" />
        <asp:Parameter DefaultValue="0" Name="minPrice" Type="Double" />
        <asp:Parameter Name="maxTime" Type="DateTime" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource23" runat="server" 
    ConnectionString="<%$ ConnectionStrings:MyLocalSqlServer %>" 
    SelectCommand="Winners_GetByUserId_3" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:CookieParameter CookieName="UserId" DbType="Guid" Name="UserId" />
        <asp:Parameter DefaultValue="0" Name="minPrice" Type="Double" />
        <asp:Parameter Name="maxPrice" Type="Double" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource24" runat="server" 
    ConnectionString="<%$ ConnectionStrings:MyLocalSqlServer %>" 
    SelectCommand="Winners_GetByUserId_4" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:CookieParameter CookieName="UserId" DbType="Guid" Name="UserId" />
        <asp:Parameter DefaultValue="0" Name="minPrice" Type="Double" />
        <asp:Parameter Name="minTime" Type="DateTime" />
        <asp:Parameter Name="maxTime" Type="DateTime" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource25" runat="server" 
    ConnectionString="<%$ ConnectionStrings:MyLocalSqlServer %>" 
    SelectCommand="Winners_GetByUserId_5" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:CookieParameter CookieName="UserId" DbType="Guid" Name="UserId"  />
        <asp:Parameter DefaultValue="0" Name="minPrice" Type="Double" />
        <asp:Parameter Name="minTime" Type="DateTime" />
        <asp:Parameter Name="maxPrice" Type="Double" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource26" runat="server" 
    ConnectionString="<%$ ConnectionStrings:MyLocalSqlServer %>" 
    SelectCommand="Winners_GetByUserId_6" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:CookieParameter CookieName="UserId" DbType="Guid" Name="UserId"  />
        <asp:Parameter DefaultValue="0" Name="minPrice" Type="Double" />
        <asp:Parameter Name="maxTime" Type="DateTime" />
        <asp:Parameter Name="maxPrice" Type="Double" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource27" runat="server" 
    ConnectionString="<%$ ConnectionStrings:MyLocalSqlServer %>" 
    SelectCommand="Winners_GetByUserId_7" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:CookieParameter CookieName="UserId" DbType="Guid" Name="UserId"  />
        <asp:Parameter DefaultValue="0" Name="minPrice" Type="Double" />
        <asp:Parameter Name="maxTime" Type="DateTime" />
        <asp:Parameter Name="maxPrice" Type="Double" />
        <asp:Parameter Name="minTime" Type="DateTime" />
    </SelectParameters>
</asp:SqlDataSource>


<table class="divTable">
    <tr>
        <td>
            <fieldset class="fieldsetL">
                <asp:TextBox ID="txtMinTime" runat="server" Width="50px"></asp:TextBox>
                <asp:Label ID="Label1" runat="server" Text=" < Time < "></asp:Label>
                <asp:TextBox ID="txtMaxTime" runat="server"  Width="50px"></asp:TextBox>
            </fieldset>
        </td>  
        <td>
            <fieldset class="fieldsetL">
                <asp:TextBox ID="txtMinPrice" runat="server" Width="50px"></asp:TextBox>
                <asp:Label ID="Label2" runat="server" Text=" < Offered Price < "></asp:Label>
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

<asp:Label ID="lblMessage" runat="server" Text="Label" class="messageFilter"></asp:Label>
        
<div class="divTableRequests">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" 
            AutoGenerateColumns="False" DataKeyNames="ArticleId,AuctionId"
            CellPadding="4" 
            DataSourceID="SqlDataSource1" 
            ForeColor="#3366CC" 
            GridLines="None" ShowFooter="True" BorderStyle="None" 
            EmptyDataText="Till now you haven't won any auction." 
            ShowHeaderWhenEmpty="true">
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
                <asp:TemplateField HeaderText="Time" SortExpression="Time">
                    <ItemTemplate>
                        <asp:Label ID="lblTime" runat="server" Text='<%# Eval("Time") %>'></asp:Label>
                    </ItemTemplate>    
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Price ($)" SortExpression="OfferedPrice">
                    <ItemTemplate>
                        <asp:Label ID="lblOfferedPrice" runat="server" Text='<%# Eval("OfferedPrice") %>'></asp:Label>
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