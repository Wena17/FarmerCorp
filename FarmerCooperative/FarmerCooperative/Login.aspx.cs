using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace FarmerCooperative
{
    public partial class Login : System.Web.UI.Page
    {
        string conProduct = ConfigurationManager.ConnectionStrings["FarmerDBF"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmailAddress.Text;
            string pass = txtPassword.Text;

            try
            {
                using (var db = new SqlConnection(conProduct)) { 
                    if (db.State == ConnectionState.Closed)
                    {
                        db.Open();
                    }
                    using (var cmd = db.CreateCommand()) {
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = "SELECT * FROM USERS WHERE EMAIL = '" + email + "' AND PASSWORD = '" + pass + "'";
                        SqlDataReader rdr = cmd.ExecuteReader();
                        if (rdr.HasRows)
                        {
                            while (rdr.Read())
                            {
                                Response.Write("<script>alert('Hello "+ rdr.GetValue(1).ToString() +"');</script>");
                                Session["email"] = rdr.GetValue(5).ToString();
                                Session["firstname"] = rdr.GetValue(1).ToString();
                                int role = Convert.ToInt32(rdr.GetValue(7));
                                if (role == 1)
                                {
                                    Session["role"] = "seller";
                                }
                                else if (role == 2)
                                {
                                    Session["role"] = "buyer";
                                }
                                else if (role == 3)
                                {
                                    Session["role"] = "seller & buyer";
                                }
                                else if (role == 4)
                                {
                                    Session["role"] = "admin";
                                }
                            }
                            Response.Redirect("homepage.aspx");
                        }else
                        {
                            Response.Write("<script>alert('Invalid credentials');</script>");
                            clearScreen();
                        }                       
                    }
                }
            } catch (Exception ex)
            {
                Response.Write("<script>alert('"+ ex.Message +"');</script>");
            } 
            
        }

        protected void btnclose_Click(object sender, EventArgs e)
        {
            Response.Redirect("homepage.aspx");
        }

        public void clearScreen()
        {
            txtEmailAddress.Text = " ";
            txtPassword.Text = " ";
        }

    }
}