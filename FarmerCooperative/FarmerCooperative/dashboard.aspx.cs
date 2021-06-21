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
    public partial class dashboard : System.Web.UI.Page
    {
        string conUser = ConfigurationManager.ConnectionStrings["FarmerDBF"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["firstname"] == null && Session["userID"] == null)
            {
                Response.Redirect("login.aspx", false);
            }
            else if (Session["role"].Equals("admin"))
            {
                gridView();
            }
            else
            {
                Response.Redirect("homepage.aspx", false);
            }
        }

        public void gridView()
        {
            try
            {
                using(var db = new SqlConnection(conUser))
                {
                    if (db.State == ConnectionState.Closed)
                    {
                        db.Open();
                    }
                    using (var cmd = db.CreateCommand())
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = "SELECT * FROM USERS";
                        DataTable dt = new DataTable();
                        SqlDataAdapter sda = new SqlDataAdapter(cmd);
                        sda.Fill(dt);
                        userView.DataSource = dt;
                        userView.DataBind();
                        db.Close();
                    }
                }
            }
            catch(Exception ex)
            {
                Response.Write("<pre style='background: white;'>" + ex.ToString() + "</pre><script>alert('Something went wrong');</script>");
            }
        }

        protected void btnclose_Click(object sender, EventArgs e)
        {
            Response.Redirect("homepage.aspx", false);
        }

        protected void userView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);

            GridViewRow selectedrow = userView.Rows[index];
            TableCell userid = selectedrow.Cells[1];
            string user = userid.Text;

            if (e.CommandName == "Approve")
            {                
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
                            cmd.CommandText = "UPDATE USERS "
                                + " SET APPROVALSTATUS = @status "
                                + " WHERE USERID = @user ";
                            cmd.Parameters.AddWithValue("@status", 1);
                            cmd.Parameters.AddWithValue("@user", user);
                            var ctr = cmd.ExecuteNonQuery();
                            if(ctr == 1)
                            {
                                Response.Redirect(Request.RawUrl);
                            }
                        } 
                    }
                }
                catch(Exception ex)
                {
                    Response.Write("<pre style='background: white;'>" + ex.ToString() + "</pre><script>alert('Something went wrong');</script>");
                }
            }
            else if (e.CommandName == "Decline")
            {
                try
                {
                    using (var db = new SqlConnection(conUser))
                    {
                        if (db.State == ConnectionState.Closed)
                        {
                            db.Open();
                        }
                        using (var cmd = db.CreateCommand())
                        {
                            cmd.CommandType = CommandType.Text;
                            cmd.CommandText = "UPDATE USERS "
                                + " SET APPROVALSTATUS = @status "
                                + " WHERE USERID = @user ";
                            cmd.Parameters.AddWithValue("@status", 2);
                            cmd.Parameters.AddWithValue("@user", user);
                            var ctr = cmd.ExecuteNonQuery();
                            if (ctr == 1)
                            {
                                Response.Redirect(Request.RawUrl);
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<pre style='background: white;'>" + ex.ToString() + "</pre><script>alert('Something went wrong');</script>");
                }
            }
            else if (e.CommandName == "Delete")
            {
                try
                {
                    using (var db = new SqlConnection(conUser))
                    {
                        if (db.State == ConnectionState.Closed)
                        {
                            db.Open();
                        }
                        using (var cmd = db.CreateCommand())
                        {
                            cmd.CommandType = CommandType.Text;
                            cmd.CommandText = "DELETE FROM USERS WHERE USERID = @user";
                            cmd.Parameters.AddWithValue("@user", user);
                            var ctr = cmd.ExecuteNonQuery();
                            if (ctr == 1)
                            {
                                Response.Redirect(Request.RawUrl);
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<pre style='background: white;'>" + ex.ToString() + "</pre><script>alert('Something went wrong');</script>");
                }
            }
        }
    }
}