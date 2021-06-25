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
using System.Diagnostics;
using System.Web.UI.HtmlControls;

namespace FarmerCooperative
{
    public partial class AllProduct : System.Web.UI.Page
    {      

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["category"] == null || Session["category"].ToString().Length == 0)
            {
                SqlDataSource1.SelectCommand = "SELECT * FROM PRODUCT";
                SqlDataSource1.SelectParameters.Clear();
                SqlDataSource1.DataBind();
            }
        }
        

        protected void allProductRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName.Equals("AddCart"))
            {
                if (Session["cart"] == null)
                {
                    Session["cart"] = new Dictionary<int, float>();
                }
                Dictionary<int, float> cart = (Dictionary<int, float>)Session["cart"];
                int prod_id = Convert.ToInt32(e.CommandArgument);
                float amount;
                if (!cart.TryGetValue(prod_id, out amount))
                {
                    amount = 0.0f;
                }
                cart[prod_id] = amount + 1.0f;
            }
        }


        protected void sort_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string sort = btn.CommandArgument.ToString();
            if (sort.Equals("lh")) {
                SqlDataSource1.SelectCommand = "SELECT * FROM PRODUCT INNER JOIN TYPE ON PRODUCT.TYPE=TYPE.ID WHERE UPPER(TYPE.NAME) = UPPER(@cat_name) ORDER BY PRICE ASC;";
                SqlDataSource1.DataBind();
            }
            else if (sort.Equals("hl"))
            {
                SqlDataSource1.SelectCommand = "SELECT * FROM PRODUCT INNER JOIN TYPE ON PRODUCT.TYPE=TYPE.ID WHERE UPPER(TYPE.NAME) = UPPER(@cat_name) ORDER BY PRICE DESC;";
                SqlDataSource1.DataBind();
            }
            else if (sort.Equals("asc"))
            {
                SqlDataSource1.SelectCommand = "SELECT * FROM PRODUCT INNER JOIN TYPE ON PRODUCT.TYPE=TYPE.ID WHERE UPPER(TYPE.NAME) = UPPER(@cat_name) ORDER BY PRODUCT.NAME ASC;";
                SqlDataSource1.DataBind();
            }
            else if (sort.Equals("desc"))
            {
                SqlDataSource1.SelectCommand = "SELECT * FROM PRODUCT INNER JOIN TYPE ON PRODUCT.TYPE=TYPE.ID WHERE UPPER(TYPE.NAME) = UPPER(@cat_name) ORDER BY PRODUCT.NAME DESC;";
                SqlDataSource1.DataBind();
            }
            else
            {
                SqlDataSource1.SelectCommand = "SELECT * FROM PRODUCT";
                SqlDataSource1.SelectParameters.Clear();
                SqlDataSource1.DataBind();
            }
        }
    }
}