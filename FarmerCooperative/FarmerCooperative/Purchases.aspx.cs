using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FarmerCooperative
{
    public partial class Purchases : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (purchaseView.Rows.Count == 0)
            {
                lblPurchaseStatus.Visible = true;
                lblPurchaseStatus.InnerText = "You don't have any purchase history";
            }
            else
            {
                lblPurchaseStatus.Visible = false;
            }
        }

        protected void btnclose_Click(object sender, EventArgs e)
        {
            Response.Redirect("homepage.aspx", false);
        }
    }
}