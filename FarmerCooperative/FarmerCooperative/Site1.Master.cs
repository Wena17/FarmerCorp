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
            try
            {
                if (Session["role"] == null)
                {
                    sellernavbarDropdown.Visible = false;
                    buyerDropdown.Visible = false;
                    adminDropdown.Visible = false;
                    btnlogin.Visible = true;
                    signup.Visible = true;
                }
                else if (Session["role"] == "seller")
                {
                    sellernavbarDropdown.Visible = true;
                    buyerDropdown.Visible = false;
                    adminDropdown.Visible = false;
                    btnlogin.Visible = false;
                    signup.Visible = false;
                }
                else if (Session["role"] == "buyer")
                {
                    sellernavbarDropdown.Visible = false;
                    buyerDropdown.Visible = true;
                    adminDropdown.Visible = false;
                    btnlogin.Visible = false;
                    signup.Visible = false;
                }
                else if (Session["role"] == "admin")
                {
                    sellernavbarDropdown.Visible = false;
                    buyerDropdown.Visible = false;
                    adminDropdown.Visible = true;
                    btnlogin.Visible = false;
                    signup.Visible = false;
                }
            } catch(Exception ex)
            {
                Response.Write("<script>alert('"+ ex.Message +"');</script>");
            }
        }

        protected void signup_Click(object sender, EventArgs e)
        {
            Response.Redirect("signup.aspx");
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            if(Session["firstname"] == null)
            {
                Response.Redirect("homepage.aspx");
            }
        }

        protected void btnLogout2_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            if (Session["firstname"] == null)
            {
                Response.Redirect("homepage.aspx");
            }
        }

        protected void btnLogout1_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            if (Session["firstname"] == null)
            {
                Response.Redirect("homepage.aspx");
            }
        }
    }
}