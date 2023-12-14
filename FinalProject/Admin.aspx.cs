using System;

namespace FinalProject
{
    public partial class Admin : System.Web.UI.Page
    {
        public string msg = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"].ToString() == "no")
            {
                msg += "<h3>";
                msg += "אינך מנהל, ולכן אין לך הרשאה להיכנס לדף הניהול";
                msg += "</h3>";
                msg += "<a href='Main.aspx'><img src='Pictures/back.png' width='300px' height='100px'/></a>";
            }
            else
            {
                msg += "<a href='ShowTable.aspx'><img src='Pictures/ShowTable.png' width='300px' height='100px' /></a>";
                msg += "<a href='SimpleQuery.aspx'><img src='Pictures/SimpleQuery.png' width='300px' height='100px' /></a>";
                msg += "<a href='ComplexQuery.aspx'><img src='Pictures/ComplexQuery.png' width='300px' height='100px' /></a>";
                msg += "<a href='DeleteUser.aspx'><img src='Pictures/DeleteUser.png' width='300px' height='100px' /></a>";
            }
        }
    }
}
