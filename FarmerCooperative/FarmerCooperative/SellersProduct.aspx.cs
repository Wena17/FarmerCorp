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
        string conProd = ConfigurationManager.ConnectionStrings["FarmerDBF"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["userID"] == null)
            {
                Response.Redirect("login.aspx", false);
            }
            else
            {
                string command = SqlDataSource1.SelectCommand;
                SqlDataSource1.SelectCommand = "SELECT * FROM PRODUCT WHERE SELLERID = '" + Session["userID"].ToString() + "'";
                SqlDataSource1.DataBind();
                productList.DataBind();
            }
        }

        protected void productList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);

            GridViewRow selectedrow = productList.Rows[index];
            TableCell id = selectedrow.Cells[0];
            string prodID = id.Text;

            if (e.CommandName == "prodDelete")
            {
                try
                {
                    using (var db = new SqlConnection(conProd))
                    {
                        if (db.State == ConnectionState.Closed)
                        {
                            db.Open();
                        }
                        using (var cmd = db.CreateCommand())
                        {
                            cmd.CommandType = CommandType.Text;
                            cmd.CommandText = "DELETE FROM PRODUCT WHERE ID = @id AND SELLERID = @seller ";
                            cmd.Parameters.AddWithValue("@id", prodID);
                            cmd.Parameters.AddWithValue("@seller", Session["userID"].ToString().Trim());

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