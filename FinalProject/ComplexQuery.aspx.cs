using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;

namespace FinalProject
{
    public partial class ComplexQuery : System.Web.UI.Page
    {
        public string st = "";
        public string msg = "";
        public string sql = "";
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
                string field1 = Request.Form["field1"];
                string field2 = Request.Form["field2"];

                string value1 = Request.Form["value1"];
                string value2 = Request.Form["value2"];

                string op = Request.Form["op"];

                string fileName = "MyDataDB.mdf";
                string tableName = "usersTbl";

                string qry1 = "", qry2 = "";

                if (value1 != null)
                {
                    if (field1 == "gender" || field1 == "favoriteAlbum")
                        qry1 = field1 + " = '" + value1 + "'";
                    else if (field1 == "favoriteDay")
                        qry1 = field1 + " = N'" + value1 + "'";
                    else if (field1 == "email")
                        qry1 = field1 + " like '%" + value1 + "%'";
                    else if (field1 == "userName" || field1 == "firstName" || field1 == "lastName")
                        qry1 = field1 + " like N'" + value1 + "%'";

                }

                if (value2 != null)
                {
                    if (field2 == "gender" || field2 == "favoriteAlbum")
                        qry2 = field2 + " = '" + value2 + "'";
                    else if (field2 == "favoriteDay")
                        qry2 = field2 + " = N'" + value2 + "'";
                    else if (field2 == "email")
                        qry2 = field2 + " like '%" + value2 + "%'";
                    else if (field2 == "userName" || field2 == "firstName" || field2 == "lastName")
                        qry2 = field2 + " like N'" + value2 + "%'";
                }

                string sqlSelect = "";
                if (!string.IsNullOrEmpty(qry1) || !string.IsNullOrEmpty(qry2))
                {
                    if (!string.IsNullOrEmpty(qry1) && string.IsNullOrEmpty(qry2))
                        sqlSelect = "SELECT * FROM " + tableName + " where (" + qry1 + ");";

                    else if (string.IsNullOrEmpty(qry1) && !string.IsNullOrEmpty(qry2))
                        sqlSelect = "SELECT * FROM " + tableName + " where (" + qry2 + ");";

                    else
                    {
                        if (op == "and")
                            sqlSelect = "SELECT * FROM " + tableName + " where (" + qry1 + " AND " + qry2 + ");";
                        else
                            sqlSelect = "SELECT * FROM " + tableName + " where (" + qry1 + " OR " + qry2 + ");";
                    }
                }
                sql = sqlSelect;

                DataTable table = Helper.ExecuteDataTable(fileName, sqlSelect);
                int length = table.Rows.Count;
                if (length == 0)
                    msg = "לא נמצאו רשומות תואמות לחיפוש";
                else
                {
                    st += "<tr>";
                    st += "<th class='tblTH'>שם משתמש</th>";
                    st += "<th class='tblTH'>שם פרטי</th>";
                    st += "<th class='tblTH'>שם משפחה</th>";
                    st += "<th class='tblTH'>אימייל</th>";
                    st += "<th class='tblTH'>מגדר</th>";
                    st += "<th class='tblTH'>אלבום אהוב</th>";
                    st += "<th class='tblTH'>יום אהוב</th>";
                    // st += "<th class='tblTH'>סיסמה</th>";
                    // st += "<th class='tblTH'>אימות סיסמה</th>";
                    st += "</tr>";

                    for (int i = 0; i < length; i++)
                    {
                        st += "<tr>";
                        st += "<td class = 'tblTD1'>" + table.Rows[i]["userName"] + "</td>";
                        st += "<td class = 'tblTD2'>" + table.Rows[i]["firstName"] + "</td>";
                        st += "<td class = 'tblTD3'>" + table.Rows[i]["lastName"] + "</td>";
                        st += "<td class = 'tblTD4'>" + table.Rows[i]["email"] + "</td>";
                        st += "<td class = 'tblTD5'>" + table.Rows[i]["gender"] + "</td>";
                        st += "<td class = 'tblTD6'>" + table.Rows[i]["favoriteAlbum"] + "</td>";
                        st += "<td class = 'tblTD7'>" + table.Rows[i]["favoriteDay"] + "</td>";
                        // st += "<td class = 'tblTD8'>" + table.Rows[i]["password"] + "</td>";
                        // st += "<td class = 'tblTD9'>" + table.Rows[i]["verifyPassword"] + "</td>";
                        st += "</tr>";
                    }
                    msg = "אנשים נרשמו: " + length;
                }
            }
        }
    }
}