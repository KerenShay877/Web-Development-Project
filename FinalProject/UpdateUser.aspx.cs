using System;
using System.Data;

namespace FinalProject
{
    public partial class UpdateUser : System.Web.UI.Page
    {
        public string msg = "";
        public string sqlUpdate = "";
        public string sqlSelect = "";

        public string userName, firstName, lastName, email, gender, favoriteAlbum, favoriteDay, password, verifyPassword;

        protected void Page_Load(object sender, EventArgs e)
        {
            string fileName = "MyDataDB.mdf";
            userName = Session["userName"]?.ToString();

            if (userName == "אורח")
            {
                msg = "אינך משתמש רשום במערכת";
                Response.Redirect("Main.aspx");
            }

            sqlSelect = $"SELECT * FROM usersTbl WHERE userName = N'{userName}'";
            DataTable table = Helper.ExecuteDataTable(fileName, sqlSelect);

            if (table.Rows.Count == 0)
            {
                msg = "אינך משתמש רשום במערכת";
            }
            else
            {
                DataRow row = table.Rows[0];
                firstName = row["firstName"].ToString().Trim();
                lastName = row["lastName"].ToString().Trim();
                email = row["email"].ToString().Trim();
                gender = row["gender"].ToString().Trim();
                favoriteAlbum = row["favoriteAlbum"].ToString().Trim();
                favoriteDay = row["favoriteDay"].ToString().Trim();
                password = row["password"].ToString().Trim();
                verifyPassword = row["verifyPassword"].ToString().Trim();

                if (this.IsPostBack)
                {
                    firstName = Request.Form["firstName"];
                    lastName = Request.Form["lastName"];
                    email = Request.Form["email"];
                    gender = Request.Form["gender"];
                    favoriteAlbum = Request.Form["favoriteAlbum"];
                    favoriteDay = Request.Form["favoriteDay"];
                    password = Request.Form["password"];
                    verifyPassword = Request.Form["verifyPassword"];

                    sqlUpdate = $"UPDATE usersTbl " +
                                 $"SET firstName = N'{firstName}', " +
                                 $"lastName = N'{lastName}', " +
                                 $"email = '{email}', " +
                                 $"gender = '{gender}', " +
                                 $"favoriteAlbum = '{favoriteAlbum}', " +
                                 $"favoriteDay = N'{favoriteDay}', " +
                                 $"password = '{password}', " +
                                 $"verifyPassword = '{verifyPassword}' " +
                                 $"WHERE userName = N'{userName}'";

                    Helper.DoQuery(fileName, sqlUpdate);
                    msg = "Success!";
                }
            }
        }
    }
}