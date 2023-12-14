using System;
using System.Web.UI;

namespace FinalProject
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        public string loginMsg = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            loginMsg = "<h3>שלום ";
            loginMsg += Session["firstName"].ToString();
            loginMsg += "</h3>";

            if (Session["userName"] == "אורח")
            {
                loginMsg += "<a href='Login.aspx'>התחבר</a><br />";
                loginMsg += "<a href='Signup.aspx'>הרשם</a><br />";

                if (Session["admin"] == "yes")
                {
                    loginMsg += "<a href='Admin.aspx'>דף ניהול</a> <br />";
                    loginMsg += "<a href='Logout.aspx'>התנתק</a> <br />";
                }
            }
            else
            {
                loginMsg += "<a href='UpdateUser.aspx'>עדכון פרטים</a><br />";
                loginMsg += "<a href='Logout.aspx'>התנתק</a><br />";
               
            }
        }
    }
}
