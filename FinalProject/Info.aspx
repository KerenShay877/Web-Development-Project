<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Info.aspx.cs" Inherits="FinalProject.info" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            color: white
        }

        h2, p {
            color: white;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <% if (Session["userName"].ToString() != "אורח") { %>
        <h2>כריס מרטין</h2>
        <p>
            כריסטופר אנטוני ג'ון "כריס" מרטין (באנגלית: Christopher Anthony John "Chris" Martin; נולד ב-2 במרץ 1977) הוא זמר-יוצר ומוזיקאי אנגלי, המשמש סולן, פסנתרן וגיטריסט משנה בלהקת הרוק קולדפליי.
        </p>
        <center>
            <img src="Pictures/ChrisMartin.jpg" width="500px" height="300px"/>
            <br />
            <br />
            <a href="ChrisMartin.aspx">
                <img src="Pictures/readmore.png" width="300px" height="100px" />
            </a>
        </center>

        <h2>ג'ון באקלנד</h2>
        <p>
            ג'ונתן מארק (ג'וני) באקלנד (אנגלית: Jonathan Mark "Jonny" Buckland; נולד ב-11 בספטמבר 1977 בשם ג'ונתן מארק באקלנד), הוא הגיטריסט הראשי של להקת הרוק הבריטית קולדפליי.
        </p>
        <center>
            <img src="Pictures/JohnnyBuckland.jpg" width="500px" height="300px"/>
            <br />
            <br />
            <a href="JohnnyBuckland.aspx">
                <img src="Pictures/readmore.png" width="300px" height="100px" />
            </a>
        </center>

        <h2>גאי ברימן</h2>
        <p>
            גיא ברימן (באנגלית: Guy Berryman; נולד ב-12 באפריל 1978) הוא הבסיסט של להקת הרוק הבריטית קולדפליי.
        </p>
        <center>
            <img src="Pictures/GuyBerryman.jpg" width="500px" height="300px"/>
            <br />
            <br />
            <a href="GuyBerryman.aspx">
                <img src="Pictures/readmore.png" width="300px" height="100px" />
            </a>
        </center>

        <h2>ויל צ'מפיון</h2>
        <p>
            ויל צ'מפיון (באנגלית: Will Champion; נולד ב-31 ביולי 1978) הוא המתופף של להקת הרוק הבריטית קולדפליי.
        </p>
        <center>
            <img src="Pictures/WillChampion.jpg" width="500px" height="300px"/>
            <br />
            <br />
            <a href="WillChampion.aspx">
                <img src="Pictures/readmore.png" width="300px" height="100px" />
            </a>
        </center>
    <%  } else {  %>
    <center>
        <h3>
        אינך משתמש רשום, ולכן אין לך הרשאה להיכנס לדף של משתמשים רשומים
        <br />
        
             <a href='Main.aspx'><img src='Pictures/back.png' width='300px' height='100px'/></a>
        </h3>
        </center>
    <% } %>
</asp:Content>
