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
            string userID = txtUserID.Text.Trim();
            string password = txtPassword.Text.Trim();

            try
            {
                using (var db = new SqlConnection(conProduct)) { 
                    if (db.State == ConnectionState.Closed)
                    {
                        db.Open();
                    }
                    using (var cmd = db.CreateCommand()) {
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = "SELECT * FROM USERS WHERE USERID = @userID AND PASSWORD = @pass";
                        cmd.Parameters.AddWithValue("@userID", userID);
                        cmd.Parameters.AddWithValue("@pass", password);

                        SqlDataReader rdr = cmd.ExecuteReader();
                        if (rdr.HasRows)
                        {
                            while (rdr.Read())
                            {
                                Response.Write("<script>alert('Hello " + rdr["Fname"].ToString() + "');</script>");
                                Session["product"] = "";
                                Session["id"] = rdr.GetValue(rdr.GetOrdinal("ID")).ToString();
                                Session["userID"] = rdr.GetValue(rdr.GetOrdinal("userID")).ToString();
                                Session["firstname"] = rdr.GetValue(rdr.GetOrdinal("Fname")).ToString();
                                Session["status"] = rdr.GetValue(rdr.GetOrdinal("APPROVALSTATUS")).ToString();
                                int role = Convert.ToInt32(rdr.GetValue(rdr.GetOrdinal("Role")));
                                Session["role"] = "";
                                if ((role & 1) != 0) // Role in binary is ..1 (= 1) if the user is a seller.
                                {
                                    Session["role"] += "seller";
                                }
                                if ((role & 2) != 0) // Role in binary is .1. (= 2) if the user is a buyer.
                                {
                                    Session["role"] += "buyer";
                                    //Session["cart"] = new List<String>(); // TODO: This needs to be an instance of Sale that has a product id and a quantity.
                                }
                                else if ((role & 4) != 0) // Role in binary is 1.. (= 4) if the user is an admin.
                                {
                                    Session["role"] = "admin";
                                }                                
                            }
                            if (Session["role"].Equals("admin"))
                            {
                                Response.Redirect("dashboard.aspx", false);
                            }
                            else
                            {
                                Response.Redirect("homepage.aspx", false);
                            }
                            
                        }else
                        {
                            Response.Write("<script>alert('Invalid credentials');</script>");
                            clearScreen();
                        }                       
                    }
                }
            } catch (Exception ex)
            {
                Response.Write("<pre style='background: white;'>" + ex.ToString() + "</pre><script>alert('"+ ex.Message +"');</script>");
            } 
            
        }

        protected void btnclose_Click(object sender, EventArgs e)
        {
            Response.Redirect("homepage.aspx", false);
        }

        public void clearScreen()
        {
            txtUserID.Text = string.Empty;
            txtPassword.Text = string.Empty;
        }

    }
}