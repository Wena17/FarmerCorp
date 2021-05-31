using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FarmerCooperative
{
    public partial class AddProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnclose_Click(object sender, EventArgs e)
        {
            Response.Redirect("homepage.aspx");
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

        }

        public void clearScreen().
        {
            txtProductName.Text = " ";
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {

        }
    }
}