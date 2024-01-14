<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ArticleControl.ascx.cs" Inherits="Secured_ArticleControl" %>

<div class="divTableArticle">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MyLocalSqlServer %>" 
            DeleteCommand="Article_DeleteArticle" DeleteCommandType="StoredProcedure" 
            InsertCommand="Article_CreateArticle" InsertCommandType="StoredProcedure" 
            SelectCommand="Article_Get" SelectCommandType="StoredProcedure" 
            UpdateCommand="Article_UpdateArticle" UpdateCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="ArticleId" DbType="Guid" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ArticleName" Type="String" />
                <asp:Parameter Name="EstimatedAge" Type="Int32" />
                <asp:Parameter Name="Damaged" Type="Boolean" />
                <asp:Parameter Name="StartPrice" Type="Double" />
                <asp:Parameter Name="Comment" Type="String" DefaultValue=""/>
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ArticleName" Type="String" />
                <asp:Parameter Name="EstimatedAge" Type="Int32" />
                <asp:Parameter Name="Damaged" Type="Boolean" />
                <asp:Parameter Name="StartPrice" Type="Double" />
                <asp:Parameter Name="Comment" Type="String" DefaultValue=""/>
                <asp:Parameter Name="ArticleId" DbType="Guid" />
            </UpdateParameters>
        </asp:SqlDataSource>

      <asp:GridView ID="GridView1" runat="server" AllowPaging="True" class="gridCss" 
            AllowSorting="True" 
            AutoGenerateColumns="False" DataKeyNames="ArticleId"
            CellPadding="4" 
            DataSourceID="SqlDataSource1" 
            ForeColor="#3366CC" 
            GridLines="None" ShowFooter="True" BorderStyle="None"  
            onrowcommand="GridView1_RowCommand" HorizontalAlign="Left" EmptyDataText="Currently there are no articles." ShowHeaderWhenEmpty="true">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <EmptyDataTemplate>
                <asp:TextBox ID="txtArticleName1" runat="server" ValidationGroup="insert"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ArticleNameRequired1" ControlToValidate="txtArticleName1" runat="server" ValidationGroup="insert"
                            ErrorMessage="Please enter name" Text="Required" Display="Dynamic" ></asp:RequiredFieldValidator>

                <asp:TextBox ID="txtEstimatedAge1" runat="server" ValidationGroup="insert" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="EstimatedAgeRequired1" ControlToValidate="txtEstimatedAge1" runat="server" ValidationGroup="insert"
                            ErrorMessage="Please enter estimated age." Text="Required" Display="Dynamic"></asp:RequiredFieldValidator>                        
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtEstimatedAge1" ErrorMessage="Estimated age can't be less than 0."
                             Display="None" ValidationGroup="insert" ValueToCompare="0" Operator="GreaterThan" Type="Integer"></asp:CompareValidator>

                <asp:CheckBox ID="chbDamaged2" runat="server" Checked="false" ValidationGroup="insert" />

                <asp:TextBox ID="txtStartPrice1" runat="server" ValidationGroup="insert"  ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="StartPriceRequired1" runat="server" ErrorMessage="Please enter start price." 
                        ControlToValidate="txtStartPrice1" ValidationGroup="insert" Text="Required" Display="Dynamic"></asp:RequiredFieldValidator> 
                        <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="txtStartPrice1" ErrorMessage="Price can't be less than 0.00 $ ."
                             Display="None" ValidationGroup="insert" ValueToCompare="0" Operator="GreaterThan" Type="Double"></asp:CompareValidator>                        
                        
                <asp:TextBox ID="txtComment2" runat="server" ValidationGroup="insert" TextMode="MultiLine" style="margin-bottom: -6px;"></asp:TextBox>  

                <asp:ImageButton ID="ibtnAdd" runat="server" ImageUrl="~/images/add_icon.png" ValidationGroup="insert" CommandName="InsertEmpty" ToolTip="Add" Width="20px" Height="20px"  />
            </EmptyDataTemplate>
            <Columns>
                <asp:TemplateField HeaderText="Article Name" SortExpression="ArticleName">
                    <ItemTemplate>
                        <asp:Label ID="lblArticleName" runat="server" Text='<%# Eval("ArticleName") %>' CssClass="elementGrid"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtArticleName" runat="server" Text='<%# Bind("ArticleName") %>' ValidationGroup="edit" CssClass="elementGrid"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ArticleNameRequired"  ControlToValidate="txtArticleName"
                        runat="server" ValidationGroup="edit"
                         ErrorMessage="Please enter name" Text="Required" Display="Dynamic"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtArticleName1" runat="server" ValidationGroup="insert" CssClass="elementGrid"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ArticleNameRequired1" ControlToValidate="txtArticleName1" runat="server" ValidationGroup="insert"
                            ErrorMessage="Please enter name" Text="Required" Display="Dynamic" ></asp:RequiredFieldValidator>
                    </FooterTemplate>                    
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Estimated Age" SortExpression="EstimatedAge">
                    <ItemTemplate>
                        <asp:Label ID="lblEstimatedAge" runat="server" Text='<%# Eval("EstimatedAge") %>' CssClass="elementGrid"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEstimatedAge" runat="server" Text='<%# Bind("EstimatedAge") %>' ValidationGroup="edit" CssClass="elementGrid"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="EstimatedAgeRequired"  ControlToValidate="txtEstimatedAge" runat="server" ValidationGroup="edit"
                            ErrorMessage="Please enter estimated age." Text="Required" Display="Dynamic"></asp:RequiredFieldValidator>  
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtEstimatedAge" ErrorMessage="Estimated age can't be less than 0."
                             Display="None" ValidationGroup="insert" ValueToCompare="0" Operator="GreaterThan" Type="Integer"></asp:CompareValidator>                    
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtEstimatedAge1" runat="server" ValidationGroup="insert" CssClass="elementGrid"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="EstimatedAgeRequired1" ControlToValidate="txtEstimatedAge1" runat="server" ValidationGroup="insert"
                            ErrorMessage="Please enter estimated age." Text="Required" Display="Dynamic"></asp:RequiredFieldValidator>
                           <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtEstimatedAge1" ErrorMessage="Estimated age can't be less than 0."
                             Display="None" ValidationGroup="insert" ValueToCompare="0" Operator="GreaterThan" Type="Integer"></asp:CompareValidator>
                    </FooterTemplate>         
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Damaged" SortExpression="Damaged">
                    <ItemTemplate>
                        <asp:CheckBox ID="chbDamaged" runat="server" Checked='<%# Eval("Damaged") %>' 
                            Enabled="false" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:CheckBox ID="chbDamaged1" runat="server" Checked='<%# Bind("Damaged")  %>' ValidationGroup="edit" />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:CheckBox ID="chbDamaged2" runat="server" Checked="false" ValidationGroup="insert" />
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Start Price ($)" SortExpression="StartPrice">
                     <ItemTemplate>
                        <asp:Label ID="lblStartPrice" runat="server" CssClass="elementGrid" Text='<%# Eval("StartPrice") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtStartPrice" runat="server" Text='<%# Bind("StartPrice") %>' ValidationGroup="edit" CssClass="elementGrid"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="StartPriceRequired" runat="server" ErrorMessage="Please enter start price." 
                        ControlToValidate="txtStartPrice" ValidationGroup="edit" Text="Required" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="txtStartPrice" ErrorMessage="Price can't be less than 0.00 $ ."
                             Display="None" ValidationGroup="insert" ValueToCompare="0" Operator="GreaterThan" Type="Double"></asp:CompareValidator>   
                    </EditItemTemplate>           
                    <FooterTemplate> 
                        <asp:TextBox ID="txtStartPrice1" runat="server" ValidationGroup="insert"  CssClass="elementGrid"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="StartPriceRequired1" runat="server" ErrorMessage="Please enter start price." 
                        ControlToValidate="txtStartPrice1" ValidationGroup="insert" Text="Required" Display="Dynamic"></asp:RequiredFieldValidator>   
                        <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="txtStartPrice1" ErrorMessage="Price can't be less than 0.00 $ ."
                             Display="None" ValidationGroup="insert" ValueToCompare="0" Operator="GreaterThan" Type="Double"></asp:CompareValidator>           
                    </FooterTemplate>       
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Comment" SortExpression="Comment">
                    <ItemTemplate>
                        <asp:TextBox ID="txtComment" runat="server" Text='<%# Eval("Comment") %>' CssClass="elementGrid" TextMode="MultiLine" Enabled="False"></asp:TextBox>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtComment1" runat="server" Text='<%# Bind("Comment") %>' CssClass="elementGrid" ValidationGroup="edit" TextMode="MultiLine"></asp:TextBox>                       
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtComment2" runat="server" ValidationGroup="insert" TextMode="MultiLine" CssClass="elementGrid"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField FooterStyle-Width="45px">
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
<br /><br />

 <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
            ValidationGroup="insert" ForeColor="Maroon" style="text-align: left;margin: 50px 0px;"/>


