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
    public partial class AddProduct : System.Web.UI.Page
    {
        string conProduct = ConfigurationManager.ConnectionStrings["FarmerDBF"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

        }

        protected void btnclose_Click(object sender, EventArgs e)
        {
            Response.Redirect("homepage.aspx");
        }

        public void clearScreen()
        {
            txtProductName.Text = " ";
            txtType.Text = " ";
            txtQuantity.Text = " ";
            txtPrice.Text = " ";
            txtHarvestDate.Text = " ";
            txtExpiryDate.Text = " ";
            txtAddress.Text = " ";
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            clearScreen();
        }
    }
}