<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="DeleteUser.aspx.cs" Inherits="FinalProject.DeleteUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            color: white;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <% if (Session["admin"].ToString() != "no") { %>
        <h1>טבלת משתמשים</h1>
        <h2><%= sqlSelect %></h2>

        <table style="margin: 0px auto; border: none">
            <%= st %>
        </table>

        <h3><%= msg %></h3>
        <% } %>
        <% else {  %>
            <h3>
                אינך מנהל, ולכן אין לך הרשאה להיכנס לדף הניהול
                <br />
                <a href='Main.aspx'><img src='Pictures/back.png' width='300px' height='100px'/></a>
            </h3>
        <% } %>
</center>
</asp:Content>
