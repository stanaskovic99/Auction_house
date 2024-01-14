<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ArticlePerAuctionControl.ascx.cs" Inherits="Secured_ArticlePerAuctionControl" %>

<div class="divTableAXA">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MyLocalSqlServer %>" 
            DeleteCommand="ArticlePerAuction_Delete" DeleteCommandType="StoredProcedure" 
            InsertCommand="ArticlePerAuction_Create" InsertCommandType="StoredProcedure" 
            SelectCommand="ArticlePerAuction_Get" SelectCommandType="StoredProcedure" 
            UpdateCommand="Article_UpdateArticle" UpdateCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="ArticleId" DbType="Guid" />
                <asp:Parameter Name="AuctionId" DbType="Guid" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ArticleId" DbType="Guid" />
                <asp:Parameter Name="AuctionId" DbType="Guid" />
            </InsertParameters>
        </asp:SqlDataSource>

         <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MyLocalSqlServer %>" 
            SelectCommand="Auction_Get" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MyLocalSqlServer %>" 
            SelectCommand="Article_Get" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>

        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" 
            AutoGenerateColumns="False" DataKeyNames="ArticleId, AuctionId"
            CellPadding="4" 
            DataSourceID="SqlDataSource1" 
            ForeColor="#3366CC" 
            GridLines="None" ShowFooter="True" BorderStyle="None"  
            onrowcommand="GridView1_RowCommand"  EmptyDataText="Currently no articles are added to this auction." ShowHeaderWhenEmpty="true">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <EmptyDataTemplate>
                <asp:DropDownList ID="DropDownList1" runat="server" ValidationGroup="insert"  DataTextField="AuctionName" DataSourceID="SqlDataSource2" DataValueField="AuctionId">
                        </asp:DropDownList>

                <asp:DropDownList ID="DropDownList2" runat="server" ValidationGroup="insert" DataValueField="ArticleId" DataSourceID="SqlDataSource3" DataTextField="ArticleName">
                        </asp:DropDownList>

                <asp:ImageButton ID="ibtnAdd" runat="server" ImageUrl="~/images/add_icon.png" ValidationGroup="insert" CommandName="InsertEmpty" ToolTip="Add" Width="20px" Height="20px"  />
            </EmptyDataTemplate>
            <Columns>
                <asp:TemplateField HeaderText="Auction Name" SortExpression="AuctionName">
                    <ItemTemplate>
                        <asp:Label ID="lblAuctionName" runat="server" Text='<%# Eval("AuctionName") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" ValidationGroup="insert"  DataTextField="AuctionName" DataSourceID="SqlDataSource2" DataValueField="AuctionId">
                        </asp:DropDownList>                        
                    </FooterTemplate>                    
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Article Name" SortExpression="ArticleName">
                    <ItemTemplate>
                        <asp:Label ID="lblArticleName" runat="server" Text='<%# Eval("ArticleName") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" ValidationGroup="insert" DataValueField="ArticleId" DataSourceID="SqlDataSource3" DataTextField="ArticleName">
                        </asp:DropDownList>                       
                    </FooterTemplate>                    
                </asp:TemplateField>                
                <asp:TemplateField >
                   <ItemTemplate>     
                       <asp:ImageButton ID="ibtnDelete" runat="server" ImageUrl="~/images/delete_icon.png" CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px" />
                    </ItemTemplate>
                    <FooterTemplate>
                       <asp:ImageButton ID="ibtnAdd" runat="server" ImageUrl="~/images/add_icon.png" ValidationGroup="insert" CommandName="Insert" ToolTip="Add" Width="20px" Height="20px"  />
                    </FooterTemplate>                    
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <EmptyDataRowStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
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
    <div style="text-align: left;margin:10px">
    <asp:Label ID="lblMessage" runat="server" Text="Already added." style="color: maroon;"></asp:Label>
    </div>