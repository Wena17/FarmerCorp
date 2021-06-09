using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace FarmerCooperative
{
    public partial class SellersProducts : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["FarmerDBF"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Products();
            }
        }
        protected void Products()
        {
            using (var db = new SqlConnection(conn))
            {
                db.Open();
                using (var cmd = db.CreateCommand())
                {

                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "SELECT sellerID,name,quantity,price, harvestDate, expiryDate,location,imgFilename FROM PRODUCT";

                    SqlDataReader dr = cmd.ExecuteReader();

                    if (dr.HasRows == true)
                    {
                        ProductList.DataSource = dr;
                        ProductList.DataBind();
                    }
                }
            }

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {

        }
    }
}