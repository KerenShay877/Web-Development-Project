<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FinalProject.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        table {
            color: white;
            margin: 0px auto;
            direction: rtl;
            text-align: center;
        }

        .signup-form tr, td {
            border: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form method = "post" runat="server" class="signup-form">
        <h1>כניסת משתמש</h1>
        <table>
            <tr>
                <td>שם משתמש: </td>
                <td><input type="text" name="userName" id ="userName" /></td>
            </tr>
            <tr>
                <td>סיסמה: </td>
                <td><input type="password" name="password" id="password" /></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <input type="submit" name="submit" value = "התחבר" />
                </td>
            </tr>
        </table>
    </form>
</asp:Content>
