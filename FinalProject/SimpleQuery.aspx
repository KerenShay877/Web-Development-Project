<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="SimpleQuery.aspx.cs" Inherits="FinalProject.SimpleQuery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            color: white
        }
    </style>
    <script>
        function detectField() {
            if (document.getElementById("field").value == "gender") {
                document.getElementById("query").innerHTML =
                    "<input type='radio' name='value' value='male' />זכר" +
                    "<input type='radio' name='value' value='female' /> נקבה";
            }
            else {
                if (document.getElementById("field").value == "favoriteAlbum") {
                    var favoriteStr = "<select name='value'><option value='1'>1\n</option>";
                    favoriteStr += "<option value='2'>2\n</option>";
                    favoriteStr += "<option value='3'>3\n</option>";
                    favoriteStr += "<option value='4'>4\n</option>";
                    favoriteStr += "<option value='5'>5\n</option>";
                    favoriteStr += "<option value='6'>6\n</option>";
                    favoriteStr += "<option value='7'>7\n</option>";
                    favoriteStr += "<option value='8'>8\n</option>";
                    favoriteStr += "<option value='9'>9\n</option>";
                    document.getElementById("query").innerHTML = favoriteStr + "</select>";
                }

                else if (document.getElementById("field").value == "favoriteDay") {
                    var favoriteDay = "<select name='value'>";

                    favoriteDay += "<option value='ראשון' >ראשון</option>\n";
                    favoriteDay += "<option value='שני' >שני</option>";
                    favoriteDay += "<option value='שלישי' >שלישי</option>";
                    favoriteDay += "<option value='רביעי' >רביעי</option>";
                    favoriteDay += "<option value='חמישי' >חמישי</option>";
                    favoriteDay += "<option value='שישי' >שישי</option>";
                    favoriteDay += "<option value='שבת' >שבת</option>";
                    document.getElementById("query").innerHTML = favoriteDay + "</select>";
                }

                else {
                    document.getElementById("query").innerHTML = "<input type='text' name='value' />";
                }
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <% if (Session["admin"].ToString() != "no") { %>
            <h1 style="color: white">הצגת נתונים לפי חתך</h1>
            <form method="post" runat="server">
                <select name="field" id="field" onclick="detectField();">
                    <option value="userName">שם משתמש</option>
                    <option value="firstName">שם פרטי</option>
                    <option value="lastName">שם משפחה</option>
                    <option value="email">אימייל</option>
                    <option value="gender">מגדר</option>
                    <option value="favoriteAlbum">אלבום אהוב</option>
                    <option value="favoriteDay">יום אהוב</option>
                </select>
                <div id="query"></div>
                <br /><br />
                <input type="submit" name="submit" value="חפש" />

                <h2 dir="ltr" style="color: white"><%= sql %></h2>
                <table style="border: 1px solid white; margin: 0px auto; color: white">
                    <%= st %>
                </table>

                <h3><%= msg %></h3>
            </form>
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
