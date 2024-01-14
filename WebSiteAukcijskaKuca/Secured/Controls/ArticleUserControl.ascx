<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ArticleUserControl.ascx.cs" Inherits="Secured_ArticleUserControl" %>

<div class="divTableArticleUser">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MyLocalSqlServer %>" 
            SelectCommand="ArticlePerAuction_GetByAuctionId" SelectCommandType="StoredProcedure" >
            <SelectParameters> 
                <asp:QueryStringParameter Name="AuctionId" DbType="Guid" ConvertEmptyStringToNull="true" Direction="Input"
                QueryStringField="AuctionId" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" 
            AutoGenerateColumns="False" DataKeyNames="ArticleId,AuctionId"
            CellPadding="4" 
            DataSourceID="SqlDataSource1" 
            ForeColor="#3366CC" 
            GridLines="None" BorderStyle="None" EmptyDataText="Currently there are no articles." ShowHeaderWhenEmpty="true"
            onrowdatabound="GridView1_RowDataBound"
            onselectedindexchanged="GridView1_SelectedIndexChanged" class="hover">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
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
                        <asp:CheckBox ID="chbDamaged" runat="server" Checked='<%# Eval("Damaged") %>' 
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