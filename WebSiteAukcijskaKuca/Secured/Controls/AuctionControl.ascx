<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AuctionControl.ascx.cs" Inherits="Secured_AuctionControl" %>

 <div class="divTable">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
         ConnectionString="<%$ ConnectionStrings:MyLocalSqlServer %>" 
         DeleteCommand="Auction_DeleteAuction" DeleteCommandType="StoredProcedure" 
         InsertCommand="Auction_CreateAuction" InsertCommandType="StoredProcedure" 
         SelectCommand="Auction_Get" SelectCommandType="StoredProcedure" 
         UpdateCommand="Auction_UpdateAuction" UpdateCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="AuctionId" DbType="Guid" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="AuctionName" Type="String" />
                <asp:Parameter Name="Date" Type="DateTime" />
                <asp:Parameter DbType="Time" Name="TimeStart" />
                <asp:Parameter DbType="Time" Name="TimeEnd" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="AuctionName" Type="String" />
                <asp:Parameter Name="Date" Type="DateTime" />
                <asp:Parameter DbType="Time" Name="TimeStart" />
                <asp:Parameter DbType="Time" Name="TimeEnd" />
                <asp:Parameter Name="AuctionId" DbType="Guid" />
            </UpdateParameters>
     </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" 
            AutoGenerateColumns="False" DataKeyNames="AuctionId" 
            DataSourceID="SqlDataSource1" 
            CellPadding="4" ForeColor="#3366CC" 
            GridLines="None" ShowFooter="True" BorderStyle="None" 
            onrowcommand="GridView1_RowCommand"  
            EmptyDataText="Currently there are no auctions." ShowHeaderWhenEmpty="True" 
            onrowdatabound="GridView1_RowDataBound" onprerender="GridView1_PreRender">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <EmptyDataTemplate>
                <asp:TextBox ID="txtAuctionName1" runat="server" ValidationGroup="insert"></asp:TextBox>                
                        <asp:RequiredFieldValidator ID="AuctionNameRequired1" ControlToValidate="txtAuctionName1" runat="server" ValidationGroup="insert"
                            ErrorMessage="Please enter name" Text="Required" Display="Dynamic"></asp:RequiredFieldValidator>

                <asp:TextBox ID="txtDate1" runat="server" ValidationGroup="insert"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="DateRequired1" ControlToValidate="txtDate1" runat="server" ValidationGroup="insert"
                            ErrorMessage="Please enter date." Text="Required" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="DateCustom1" runat="server" ControlToValidate="txtDate1"
                             Display="None" ValidationGroup="insert" onservervalidate="DateCustomInsertEmpty1_ServerValidate" ></asp:CustomValidator>
                        
               <asp:TextBox ID="txtTimeStart1" runat="server" ValidationGroup="insert"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="TimeStartRequired1" ControlToValidate="txtTimeStart1" runat="server" ValidationGroup="insert"
                            ErrorMessage="Please enter start time." Text="Required" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:CustomValidator ID="TimeCustom" runat="server" ControlToValidate="txtTimeStart1"
                             Display="None" ValidationGroup="insert" onservervalidate="ValidStartTimeEmptyCustom_ServerValidate" ></asp:CustomValidator>                 

                <asp:TextBox ID="txtTimeEnd1" runat="server" ValidationGroup="insert"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="TimeEndRequired1" ControlToValidate="txtTimeEnd1" runat="server" ValidationGroup="insert"
                            ErrorMessage="Please enter ending time." Text="Required" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="TimeCustom2" runat="server" ControlToValidate="txtTimeEnd1"
                             Display="None" ValidationGroup="insert" onservervalidate="ValidEndTimeEmptyCustom_ServerValidate" ></asp:CustomValidator>
                             <asp:CustomValidator ID="CustomValidator2" runat="server" ControlToValidate="txtTimeEnd1"
                             Display="None" ValidationGroup="insert" onservervalidate="StartVsEndEmpty_ServerValidate" ></asp:CustomValidator>

                <asp:ImageButton ID="ibtnAdd" runat="server" ImageUrl="~/images/add_icon.png" ValidationGroup="insert" CommandName="InsertEmpty" 
                        ToolTip="Add" Width="20px" Height="20px"  />
            </EmptyDataTemplate>
            <Columns>
                <asp:TemplateField HeaderText="Auction name" SortExpression="AuctionName">
                   <ItemTemplate>
                        <asp:Label ID="lblAuctionName" runat="server" Text='<%# Eval("AuctionName") %>'></asp:Label>
                    </ItemTemplate>
                   <EditItemTemplate>
                        <asp:TextBox ID="txtAuctionName" runat="server" Text='<%# Bind("AuctionName") %>' ValidationGroup="edit"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="AuctionNameRequired" ControlToValidate="txtAuctionName" runat="server" ValidationGroup="edit"
                            ErrorMessage="Please enter name" Text="Required" Display="Dynamic"></asp:RequiredFieldValidator>                        
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtAuctionName1" runat="server" ValidationGroup="insert"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="AuctionNameRequired1" ControlToValidate="txtAuctionName1" runat="server" ValidationGroup="insert"
                            ErrorMessage="Please enter name" Text="Required" Display="Dynamic"></asp:RequiredFieldValidator>
                    </FooterTemplate>                    
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Date" SortExpression="Date">
                   <ItemTemplate>
                        <asp:Label ID="lblDate" runat="server" Text='<%# Eval("Date") %>'></asp:Label>
                    </ItemTemplate>
                   <EditItemTemplate>
                        <asp:TextBox ID="txtDate" runat="server" Text='<%# Bind("Date") %>' ValidationGroup="edit"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="DateRequired" ControlToValidate="txtDate" runat="server" ValidationGroup="edit"
                            ErrorMessage="Please enter date." Text="Required" Display="Dynamic"></asp:RequiredFieldValidator>   
                        <asp:CustomValidator ID="DateCustom" runat="server" ControlToValidate="txtDate"
                             Display="None" ValidationGroup="insert" onservervalidate="DateCustomEdit_ServerValidate" ></asp:CustomValidator>                     
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtDate1" runat="server" ValidationGroup="insert"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="DateRequired1" ControlToValidate="txtDate1" runat="server" ValidationGroup="insert"
                            ErrorMessage="Please enter date." Text="Required" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="DateCustom1" runat="server" ControlToValidate="txtDate1"
                             Display="None" ValidationGroup="insert" onservervalidate="DateCustomInsert1_ServerValidate" ></asp:CustomValidator>
                    </FooterTemplate>                    
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Start time" SortExpression="TimeStart">
                   <ItemTemplate>
                        <asp:Label ID="lblTimeStart" runat="server" Text='<%# Eval("TimeStart") %>'></asp:Label>
                    </ItemTemplate>
                   <EditItemTemplate>
                        <asp:TextBox ID="txtTimeStart" runat="server" Text='<%# Bind("TimeStart") %>' ValidationGroup="edit"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="TimeStartRequired" ControlToValidate="txtTimeStart" runat="server" ValidationGroup="edit"
                            ErrorMessage="Please enter start time." Text="Required" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="TimeCustom" runat="server" ControlToValidate="txtTimeStart"
                             Display="None" ValidationGroup="insert" onservervalidate="ValidStartTimeCustom_ServerValidate" ></asp:CustomValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtTimeStart1" runat="server" ValidationGroup="insert"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="TimeStartRequired1" ControlToValidate="txtTimeStart1" runat="server" ValidationGroup="insert"
                            ErrorMessage="Please enter start time." Text="Required" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:CustomValidator ID="TimeCustom" runat="server" ControlToValidate="txtTimeStart1"
                             Display="None" ValidationGroup="insert" onservervalidate="ValidStartTimeCustom_ServerValidate" ></asp:CustomValidator>
                    </FooterTemplate>                    
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="End time" SortExpression="TimeEnd">
                    <ItemTemplate>
                        <asp:Label ID="lblTimeEnd" runat="server" Text='<%# Eval("TimeEnd") %>'></asp:Label>
                    </ItemTemplate>
                   <EditItemTemplate>
                        <asp:TextBox ID="txtTimeEnd" runat="server" Text='<%# Bind("TimeEnd") %>' ValidationGroup="edit"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="TimeEndRequired" ControlToValidate="txtTimeEnd" runat="server" ValidationGroup="edit"
                            ErrorMessage="Please enter ending time." Text="Required" Display="Dynamic"></asp:RequiredFieldValidator>          
                             <asp:CustomValidator ID="TimeCustom2" runat="server" ControlToValidate="txtTimeEnd"
                             Display="None" ValidationGroup="insert" onservervalidate="ValidEndTimeCustom_ServerValidate" ></asp:CustomValidator>    
                             <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="txtTimeEnd"
                             Display="None" ValidationGroup="insert" onservervalidate="StartVsEnd_ServerValidate" ></asp:CustomValidator>          
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtTimeEnd1" runat="server" ValidationGroup="insert"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="TimeEndRequired1" ControlToValidate="txtTimeEnd1" runat="server" ValidationGroup="insert"
                            ErrorMessage="Please enter ending time." Text="Required" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="TimeCustom2" runat="server" ControlToValidate="txtTimeEnd1"
                             Display="None" ValidationGroup="insert" onservervalidate="ValidEndTimeCustom_ServerValidate" ></asp:CustomValidator>
                             <asp:CustomValidator ID="CustomValidator2" runat="server" ControlToValidate="txtTimeEnd1"
                             Display="None" ValidationGroup="insert" onservervalidate="StartVsEnd_ServerValidate" ></asp:CustomValidator>
                    </FooterTemplate>                    
                </asp:TemplateField>
               <asp:TemplateField>
                   <ItemTemplate>                                     
                       <asp:ImageButton ID="ibtnEdit" runat="server" ImageUrl="~/images/edit_icon.png" CommandName="Edit" ToolTip="Edit" Width="20px" Height="20px" />
                       <asp:ImageButton ID="ibtnDelete" runat="server" ImageUrl="~/images/delete_icon.png" CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px" />
                    </ItemTemplate>
                   <EditItemTemplate>
                        <asp:ImageButton ID="ibtnSave" runat="server" ImageUrl="~/images/save_icon.png"  ValidationGroup="edit" CommandName="Update" ToolTip="Save" Width="20px" Height="20px" />
                       <asp:ImageButton ID="ibtnCancel" runat="server" ImageUrl="~/images/cancel_icon.png" CommandName="Cancel" ToolTip="Cancel" Width="20px" Height="20px" />
                    </EditItemTemplate>
                    <FooterTemplate>
                       <asp:ImageButton ID="ibtnAdd" runat="server" ImageUrl="~/images/add_icon.png" ValidationGroup="insert" CommandName="Insert" ToolTip="Add" Width="20px" Height="20px"  />
                    </FooterTemplate>                    
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <EmptyDataRowStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>    
     <br /><br />
     <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
            ValidationGroup="insert" ForeColor="Maroon" style="text-align: left;margin: -20px 0px;"/>
            
</div>


