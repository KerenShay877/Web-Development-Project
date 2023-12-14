using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject
{
    public partial class DeleteRecord : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string fileName = "MyDataDB.mdf";
            if (Session["admin"].ToString() == "yes")
            {
                string userName = Request.QueryString["userName"].ToString();
                string sqlDelete = "DELETE FROM usersTbl WHERE userName = N'" + userName + "'";
                Helper.DoQuery(fileName, sqlDelete);
            }

            Response.Redirect("DeleteUser.aspx");
        }
    }
}