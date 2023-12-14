<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="FinalProject.Signup" %>
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
    <title>טופס הרשמה לאתר</title>

     <form class="signup-form" method="post" runat="server" onsubmit="return testInput();"> 
		<table>
			<tr>
				<td> שם משתמש: </td>
				<td> 
					<input type="text" name="user_name" id="user_name">
				</td> 
				<td>
					<input type="text" id="mUserName" size="40" style="display: none; background-color:Silver; font-weight:bold;" disabled="disabled" />
				</td>
			</tr>
		
			<tr>
				<td> שם פרטי:</td>
				<td>
					<input type="text" name="first_name" id="first_name">
				</td>
				<td>
					<input type="text" id="mFirstName" size="40" style="display: none; background-color:Silver; font-weight:bold;" disabled="disabled" />
				</td>
			</tr>

			<tr>
				<td> שם משפחה:</td>
				<td>
					<input type="text" name="last_name" id="last_name">
				</td>
				<td>
					<input type="text" id="mLastName" size="40" style="display: none; background-color:Silver; font-weight:bold;" disabled="disabled" />
				</td>
			</tr>

			<tr>
				 <td>כתובת אימייל: </td>
					<td>
						<input type="text" name="email" id="email" size="40">
					</td>
					<td>
						<input type="text" id="mEmail" size="40" style="display: none; background-color:Silver; font-weight:bold;" disabled="disabled" />
					</td>
				</tr>

			<tr>
			  <td> מגדר:</td>
			   <td>
					<input type="radio" name="gender" value="male" checked> זכר
					<input type="radio" name="gender" value="female">נקבה
			   </td>

				<td>
					<input type="text" id="mGender" size="40" style="display: none; background-color:Silver; font-weight:bold;" disabled="disabled" />
				</td>
			</tr>

			<tr>
				<td>מספר אלבום אהוב:</td>
			   <td>
					<select name="favoriteAlbum">
					<option name="1">1	</option>
					<option name="2">2	</option>
					<option name="3">3	</option>
					<option name="4">4	</option>
					<option name="5">5	</option>
					<option name="6">6	</option>
					<option name="7">7	</option>
					<option name="8">8	</option>
					<option name="9">9	</option>
					</select>
				</td>
			</tr>

			<tr> 
			<td>יום האהוב עליכם בשבוע:</td>
            <td>
                <select name="favoriteDay">
                    <option value="ראשון">ראשון</option>
                    <option value="שני">שני</option>
                    <option value="שלישי">שלישי</option>
                    <option value="רביעי">רביעי</option>
                    <option value="חמישי">חמישי</option>
                    <option value="שישי">שישי</option>
                    <option value="שבת">שבת</option>
                </select>
            </td>

			 </tr>

			<tr>
				<td> סיסמה:</td>
				<td>
					<input type="password" name="password" id="password" size="10">
					<span style="color: red;">לפחות 5 תווים</span>
				</td>
				<td>
					<input type="text" id="mPassword" size="40" style="display: none; background-color:Silver; font-weight:bold;" disabled="disabled" />
				</td>
			</tr>

			<tr>
				<td> בדיקת סיסמה:</td>
				<td>
					<input type="password" name="verifyPassword" id="verifyPassword" size="10">
				</td>
				<td>
					<input type="text" id="mVerify" size="40" style="display: none; background-color:Silver; font-weight:bold;" disabled="disabled" />
				</td>
			</tr>

			 <tr>
				 <td>הערות כלליות/תגובות:</td>
					   <td>
						   <br>
						   <textarea cols="20" rows="5" name="notes"></textarea>
					   </td>
					   <td>
		
					   </td>
					   </b>
				</tr>
	
			<tr> 
				<td> 
					<input type="submit" name="submit" value="שליחה">
				</td> 
	  
				<td>
					<input type="reset" value="נקה"> 
				</td> 
			</tr>
	  </table>
		 <!--
		<table border="1" style ="margin: 0px auto; direction: ltr">
			<%= st %>
		</table>
			 -->
		<h3 style="direction: ltr; text-align: center;"><%= sqlMsg %></h3>
		<h3 style="text-align: center;"><%= msg %></h3>
  </form>
</asp:Content>
