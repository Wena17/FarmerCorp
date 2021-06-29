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
            signupHeader.Visible = false;
            fillIn.Visible = false;
            fillFooter.Visible = false;
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string fname = txtfname.Text;
            string lname = txtlname.Text;
            string mname = txtMname.Text;
            string password = txtPassword.Text;
            string email = txtEmail.Text.Trim();
            string city = ddlCity.SelectedValue.Trim();
            string brgy = txtbrgy.Text.Trim();
            string address = txtAddress.Text.Trim();
            string phoneNo = txtPhoneNo.Text;
            int role;
            if (Session["whoUse"].Equals("seller")) { role = 1; }
            else if(Session["whoUse"].Equals("buyer")) { role = 2; }
            else if (Session["whoUse"].Equals("SB")) { role = 2; }
            else { ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('OK');window.location='signup.aspx';", true); role = 0; }

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
                        cmd.CommandText = "INSERT INTO USERS(USERID, FNAME, LNAME, MINITIAL, PASSWORD, EMAIL, CITY, BARANGAY, ADDRESS, ROLE, PHONE)"
                            + "VALUES( "
                            + "@userid, "
                            + "@fname, "
                            + "@lname, "
                            + "@mname, "
                            + "@pass, "
                            + "@email, "
                            + "@city, "
                            + "@brgy, "
                            + "@add, "
                            + "@role, "
                            + "@phone)";
                        cmd.Parameters.AddWithValue("@userid", userId);
                        cmd.Parameters.AddWithValue("@fname", fname);
                        cmd.Parameters.AddWithValue("@lname", lname);
                        if (mname == null || mname.Length == 0) { cmd.Parameters.AddWithValue("@mname", DBNull.Value); }
                        else { cmd.Parameters.AddWithValue("@mname", mname); }
                        cmd.Parameters.AddWithValue("@pass", password);
                        cmd.Parameters.AddWithValue("@email", email);
                        cmd.Parameters.AddWithValue("@city", city);
                        cmd.Parameters.AddWithValue("@brgy", brgy);
                        cmd.Parameters.AddWithValue("@add", address);
                        cmd.Parameters.AddWithValue("@role", role);
                        cmd.Parameters.AddWithValue("@phone", phoneNo);
                        var ctr = cmd.ExecuteNonQuery();
                        if(ctr == 1)
                        {
                            Response.Write("<script>alert('Your User id is " + userId + "');</script>");
                            chooseHeader.Visible = true;
                            choose.Visible = true;
                            ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Successfully created an account');window.location='login.aspx';", true);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Something went wrong');</script><pre>"+ ex.ToString() +"</pre>");
            }
        }
        
        protected void btnclose_Click(object sender, EventArgs e)
        {
            Session["whoUse"] = "";
            Response.Redirect("homepage.aspx", false);
        }

        protected void btnChooseClose_Click(object sender, EventArgs e)
        {
            Session["whoUse"] = "";
            Response.Redirect("homepage.aspx", false);
        }

        protected void btnSeller_Click(object sender, EventArgs e)
        {
            Session["whoUse"] = "seller";
            chooseHeader.Visible = false;
            choose.Visible = false;
            signupHeader.Visible = true;
            fillIn.Visible = true;
            fillFooter.Visible = true;
        }

        protected void btnBuyer_Click(object sender, EventArgs e)
        {
            Session["whoUse"] = "buyer";
            chooseHeader.Visible = false;
            choose.Visible = false;
            signupHeader.Visible = true;
            fillIn.Visible = true;
            fillFooter.Visible = true;
        }

        protected void btnBothSB_Click(object sender, EventArgs e)
        {
            Session["whoUse"] = "SB";
            chooseHeader.Visible = false;
            choose.Visible = false;
            signupHeader.Visible = true;
            fillIn.Visible = true;
            fillFooter.Visible = true;
        }
    }
}