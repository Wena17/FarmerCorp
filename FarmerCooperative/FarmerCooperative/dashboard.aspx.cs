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
            gridView();
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
       
    }
}