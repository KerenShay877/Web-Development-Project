<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="FinalProject.main" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            color: white
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
       <img src="Pictures/MainPic.png" width="700px" height="400px" border="0" />
        <br />
        <br />
        <h2>צפו בראיון בלעדי עם קולדפליי!</h2>
       <iframe width="500px" height="300px" src="https://www.youtube.com/embed/9gTDwNVGx4M" frameborder="0" allowfullscreen></iframe>
        <h2>עדכונים הכי חדשים מקולדפליי!</h2>
        <a class="twitter-timeline" href="https://twitter.com/coldplay" data-tweet-limit="5" data-theme="light" width="500px" height="300px">Tweets by coldplay</a>
        <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
        <h2>
            <a href="https://www.coldplay.com/">האתר הראשי של קולדפליי!</a>
        </h2>
        <h2>קישורים לאתרי מעריצים של קולדפיי!</h2>
        <h2>
            <a href="https://coldplaying.com/">קישור 1</a>
        </h2>
        <h2>
            <a href="https://coldplay-giselcuenca.netlify.app/">קישור 2</a>
        </h2>
        <h2>
             <a href="https://www.facebook.com/groups/576281974346363/">קישור 3</a>
        </h2>
    </center>

</asp:Content>
