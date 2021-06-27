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
    public partial class Profile : System.Web.UI.Page
    {
        string conUser = ConfigurationManager.ConnectionStrings["FarmerDBF"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"] == null || Session["userID"].ToString().Length == 0)
            {
                Response.Redirect("login.aspx", false);
            }
            else
            {
                gridView();
            }
        }

        public void gridView()
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
                        cmd.CommandText = "SELECT * FROM USERS LEFT JOIN USERSTATUS ON [USERS].[APPROVALSTATUS]=[USERSTATUS].[ID] WHERE ([userID] = @userID)";
                        cmd.Parameters.AddWithValue("@userID", Session["userID"].ToString().Trim());
                        DataTable dt = new DataTable();
                        SqlDataAdapter sda = new SqlDataAdapter(cmd);
                        sda.Fill(dt);
                        statView.DataSource = dt;
                        statView.DataBind();
                        db.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<pre style='background: white;'>" + ex.ToString() + "</pre><script>alert('Something went wrong');</script>");
            }
        }

        protected void btnclose_Click(object sender, EventArgs e)
        {
            Response.Redirect("homepage.aspx", false);
        }

        public string userStatusString(int statusCode)
        {
            switch (statusCode)
            {
                case 0: return "Idon't knoe";
                case 1: return "Idon't care";
                default: return "whatever";
                

            }
        }
    }
}