<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AuctionUserControl.ascx.cs" Inherits="Secured_AuctionUserControl" %>

<div class="divTable">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:MyLocalSqlServer %>"         
        SelectCommand="Auction_Get" SelectCommandType="StoredProcedure" >        
    </asp:SqlDataSource>
    
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" 
            AutoGenerateColumns="False" DataKeyNames="AuctionId" 
            DataSourceID="SqlDataSource1" 
            CellPadding="4" ForeColor="#3366CC" 
            GridLines="None" ShowFooter="True" BorderStyle="None" 
            EmptyDataText=" Currently there are no auctions." 
        onrowdatabound="GridView1_RowDataBound" 
        onselectedindexchanged="GridView1_SelectedIndexChanged"
        class="hover" >
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:TemplateField HeaderText="Auction name" SortExpression="AuctionName">
                   <ItemTemplate>
                        <asp:Label ID="lblAuctionName" runat="server" Text='<%# Eval("AuctionName") %>'></asp:Label>
                    </ItemTemplate>             
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Date" SortExpression="Date">
                   <ItemTemplate>
                        <asp:Label ID="lblDate" runat="server" Text='<%# Eval("Date") %>'></asp:Label>
                    </ItemTemplate>                
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Start time" SortExpression="TimeStart">
                   <ItemTemplate>
                        <asp:Label ID="lblTimeStart" runat="server" Text='<%# Eval("TimeStart") %>'></asp:Label>
                    </ItemTemplate>              
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="End time" SortExpression="TimeEnd">
                   <ItemTemplate>
                        <asp:Label ID="lblTimeEnd" runat="server" Text='<%# Eval("TimeEnd") %>'></asp:Label>
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