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
    public partial class Signup : System.Web.UI.Page
    {
        string conUser = ConfigurationManager.ConnectionStrings["FarmerDBF"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnclose_Click(object sender, EventArgs e)
        {
            Response.Redirect("homepage.aspx");
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string fname = txtfname.Text;
            string lname = txtlname.Text;
            string mname = txtMname.Text;
            string password = txtPassword.Text;
            string email = txtEmail.Text;
            string address = txtAddress.Text + " " +  txtCity.Text + " " + ddlProvince.SelectedValue + " " + txtZipcode.Text;
            string phoneNo = txtPhoneNo.Text;

            try
            {
                using(var db = new SqlConnection(conUser))
                {
                    if(db.State == ConnectionState.Closed)
                    {
                        db.Open();
                    }
                    using(var cmd = db.CreateCommand())
                    {
                        cmd.CommandType = CommandType.Text;
                        String userId = fname; // TODO: Add some number to the user id to make it unique.
                        cmd.CommandText = "INSERT INTO USERS(USERID, FNAME, LNAME, MINITIAL, PASSWORD, EMAIL, ADDRESS, PHONE)"
                            + "VALUES( "
                            + "@userid, "
                            + "@fname, "
                            + "@lname, "
                            + "@mname, "
                            + "@pass, "
                            + "@email, "
                            + "@add, "
                            + "@phone)";
                        cmd.Parameters.AddWithValue("@userid", userId);
                        cmd.Parameters.AddWithValue("@fname", fname);
                        cmd.Parameters.AddWithValue("@lname", lname);
                        if (mname == null || mname.Length == 0) { cmd.Parameters.AddWithValue("@mname", DBNull.Value); }
                        else
                        {
                            cmd.Parameters.AddWithValue("@mname", mname);
                        }
                        cmd.Parameters.AddWithValue("@pass", password);
                        cmd.Parameters.AddWithValue("@email", email);
                        cmd.Parameters.AddWithValue("@add", address);
                        cmd.Parameters.AddWithValue("@phone", phoneNo);
                        var ctr = cmd.ExecuteNonQuery();
                        if(ctr == 1)
                        {
                            Response.Write("<script>alert('Your User id is " + userId + "');</script>");
                        } else
                        {
                            Response.Write("<script>alert('Something went wrong with your input data.');</script>");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Something went wrong');</script><pre>"+ ex.ToString() +"</pre>");
            }
        }
    }
}