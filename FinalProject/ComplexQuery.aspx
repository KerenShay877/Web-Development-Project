<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ComplexQuery.aspx.cs" Inherits="FinalProject.ComplexQuery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            color: white
        }
    </style>

    <script>
        function detectField1() {
            if (document.getElementById("field1").value == "gender") {
                document.getElementById("query1").innerHTML =
                    "<input type='radio' name='value1' value='male' />זכר" +
                    "<input type='radio' name='value1' value='female' /> נקבה";
            } else {
                if (document.getElementById("field1").value == "favoriteAlbum") {
                    var favoriteStr = "<select name='value1'><option value='1'>1\n</option>";
                    favoriteStr += "<option value='2'>2\n</option>";
                    favoriteStr += "<option value='3'>3\n</option>";
                    favoriteStr += "<option value='4'>4\n</option>";
                    favoriteStr += "<option value='5'>5\n</option>";
                    favoriteStr += "<option value='6'>6\n</option>";
                    favoriteStr += "<option value='7'>7\n</option>";
                    favoriteStr += "<option value='8'>8\n</option>";
                    favoriteStr += "<option value='9'>9\n</option>";
                    document.getElementById("query1").innerHTML = favoriteStr + "</select>";
                } else if (document.getElementById("field1").value == "favoriteDay") {
                    var favoriteDay = "<select name='value1'>";

                    favoriteDay += "<option value='ראשון' >ראשון</option>\n";
                    favoriteDay += "<option value='שני' >שני</option>";
                    favoriteDay += "<option value='שלישי' >שלישי</option>";
                    favoriteDay += "<option value='רביעי' >רביעי</option>";
                    favoriteDay += "<option value='חמישי' >חמישי</option>";
                    favoriteDay += "<option value='שישי' >שישי</option>";
                    favoriteDay += "<option value='שבת' >שבת</option>";
                    document.getElementById("query1").innerHTML = favoriteDay + "</select>";
                } else {
                    document.getElementById("query1").innerHTML = "<input type='text' name='value1' />";
                }
            }
        }

        function detectField2() {
            if (document.getElementById("field2").value == "gender") {
                document.getElementById("query2").innerHTML =
                    "<input type='radio' name='value2' value='male' />זכר" +
                    "<input type='radio' name='value2' value='female' /> נקבה";
            } else {
                if (document.getElementById("field2").value == "favoriteAlbum") {
                    var favoriteStr = "<select name='value2'><option value='1'>1\n</option>";
                    favoriteStr += "<option value='2'>2\n</option>";
                    favoriteStr += "<option value='3'>3\n</option>";
                    favoriteStr += "<option value='4'>4\n</option>";
                    favoriteStr += "<option value='5'>5\n</option>";
                    favoriteStr += "<option value='6'>6\n</option>";
                    favoriteStr += "<option value='7'>7\n</option>";
                    favoriteStr += "<option value='8'>8\n</option>";
                    favoriteStr += "<option value='9'>9\n</option>";
                    document.getElementById("query2").innerHTML = favoriteStr + "</select>";
                } else if (document.getElementById("field2").value == "favoriteDay") {
                    var favoriteDay = "<select name='value2'>";

                    favoriteDay += "<option value='ראשון' >ראשון</option>\n";
                    favoriteDay += "<option value='שני' >שני</option>";
                    favoriteDay += "<option value='שלישי' >שלישי</option>";
                    favoriteDay += "<option value='רביעי' >רביעי</option>";
                    favoriteDay += "<option value='חמישי' >חמישי</option>";
                    favoriteDay += "<option value='שישי' >שישי</option>";
                    favoriteDay += "<option value='שבת' >שבת</option>";
                    document.getElementById("query2").innerHTML = favoriteDay + "</select>";
                } else {
                    document.getElementById("query2").innerHTML = "<input type='text' name='value2' />";
                }
            }
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <% if (Session["admin"].ToString() != "no")
            {
                %>
            <h1>הצגת משתמשים רשומים המקיימים תנאי אחד או שני תנאים</h1>
            <form id="Form1" method="post" runat="server">
                <table border="1">
                    <tr>
                        <td style="width: 20px;">
                            <select name="field1" id="field1" onclick="detectField1();">
                                <option value="userName">שם משתמש</option>
                                <option value="firstName">שם פרטי</option>
                                <option value="lastName">שם משפחה</option>
                                <option value="email">אימייל</option>
                                <option value="gender">מגדר</option>
                                <option value="favoriteAlbum">אלבום אהוב</option>
                                <option value="favoriteDay">יום אהוב</option>
                            </select>
                        </td>
                        <td style="width: 150px;">
                            <div id="query1" style="text-align: center;"></div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center; direction: ltr;">
                            <input type="radio" name="op" value="and" checked='checked' /> AND
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="op" value="or" /> OR
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20px;">
                            <select name="field2" id="field2" onclick="detectField2();">
                                <option value="userName">שם משתמש</option>
                                <option value="firstName">שם פרטי</option>
                                <option value="lastName">שם משפחה</option>
                                <option value="email">אימייל</option>
                                <option value="gender">מגדר</option>
                                <option value="favoriteAlbum">אלבום אהוב</option>
                                <option value="favoriteDay">יום אהוב</option>
                            </select>
                        </td>
                        <td style="width: 150px;">
                            <div id="query2" style="text-align: center;"></div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align:center;">
                            <input type="submit" name="submit" value="חפש" /> 
                        </td>
                    </tr>
                
                </table>

                <% if(Session["admin"].ToString() != "no") { %>
                    <h2 style="text-align:center; direction:ltr;">
                        <%= sql %>
                    </h2>
                    <table border="1" style ="margin: 0px auto;">
                        <%= st %>
                    </table>
                    <h3><%= msg %></h3>
                <% } else { %>
                    <h3>
                        אינך מנהל, ולכן אין לך הרשאה להיכנס לדף הניהול
                        <br />
                        <a href='Main.aspx'><img src='Pictures/back.png' width='300px' height='100px'/></a>
                    </h3>
                <% } %>
            </form>
        <% } else {  %>
                <h3>
                    אינך מנהל, ולכן אין לך הרשאה להיכנס לדף הניהול
                    <br />
                    <a href='Main.aspx'><img src='Pictures/back.png' width='300px' height='100px'/></a>
                </h3>
        <% } %>
    </center>
</asp:Content>
