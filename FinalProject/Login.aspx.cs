using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

namespace FinalProject
{
    public partial class Login : System.Web.UI.Page
    {
        public string msg;
        public string sqlLogin;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Form["submit"] != null)
            {
                string userName = Request.Form["userName"];
                string password = Request.Form["password"];

                string fileName = "MyDataDB.mdf";
                string tableName = "usersTbl";

                sqlLogin = "SELECT * FROM " + tableName + " WHERE userName = @UserName AND password = @Password";

                try
                {
                    using (SqlConnection conn = Helper.ConnectToDb(fileName))
                    {
                        conn.Open();

                        using (SqlCommand command = new SqlCommand(sqlLogin, conn))
                        {
                            command.Parameters.AddWithValue("@UserName", userName);
                            command.Parameters.AddWithValue("@Password", password);

                            using (SqlDataReader reader = command.ExecuteReader())
                            {
                                if (reader.Read())
                                {
                                    Application.Lock();
                                    Application["counter"] = (int)Application["counter"] + 1;
                                    Application.UnLock();

                                    Session["userName"] = reader["userName"].ToString();
                                    Session["firstName"] = reader["firstName"].ToString();

                                    Response.Redirect("Main.aspx");
                                }
                                else
                                {
                                    msg = "משתמש לא נמצא";
                                    Response.Redirect("Login.aspx");
                                }
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Database error: {ex.Message}");
                    Response.Redirect("Login.aspx?error=db");
                }
            }
        }
    }
}