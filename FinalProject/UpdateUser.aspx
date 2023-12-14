<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="UpdateUser.aspx.cs" Inherits="FinalProject.UpdateUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8" />
    <style>
	    body {
		    color: white;
	    }
        .signup-form tr, td {
            border: none;
            color: white;
        }
    </style>

    <script>
        function isQuot(mail) {
            var quot = '\"', quot1 = "\'";
            return mail.indexOf(quot) !== -1 || mail.indexOf(quot1) !== -1;
        }

        function isHebrew(mail) {
            var len = mail.length;
            for (var i = 0; i < len; i++) {
                var ch = mail.charAt(i);
                if (ch >= 'א' && ch <= 'ת') {
                    return true;
                }
            }
            return false;
        }

        function isValidString(mail) {
            var badChr = "$%^&*()-! []{}<>?";
            var len = mail.length;

            for (var i = 0; i < len; i++) {
                var ch = mail.charAt(i);
                if (badChr.indexOf(ch) !== -1) {
                    return true;
                }
            }
            return false;
        }

        function displayError(elementId, message) {
            var errorElement = document.getElementById(elementId);
            errorElement.value = message;
            errorElement.style.color = "red";  
            errorElement.style.display = "block"; 
        }

        function hideError(elementId) {
            var errorElement = document.getElementById(elementId);
            errorElement.innerHTML = "";
            errorElement.style.display = "none";
        }

        function testInput() {
            var userName = document.getElementById("user_name").value;
            if (userName.length < 2) {
                displayError("mUserName", "שם משתמש קצר מדי או לא קיים");
                return false;
            } else {
                hideError("mUserName");
            }

            var fName = document.getElementById("first_name").value;
            if (fName.length < 2) {
                displayError("mFirstName", "שם פרטי קצר מדי או לא קיים");
                return false;
            } else {
                hideError("mFirstName");
            }

            if (userName == fName) {
                displayError("mUserName", "שם המשתמש והשם הפרטי אינם יכולים להיות זהים");
                return false;
            } else {
                hideError("mUserName");
            }

            var lName = document.getElementById("last_name").value;
            if (lName.length < 2) {
                displayError("mLastName", "שם משפחה קצר מדי או לא קיים");
                return false;
            } else {
                hideError("mLastName");
            }

            var email = document.getElementById("email").value;
            var size = email.length;
            var atSign = email.indexOf('@');
            var dotSign = email.indexOf('.', atSign);

            var msg = "";
            if (size < 6)
                msg = "כתובת דואל קצרה מדי או לא קיימת ";
            else if (atSign == -1)
                msg = "סימן @ לא קיים בכתובת";
            else if (atSign != email.lastIndexOf('@'))
                msg = "אסור יותר מ-@ אחד בכתובת דואל";
            else if (atSign < 2 || email.lastIndexOf('@') == size - 1)
                msg = "סימן ה-@ אינו יכול להיות במקום ראשון או אחרון";
            else if (email.indexOf('.') == 0 || email.lastIndexOf('.') == size - 1)
                msg = "נקודה לא יכולה להיות תו ראשון או אחרון בכתובת";
            else if (dotSign - atSign <= 1)
                msg = "סימן הנקודה חייבת להיות לפחות 2 תווים אחרי סימן ה-@";
            else if (isQuot(email))
                msg = "כתובת דואל לא יכולה להכיל גרש או גרשיים";
            else if (isHebrew(email))
                msg = "כתובת דואל לא יכולה להכיל עברית";
            else if (isValidString(email))
                msg = "כתובת דואל לא יכולה להכיל תווים אסורים";

            if (msg !== "") {
                displayError("mEmail", msg);
                return false;
            } else {
                hideError("mEmail");
            }

            var msgPass = "";
            var password = document.getElementById("password").value;
            var verifyPassword = document.getElementById("verifyPassword").value;
            if (password !== verifyPassword)
                msgPass = "סיסמאות לא זהות";
            else if (password.length < 5)
                msgPass = "סיסמה קצרה מדי";

            if (msgPass !== "") {
                displayError("mPassword", msgPass);
                return false;
            } else {
                hideError("mPassword");
            }

            return true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>טופס עדכון פרטים</h1>
    <form method="post" runat="server" onsubmit = "return testInput();" class="signup-form">
        <table>
            <tr>
                <td>שם משתמש</td>
                <td>
                    <input type="text" name="userName" disabled="disabled" value="<%= userName %>" />
                </td>
            </tr>
            <tr>
                <td>שם פרטי</td>
                <td>
                    <input type="text" id="firstName" name="firstName" value="<%= firstName %>" />
                </td>
                <td>
                    <input type="text" id="mFirstName" size="30" style="display: none; background-color: silver; font-weight: bold;" disabled ="disabled" />
                </td>
            </tr>
            <tr>
                <td>שם משפחה</td>
                <td>
                    <input type="text" id="lastName" name="lastName" value="<%= lastName %>" />
                </td>
                <td>
                    <input type="text" id="mLastName" size="30" style="display: none; background-color: silver; font-weight: bold;" disabled ="disabled" />
                </td>
            </tr>
            <tr>
                <td>אימייל</td>
                <td>
                    <input type="text" id="email" name="email" value="<%= email %>" />
                </td>
                <td>
                    <input type="text" id="mEmail" size="40" style="display: none; background-color: silver; font-weight: bold;" disabled ="disabled" />
                </td>
            </tr>
            <tr>
                <td>מגדר</td>
                <td>
                    <% if (gender == "male")
                        {  %>
                        <input type = "radio" name ="gender" value="male" checked />זכר
                        <input type = "radio" name ="gender" value="female" />נקבה
                    <% }
                        else
                        { %>
                        <input type = "radio" name ="gender" value="male" />זכר
                        <input type = "radio" name ="gender" value="female" checked />נקבה
                    <% } %>
                </td>
            </tr>

            <tr>
	            <td>מספר אלבום אהוב:</td>
               <td>
		            <select name="favoriteAlbum" id="favoriteAlbum">
                        <% if (favoriteAlbum == "1") { %>
                            <option value="1" selected> 1</option>
                        <% } else{ %>
                            <option value="1"> 1</option>
                        <% } %>
                        <% if (favoriteAlbum == "2") { %>
                            <option value="2" selected> 2</option>
                        <% } else{ %>
                            <option value="2"> 2</option>
                        <% } %>
                        <% if (favoriteAlbum == "3") { %>
                            <option value="3" selected> 3</option>
                        <% } else{ %>
                            <option value="3"> 3</option>
                        <% } %>
                        <% if (favoriteAlbum == "4") { %>
                            <option value="4" selected> 4</option>
                        <% } else{ %>
                            <option value="4"> 4</option>
                        <% } %><% if (favoriteAlbum == "5") { %>
                            <option value="5" selected> 5</option>
                        <% } else{ %>
                            <option value="5"> 5</option>
                        <% } %><% if (favoriteAlbum == "6") { %>
                            <option value="6" selected> 6</option>
                        <% } else{ %>
                            <option value="6"> 6</option>
                        <% } %><% if (favoriteAlbum == "7") { %>
                            <option value="7" selected> 7</option>
                        <% } else{ %>
                            <option value="7"> 7</option>
                        <% } %><% if (favoriteAlbum == "8") { %>
                            <option value="8" selected> 8</option>
                        <% } else{ %>
                            <option value="8"> 8</option>
                        <% } %><% if (favoriteAlbum == "9") { %>
                            <option value="9" selected> 9</option>
                        <% } else{ %>
                            <option value="9"> 9</option>
                        <% } %>
		            </select>
	            </td>
            </tr>

            <tr> 
            <td>יום האהוב עליכם בשבוע:</td>
            <td>
                <select name="favoriteDay" id="favoriteDay">
                    <% if (favoriteDay == "ראשון") { %>
                        <option value="ראשון" selected> ראשון</option>
                    <% } else{ %>
                        <option value="ראשון"> ראשון</option>
                    <% } %>
                    <% if (favoriteDay == "שני") { %>
                        <option value="שני" selected> שני</option>
                    <% } else{ %>
                        <option value="שני"> שני</option>
                    <% } %>
                    <% if (favoriteDay == "שלישי") { %>
                        <option value="שלישי" selected> שלישי</option>
                    <% } else{ %>
                        <option value="שלישי"> שלישי</option>
                    <% } %>
                    <% if (favoriteDay == "רביעי") { %>
                        <option value="רביעי" sele4cted> 4</option>
                    <% } else{ %>
                        <option value="רביעי"> רביעי</option>
                    <% } %><% if (favoriteDay == "חמישי") { %>
                        <option value="חמישי" selected> חמישי</option>
                    <% } else{ %>
                        <option value="חמישי"> חמישי</option>
                    <% } %><% if (favoriteDay == "שישי") { %>
                        <option value="שישי" selected> שישי</option>
                    <% } else{ %>
                        <option value="שישי"> שישי</option>
                    <% } %><% if (favoriteDay == "שבת") { %>
                        <option value="שבת" selected> שבת</option>
                    <% } else { %>
                        <option value="שבת"> שבת</option>
                    <% } %>
                </select>
            </td>

             </tr>

            <tr>
	            <td> סיסמה:</td>
	            <td>
		            <input type="password" name="password" id="password" size="10" value="<%=password %>">
		            <span style="color: red;">לפחות 5 תווים</span>
	            </td>
	            <td>
		            <input type="text" id="mPassword" size="40" style="display: none; background-color:Silver; font-weight:bold;" disabled="disabled" />
	            </td>
            </tr>

            <tr>
	            <td> בדיקת סיסמה:</td>
	            <td>
		            <input type="password" name="verifyPassword" id="verifyPassword" size="10" value="<%= verifyPassword %>">
	            </td>
	            <td>
		            <input type="text" id="mVerify" size="40" style="display: none; background-color:Silver; font-weight:bold;" disabled="disabled" />
	            </td>
            </tr>

            <tr> 
	            <td> 
		            <input type="submit" name="submit" value="עדכן">
	            </td> 
            </tr>
        </table>
        <center>
            <h3><%= sqlSelect %></h3>
            <h3><%= sqlUpdate %></h3>
            <h3><%= msg %></h3>
        </center>
    </form>
</asp:Content>
