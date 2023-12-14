<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="loginAdmin.aspx.cs" Inherits="FinalProject.loginAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            color: white;
        }
        .signup-form tr, td {
            border: none;
            color: white;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="loginForm" runat="server" method="post">
        <table id="table1" dir="rtl" align="center" class="signup-form">
            <tr>
                <td>שם מנהל: </td>
                <td>
                    <input type="text" name="mName" id="mName" />
                </td>
            </tr>
            <tr>
                <td>סיסמה: </td>
                <td><input type="password" name="pw" id="pw" /></td>
            </tr>
            <tr>
                <td colspan ="2" align="center">
                <input type="submit" name="submit" value="התחבר" />
                </td>
            </tr>
        </table> 
    </form> 
</asp:Content>
