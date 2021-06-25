using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Collections;

namespace FarmerCooperative
{
    public partial class Cart : System.Web.UI.Page
    {
        string con = ConfigurationManager.ConnectionStrings["FarmerDBF"].ConnectionString;
        public void Page_Load(object sender, EventArgs e)
        {
            if(CartItems().Count == 0)
            {
                cartStatus.Visible = true;
                btnCheckout.Visible = false;
            }
            else
            {
                cartStatus.Visible = false;
                btnCheckout.Visible = true;
            }
        }
         
        public ArrayList CartItems()
        {
            ArrayList items = new ArrayList();
            Dictionary<int, float> cart = (Dictionary<int, float>)Session["cart"];
            if (cart == null || cart.Count == 0)
            {
                return items;
            }

            try
            {
                using (var db = new SqlConnection(con))
                {
                    if (db.State == ConnectionState.Closed)
                    {
                        db.Open();
                    }
                    using (var cmd = db.CreateCommand())
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = "SELECT ID, NAME, PRICE FROM PRODUCT WHERE ID IN (" + String.Join(", ", cart.Keys) + ")";
                        var reader = cmd.ExecuteReader();
                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                CartItem item = new CartItem();
                                item.ProductId = Convert.ToInt32(reader["id"].ToString());
                                item.Amount = cart[item.ProductId];
                                item.Price = Convert.ToDouble(reader["price"].ToString());
                                item.ProductName = reader["name"].ToString();
                                items.Add(item);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            return items;
        }

        public int CartItemCount()
        {
            Dictionary<int, float> cart = (Dictionary<int, float>)Session["cart"];
            if (cart == null)
            {
                return 0;
            }
            return cart.Count;
        }

        public void RemoveItem(CartItem item)
        {
            Dictionary<int, float> cart = (Dictionary<int, float>)Session["cart"];
            cart.Remove(item.ProductId);
            HttpContext.Current.Response.Redirect("cart.aspx", false);
        }


        protected void btnClose_Click(object sender, EventArgs e)
        {
            Response.Redirect("homepage.aspx", false);
        }

    }

    public class CartItem
    {
        public int ProductId { get;  set; }

        public float Amount { get; set; }

        public string ProductName { get;  set; }

        public double Price { get;  set; }

        public double Subtotal { get { return Amount * Price; } }
    }
}