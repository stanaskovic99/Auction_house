<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DateOfferUserControl.ascx.cs" Inherits="Secured_DateOfferUserControl" %>

<div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MyLocalSqlServer %>" 
            InsertCommand="OfferedPrices_Create" InsertCommandType="StoredProcedure" 
            SelectCommand="OfferedPrices_GetByArticleIdAuctionId" SelectCommandType="StoredProcedure" >
            <SelectParameters>
                <asp:QueryStringParameter Name="ArticleId" QueryStringField="ArticleId" DbType="Guid" />
                <asp:QueryStringParameter Name="AuctionId" QueryStringField="AuctionId"  DbType="Guid" />
            </SelectParameters>
            <InsertParameters>
                <asp:QueryStringParameter Name="ArticleId" QueryStringField="ArticleId" DbType="Guid" />
                <asp:QueryStringParameter Name="AuctionId" QueryStringField="AuctionId"  DbType="Guid" />
                <asp:CookieParameter CookieName="UserId" Name="UserId" DbType="Guid" /> 
                <asp:Parameter Name="OfferedPrice" DbType="Double" />
            </InsertParameters>
        </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MyLocalSqlServer %>" 
            SelectCommand="ArticlePerAuction_GetByArticleIDAuctionId" 
            SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter  Name="ArticleId" 
                QueryStringField="ArticleId" Type="String" />
            <asp:QueryStringParameter  Name="AuctionId" 
                QueryStringField="AuctionId" Type="String" />
        </SelectParameters>
        </asp:SqlDataSource>

        <table class="infoTab">
            <tr>
                <td class="style11"> 
                <fieldset>
                    <legend>ARICLE INFO</legend>
                    <asp:Label ID="Label1" runat="server" Text="Name : "></asp:Label>
                    <asp:Label ID="lblName" runat="server" ></asp:Label><br />
                    <asp:Label ID="Label2" runat="server" Text="Estimated age : "></asp:Label>
                    <asp:Label ID="lblEstimatedAge" runat="server" ></asp:Label><br />
                    <asp:Label ID="Label3" runat="server" Text="Damaged : "></asp:Label>
                    <asp:Label ID="lblDamaged" runat="server" ></asp:Label><br />
                    <asp:Label ID="Label4" runat="server" Text="Start Price : "></asp:Label>
                    <asp:Label ID="lblStartPrice" runat="server" ></asp:Label>
                    <asp:Label ID="Label6" runat="server" Text=" $" /><br />
                    <asp:Label ID="Label5" runat="server" Text="Comment : "></asp:Label>
                    <asp:Label ID="lblComment" runat="server" ></asp:Label>   
                </fieldset>    
                
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="insert" ForeColor="Maroon" style="text-align: left;margin: 0px;"/>                               
                </td>
                <td class="divTableOfferUser pad">                 
                 <asp:GridView ID="GridView1" runat="server" 
            AllowSorting="True" 
            AutoGenerateColumns="False" DataKeyNames="ArticleId,AuctionId"
            CellPadding="4" 
            DataSourceID="SqlDataSource1" 
            ForeColor="#3366CC" onrowdatabound="GridView1_RowDataBound" 
            GridLines="None" ShowFooter="True" BorderStyle="None"  
            onrowcommand="GridView1_RowCommand" EmptyDataText="Currently no offers are made." 
            ShowHeaderWhenEmpty="True" onprerender="GridView1_PreRender">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" /> 
             <EmptyDataTemplate> 
                <asp:Label ID="lblTime" runat="server" class="emptydatatxtTime" Width="105"></asp:Label>          
                <asp:TextBox ID="txtOfferedPriceEmpty" runat="server" ValidationGroup="insert" Width="118"></asp:TextBox>
                <asp:RequiredFieldValidator ID="OfferedPrice" ControlToValidate="txtOfferedPriceEmpty" runat="server" ValidationGroup="insert"
                    ErrorMessage="Please enter price." Text="Required" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="OfferedPriceCustomValidator" runat="server" 
                            ControlToValidate="txtOfferedPriceEmpty" Display="None" ValidationGroup="insert" onservervalidate="OfferedPriceEmptyCustomValidator_ServerValidate" ></asp:CustomValidator>
                <asp:ImageButton ID="ibtnAdd" runat="server" ImageUrl="~/images/add_icon.png" class="emptydataimage" ValidationGroup="insert" CommandName="InsertEmpty" ToolTip="Add" Width="20px" Height="20px"  />
            </EmptyDataTemplate>     
            <Columns>
                <asp:TemplateField HeaderText="Time" SortExpression="Time">
                    <ItemTemplate>
                        <asp:Label ID="lblTime" runat="server" Text='<%# Eval("Time") %>'></asp:Label>
                    </ItemTemplate>                     
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Offered Price ($)" SortExpression="OfferedPrice">
                    <ItemTemplate>
                        <asp:Label ID="lblOfferedPrice" runat="server" Text='<%# Eval("OfferedPrice") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtOfferedPrice" runat="server" ValidationGroup="insert" Width="95"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="OfferedPrice" ControlToValidate="txtOfferedPrice" runat="server" ValidationGroup="insert"
                            ErrorMessage="Please enter price." Text="Required" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:CustomValidator ID="OfferedPriceCustomValidator" runat="server" 
                            ControlToValidate="txtOfferedPrice" Display="None" ValidationGroup="insert" onservervalidate="OfferedPriceCustomValidator_ServerValidate" ></asp:CustomValidator>
                    </FooterTemplate>                            
                </asp:TemplateField>
                <asp:TemplateField >
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
                </td>                
            </tr>
        </table>

    </div>

