using System;
using System.Data;

namespace FinalProject
{
    public partial class loginAdmin : System.Web.UI.Page
    {
        public string msg = "";
        public string sqlAdmin = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Form["submit"] != null)
            {
                string name = Request.Form["mName"];
                string pw = Request.Form["pw"];

                string fileName = "MyDataDB.mdf";
                sqlAdmin = "SELECT * FROM managerTbl WHERE (mName = '" + name + "' AND pw = '" + pw + "')";

                DataTable table = Helper.ExecuteDataTable(fileName, sqlAdmin);

                if (table.Rows.Count == 0)
                {
                    msg = "<div style='text-align: center;'>";
                    msg += "<h3>אינך מנהל, אין לך הרשאה לצפות בדף הזה</h3>";
                    msg += "<a href='Main.aspx'><img src='Pictures/back.png' width='300px' height='100px'/></a>";
                    msg += "</div>";
                }
                else
                {
                    Session["firstName"] = "מנהל";
                    Session["admin"] = "yes";
                    Response.Redirect("Main.aspx");
                }
            }
        }
    }
}
