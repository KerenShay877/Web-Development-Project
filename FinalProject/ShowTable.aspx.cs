﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;

namespace FinalProject
{
    public partial class ShowTable : System.Web.UI.Page
    {
        public string st = "";
        public string msg = "";
        public string sqlSelect = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"].ToString() == "no")
            {
                msg += "<h3>";
                msg += "אינך מנהל, ולכן אין לך הרשאה להיכנס לדף הניהול";
                msg += "</h3>";
                msg += "<a href='Main.aspx'><img src='Pictures/back.png' width='300px' height='100px' /></a>";
            }

            else
            {
                string fileName = "MyDataDB.mdf";
                string tableName = "usersTbl";

                sqlSelect = "SELECT * FROM " + tableName;


                DataTable table = Helper.ExecuteDataTable(fileName, sqlSelect);
                int length = table.Rows.Count;
                if (length == 0)
                    msg = "אין נרשמים";
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
                    st += "<th class='tblTH'>סיסמה</th>";
                    st += "<th class='tblTH'>אימות סיסמה</th>";
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
                        st += "<td class = 'tblTD8'>" + table.Rows[i]["password"] + "</td>";
                        st += "<td class = 'tblTD9'>" + table.Rows[i]["verifyPassword"] + "</td>";
                        st += "</tr>";
                    }
                    msg = "אנשים נרשמו: " + length;
                }
            }
        }
    }
}