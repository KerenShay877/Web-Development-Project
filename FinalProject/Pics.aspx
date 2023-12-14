<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Pics.aspx.cs" Inherits="FinalProject.Pics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        body {
            color: white;
        }

        h2 {
            color: purple;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>תמונות של קולדפליי!</h2>
    <img src="Pictures/Pic1.png" width="400px" height="300px" />
    <img src="Pictures/Pic2.png" width="500px" height="300px" />
    <img src="Pictures/Pic3.png" width="500px" height="300px" >
    <img src="Pictures/Pic4.png" width="500px" height="300px" />
    <img src="Pictures/Pic5.png" width="500px" height="300px" />
    <img src="Pictures/Pic6.png" width="400px" height="300px" />
</asp:Content>
