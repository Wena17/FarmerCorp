using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FarmerCooperative
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void signup_Click(object sender, EventArgs e)
        {
            Response.Redirect("signup.aspx", false);
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx", false);
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            if(Session["firstname"] == null)
            {
                Response.Redirect("homepage.aspx", false);
            }
        }

        protected void btnLogout2_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            if (Session["firstname"] == null)
            {
                Response.Redirect("homepage.aspx", false);
            }
        }

        protected void btnLogout1_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            if (Session["firstname"] == null)
            {
                Response.Redirect("homepage.aspx", false);
            }
        }


        protected void btnSales_Click(object sender, EventArgs e)
        {

        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            Session["product"] = "";
            Response.Redirect("addproduct.aspx", false);
        }

        protected void btnSBaddProduct_Click(object sender, EventArgs e)
        {
            Session["product"] = "";
            Response.Redirect("addproduct.aspx", false);
        }

        protected int Item_Count()
        {
            Dictionary<int, float> cart = (Dictionary<int, float>)Session["cart"];
            if (cart == null)
            {
                return 0;
            }
            else
            {
                return cart.Count;
            }
        }
    }
}