using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FarmerCooperative
{
    public partial class Product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["category"] = "";
        }

        protected void btnCategory_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            Session["category"] = btn.CommandArgument.ToString();
            Response.Redirect("allproduct.aspx", false);
        }
        protected void imgbtnCategory_Click(object sender, EventArgs e)
        {
            ImageButton imgbtn = (ImageButton)sender;
            Session["category"] = imgbtn.CommandArgument.ToString();
            Response.Redirect("allproduct.aspx", false);
        }
    }
}