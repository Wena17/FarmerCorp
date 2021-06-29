using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace FarmerCooperative
{
    public partial class SellersProducts : System.Web.UI.Page
    {
        string conProd = ConfigurationManager.ConnectionStrings["FarmerDBF"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["id"] == null && Session["userID"] == null)
            {
                Response.Redirect("login.aspx", false);
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
                Session["prodID"] = prodID;
                deleteImg();
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
            else if (e.CommandName == "prodUpdate")
            {
                Session["product"] = "change";
                Session["prodID"] = prodID;
                Response.Redirect("addproduct.aspx", false);
            }
        }

        public void deleteImg()
        {
            string folder = Server.MapPath("/productImg");
            string imgname;
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
                        cmd.CommandText = "SELECT IMGFILENAME FROM PRODUCT WHERE ID = @id AND SELLERID = @seller ";
                        cmd.Parameters.AddWithValue("@id", Session["prodID"].ToString().Trim());
                        cmd.Parameters.AddWithValue("@seller", Session["userID"].ToString().Trim());
                        SqlDataReader rdr = cmd.ExecuteReader();

                        if (rdr.HasRows)
                        {
                            while (rdr.Read())
                            {
                                imgname = rdr["IMGFILENAME"].ToString();

                                if (File.Exists(Path.Combine(folder, imgname)))
                                {
                                    File.Delete(Path.Combine(folder, imgname));
                                    Session["prodID"] = "";
                                }
                                else
                                {

                                    Response.Write("<pre style='background: white;'>" + imgname + "</pre><script>alert(' " + imgname + "');</script>");
                                }
                            }
                        }
                    }
                }                
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            Response.Redirect("homepage.aspx", false);
        }
    }
}