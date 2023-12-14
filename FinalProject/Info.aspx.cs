using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject
{
    public partial class info : System.Web.UI.Page
    {
        public string msg = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"].ToString() == "no")
            {
                msg += "<h3>";
                msg += "אינך מנהל, ולכן אין לך הרשאה להיכנס לדף הניהול";
                msg += "</h3>";
                msg += "<a href='Main.aspx'><img src='Pictures/back.png' width='300px' height='100px' /></a>";
            }
        }
    }
}