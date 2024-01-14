<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" EnableEventValidation = "false" AutoEventWireup="true" CodeFile="AuctionUser.aspx.cs" Inherits="Secured_Pages_AuctionUser" %>

<%@ Register src="../Controls/AuctionUserControl.ascx" tagname="AuctionUserControl" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuContent" Runat="Server">
    <div class="clear hideSkiplink"> 
        <asp:Menu ID="NavigationMenu" runat="server" CssClass="menu" EnableViewState="false" IncludeStyleBlock="false" Orientation="Horizontal">
            <Items>
                <asp:MenuItem NavigateUrl="AuctionUser.aspx" Text="Auctions"/>
                <asp:MenuItem NavigateUrl="ArticleBidUser.aspx" Text="Articles"/>
                <asp:MenuItem NavigateUrl="BoughtUser.aspx" Text="Bought articles"/>
                <asp:MenuItem NavigateUrl="OngoingUser.aspx" Text="Bidding articles"/>
                <asp:MenuItem NavigateUrl="Info.aspx" Text="Account settings"/>                
            </Items>
        </asp:Menu>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">

    <p style="text-align: left; margin-left:10px; ">For seeing articles in auction click on the auction row in table or on the Article tab in menu. <br />
       Dark grey rows are not currently open. 
    </p>

    <uc1:AuctionUserControl ID="AuctionUserControl1" runat="server" />    
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Button ID="btnLogout" runat="server" Text="Logout" class="logout" 
        onclick="btnLogout_Click"/>
</asp:Content>
