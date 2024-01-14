<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="InfoAdmin.aspx.cs" Inherits="Secured_Pages_InfoAdmin" %>

<%@ Register src="../../Controls/InfoControl.ascx" tagname="InfoControl" tagprefix="uc1" %>

<%@ Register src="../../Controls/ChangePasswordControl.ascx" tagname="ChangePasswordControl" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuContent" Runat="Server">
<div class="clear hideSkiplink"> 
        <asp:Menu ID="NavigationMenu" runat="server" CssClass="menu" EnableViewState="false" IncludeStyleBlock="false" Orientation="Horizontal">
            <Items>
                <asp:MenuItem NavigateUrl="AuctionAdmin.aspx" Text="Auctions"/>
                <asp:MenuItem NavigateUrl="ArticlesAdmin.aspx" Text="Articles"/>
                <asp:MenuItem NavigateUrl="ArticlesPerAuctionAdmin.aspx" Text="Articles Per Auction"/>            
                <asp:MenuItem NavigateUrl="OfferesAdmin.aspx" Text="Bidding"/>
                <asp:MenuItem NavigateUrl="WinnersAdmin.aspx" Text="Winners"/>
                <asp:MenuItem NavigateUrl="ApproveAdmin.aspx" Text="Requests"/>
                <asp:MenuItem NavigateUrl="InfoAdmin.aspx" Text="Account settings"/>
            </Items>
        </asp:Menu>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <table>
        <tr>
            <td  style="float:left">
                 <uc1:InfoControl ID="InfoControl1" runat="server" />
            </td>
            <td  style="float:right">
                
                <uc2:ChangePasswordControl ID="ChangePasswordControl1" runat="server" />
                
            </td>
        </tr>
    </table>   
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Button ID="btnLogout" runat="server" Text="Logout" class="logout" 
        onclick="btnLogout_Click"/>
</asp:Content>
