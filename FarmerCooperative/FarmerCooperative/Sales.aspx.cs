using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FarmerCooperative
{
    public partial class Sales : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (salesView.Rows.Count == 0)
            {
                lblSaleStatus.Visible = true;
                lblSaleStatus.InnerText = "You don't have any purchase history";
            }
            else
            {
                lblSaleStatus.Visible = false;
            }
        }

        protected void btnclose_Click(object sender, EventArgs e)
        {
            Response.Redirect("homepage.aspx", false);
        }
    }
}