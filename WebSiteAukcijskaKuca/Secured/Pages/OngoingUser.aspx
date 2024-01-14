<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="OngoingUser.aspx.cs" Inherits="Secured_Pages_OngoingUser" %>

<%@ Register src="../Controls/OnGoingControl.ascx" tagname="OnGoingControl" tagprefix="uc1" %>

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
    <p style="text-align: left; margin-left:10px; ">Here you can see for each article you bid the biggest offer you made.</p>
    <uc1:OnGoingControl ID="OnGoingControl1" runat="server" />
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Button ID="btnLogout" runat="server" Text="Logout" class="logout" 
        onclick="btnLogout_Click"/>
</asp:Content>
