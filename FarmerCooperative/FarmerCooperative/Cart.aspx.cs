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
            checkout.Visible = false;
            if (CartItems().Count == 0)
            {
                cartStatus.Visible = true;
                cartList.Visible = false;
                btnCheckout.Visible = false;
            }
            else
            {
                cartStatus.Visible = false;
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
                        cmd.CommandText = "SELECT ID, NAME, PRICE, QUANTITY, SELLERID FROM PRODUCT WHERE ID IN (" + String.Join(", ", cart.Keys) + ")";
                        var reader = cmd.ExecuteReader();
                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                CartItem item = new CartItem();
                                item.ProductId = Convert.ToInt32(reader["id"].ToString());
                                item.Amount = cart[item.ProductId];
                                item.AvailableAmount = Convert.ToDouble(reader["QUANTITY"].ToString());
                                item.Price = Convert.ToDouble(reader["price"].ToString());
                                item.ProductName = reader["name"].ToString();
                                item.SellerID = reader["SELLERID"].ToString();
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

        public double CartTotal()
        {
            double total = 0;
            foreach (CartItem item in CartItems())
            {
                total += item.Subtotal;
            }
            return total;
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

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            Response.Redirect("allproduct.aspx", false);
        }

        protected void btnCheckoutClose_Click(object sender, EventArgs e)
        {
            checkout.Visible = false;
            cart.Visible = true;
        }


        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            if (Session["userId"] == null || Session["userId"].ToString().Length == 0)
            {
                Response.Redirect("login.aspx", false);
            }
            else
            {
                Dictionary<int, float> cartlist = (Dictionary<int, float>)HttpContext.Current.Session["cart"];
                bool moreThan = false;
                double cartqty;
                double qty;
                int status = 0;
                string prodName = "";
                foreach (CartItem item in CartItems())
                {
                    if (item.SellerID.Equals(Session["userID"].ToString()))
                    {
                        cartlist.Remove(item.ProductId);
                        ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('You cannot purchase your own item');window.location='cart.aspx';", true);
                        break;
                    }
                    else
                    {
                        using(var db = new SqlConnection(con))
                        {
                            if (db.State == ConnectionState.Closed)
                            {
                                db.Open();
                            }
                            using(var cmd = db.CreateCommand())
                            {
                                cmd.CommandType = CommandType.Text;
                                cmd.CommandText = "SELECT APPROVALSTATUS FROM USERS WHERE USERID = @id";
                                cmd.Parameters.AddWithValue("@id", Session["userID"].ToString().Trim());
                                SqlDataReader rd = cmd.ExecuteReader();
                                if (rd.Read())
                                {
                                    status = Convert.ToInt32(rd["APPROVALSTATUS"].ToString());
                                }
                            }
                        }
                        if(status == 1)
                        {
                            cartqty = item.Amount;
                            qty = item.AvailableAmount;
                            if (qty < cartqty)
                            {
                                prodName = item.ProductName;
                                moreThan = true;
                                cartlist.Remove(item.ProductId);
                                ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('You added " + prodName + " more than its available quantity or Item is not available');window.location='cart.aspx';", true);
                                break;
                            }
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('You cannot purchase until your approve');window.location='cart.aspx';", true);
                            break;
                        }
                    }
                }
                if (!moreThan)                
                {
                    cart.Visible = false;
                    checkout.Visible = true;
                }
            }
        }


        [System.Web.Services.WebMethod(EnableSession = true)]
        public static void PaymentComplete()
        {
            string connection = ConfigurationManager.ConnectionStrings["FarmerDBF"].ConnectionString;
            Dictionary<int, float> cartlist = (Dictionary<int, float>)HttpContext.Current.Session["cart"];
            var failedProducts = new HashSet<int>();
            var cart = new Cart();
            bool success = false;

            foreach (CartItem item in cart.CartItems())
            {
                using (var db = new SqlConnection(connection))
                {
                    if (db.State == ConnectionState.Closed)
                    {
                        db.Open();
                    }
                    using (var cmd1 = db.CreateCommand())
                    {
                        // 1. Reduce the amounts for the products.
                        // Here, we should check if there is still enough of the product left, because someone else might have bought it before we hit checkout.
                        cmd1.CommandText = "UPDATE PRODUCT "
                            + " SET QUANTITY -= @prodqty "
                            + " WHERE ID = @id";
                        cmd1.Parameters.AddWithValue("@id", item.ProductId);
                        cmd1.Parameters.AddWithValue("@prodqty", item.Amount);
                        try
                        {
                            var ctr = cmd1.ExecuteNonQuery();

                            if (ctr == 1)
                            {
                                // 2. Create a sales record.
                                cmd1.CommandType = CommandType.Text;
                                cmd1.CommandText = "INSERT INTO SALE(PRODUCTID, BUYERID, SELLER, QUANTITY, AMOUNT, PAYMENT) "
                                    + " VALUES ( "
                                    + " @prodID, "
                                    + " @buyerID, "
                                    + " @seller, "
                                    + " @qty, "
                                    + " @amt, "
                                    + " @payment)";
                                cmd1.Parameters.AddWithValue("@prodID", item.ProductId);
                                cmd1.Parameters.AddWithValue("@buyerID", HttpContext.Current.Session["userID"].ToString());
                                cmd1.Parameters.AddWithValue("@seller", item.SellerID);
                                cmd1.Parameters.AddWithValue("@qty", item.Amount);
                                cmd1.Parameters.AddWithValue("@amt", item.Price);
                                cmd1.Parameters.AddWithValue("@payment", "paypal");
                                ctr = cmd1.ExecuteNonQuery();
                                if(ctr == 1)
                                {
                                    success = true;
                                }
                            }
                            else
                            {
                                failedProducts.Add(item.ProductId);
                            }
                        }
                        catch (SqlException ex)
                        {
                            failedProducts.Add(item.ProductId);

                        }

                    }
                }
            }
            // 3. Empty the cart but keep the "failed" products. If the result is not empty, we should say so on the CheckoutComplete page.
            HttpContext.Current.Session["cart"] = failedProducts.ToDictionary(p => p, p => cartlist[p]);
            if (success)
            {
                cartlist.Clear();
            }
        }
    }

    public class CartItem
    {
        public int ProductId { get; set; }

        public float Amount { get; set; }

        public double AvailableAmount { get; set; }

        public string ProductName { get; set; }

        public string SellerID { get; set; }

        public double Price { get; set; }

        public double Subtotal { get { return Amount * Price; } }
    }
}