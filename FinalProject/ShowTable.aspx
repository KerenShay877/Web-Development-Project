<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ShowTable.aspx.cs" Inherits="FinalProject.ShowTable" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            color: white;
        }

        h1 {
            color: red;
            text-align: center;
        }

        h2 {
            text-align: center;
            direction: ltr;
        }

        h3 {
            text-align: center;
        }

        .tableDB {
            border: 1px solid white;
            margin: 0px auto;
        }

        .tblTH {
            text-align: center;
            border: 1px solid white;
        }

        .tblTD1 {
            border: 1px solid white;
            text-align: center;
        }

        .tblTD2 {
            border: 1px solid white;
        }

        .tabTD3 {
            border: 1px solid white;
            text-align: center;
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
