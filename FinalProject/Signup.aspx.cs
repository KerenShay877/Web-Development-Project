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
    public partial class Signup : System.Web.UI.Page
    {
        public string st = "";
        public string msg = "";
        public string sqlMsg = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Form["submit"] != null)
            {
                string fileName = "MyDataDB.mdf";
                string tableName = "usersTbl";

                st = "<table dir='ltr' border='1'>";
                st += "<tr><th colspan='2'>הפריטים שהתקבלו</th></tr>";

                string user_name = Request.Form["user_name"];
                string first_name = Request.Form["first_name"];
                string last_name = Request.Form["last_name"];
                string email = Request.Form["email"];
                string gender = Request.Form["gender"];
                string favoriteAlbum = Request.Form["favoriteAlbum"].ToString();
                string favoriteDay = Request.Form["favoriteDay"].ToString();
                string password = Request.Form["password"];
                string verifyPassword = Request.Form["verifyPassword"];

                st += "<tr><td>user_name: </td><td>" + user_name + "</td></tr>";
                st += "<tr><td>first_name: </td><td>" + first_name + "</td></tr>";
                st += "<tr><td>last_name: </td><td>" + last_name + "</td></tr>";
                st += "<tr><td>email: </td><td>" + email + "</td></tr>";
                st += "<tr><td>gender: </td><td>" + gender + "</td></tr>";
                st += "<tr><td>favorite album: </td><td>" + favoriteAlbum + "</td></tr>";
                st += "<tr><td>favorite day: </td><td>" + favoriteDay + "</td></tr>";
                st += "<tr><td>password: </td><td>" + password + "</td></tr>";
                st += "<tr><td>confirmation password: </td><td>" + verifyPassword + "</td></tr>";

                st += "</table>";

                string sqlSelect = "SELECT * FROM " + tableName + " WHERE userName = '" + user_name + "'";
                if (Helper.IsExist(fileName, sqlSelect))
                {
                    msg = "user name has been taken";
                    sqlMsg = sqlSelect;
                }
                else
                {
                    string sqlInsert = "INSERT INTO " + tableName +
                                       " VALUES (@user_name, @first_name, @last_name, @email, @gender, @favoriteAlbum, @favoriteDay, @password, @verifyPassword)";

                    using (SqlConnection conn = Helper.ConnectToDb(fileName))
                    {
                        conn.Open();
                        using (SqlCommand cmd = new SqlCommand(sqlInsert, conn))
                        {
                            cmd.Parameters.AddWithValue("@user_name", user_name);
                            cmd.Parameters.AddWithValue("@first_name", first_name);
                            cmd.Parameters.AddWithValue("@last_name", last_name);
                            cmd.Parameters.AddWithValue("@email", email);
                            cmd.Parameters.AddWithValue("@gender", gender);
                            cmd.Parameters.AddWithValue("@favoriteAlbum", favoriteAlbum);
                            cmd.Parameters.AddWithValue("@favoriteDay", favoriteDay);
                            cmd.Parameters.AddWithValue("@password", password);
                            cmd.Parameters.AddWithValue("@verifyPassword", verifyPassword);

                            cmd.ExecuteNonQuery();
                        }
                    }
                    sqlMsg = sqlInsert;
                    msg = "Success";
                }
            }
        }
    }
}