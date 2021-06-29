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

        string conprod = ConfigurationManager.ConnectionStrings["FarmerDBF"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            Address.Visible = false;
            if (Session["category"] == null || Session["category"].ToString().Length == 0)
            {
                SqlDataSource1.SelectCommand = "SELECT *, Users.Address  + ', ' + Users.barangay + ', ' + Users.city AS Location FROM PRODUCT INNER JOIN Users ON PRODUCT.sellerID = Users.userID ";
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
            switch (sort)
            {
                case "lh":
                    if(Session["category"] == null || Session["category"].ToString().Length == 0)
                    {
                        SqlDataSource1.SelectCommand = "SELECT *, Users.Address  + ', ' + Users.barangay + ', ' + Users.city AS Location  FROM PRODUCT INNER JOIN TYPE ON PRODUCT.TYPE=TYPE.ID INNER JOIN Users ON PRODUCT.sellerID = Users.userID ORDER BY PRICE ASC";
                        SqlDataSource1.DataBind();
                    }
                    else
                    {
                        SqlDataSource1.SelectCommand = "SELECT *, Users.Address  + ', ' + Users.barangay + ', ' + Users.city AS Location  FROM PRODUCT INNER JOIN TYPE ON PRODUCT.TYPE=TYPE.ID INNER JOIN Users ON PRODUCT.sellerID = Users.userID WHERE UPPER(TYPE.NAME) = UPPER(@cat_name) ORDER BY PRICE ASC";
                        SqlDataSource1.DataBind();
                    }
                    break;
                case "hl":
                    if (Session["category"] == null || Session["category"].ToString().Length == 0)
                    {
                        SqlDataSource1.SelectCommand = "SELECT *, Users.Address  + ', ' + Users.barangay + ', ' + Users.city AS Location  FROM PRODUCT INNER JOIN TYPE ON PRODUCT.TYPE=TYPE.ID INNER JOIN Users ON PRODUCT.sellerID = Users.userID ORDER BY PRICE DESC";
                        SqlDataSource1.DataBind();
                    }
                    else
                    {
                        SqlDataSource1.SelectCommand = "SELECT *, Users.Address  + ', ' + Users.barangay + ', ' + Users.city AS Location  FROM PRODUCT INNER JOIN TYPE ON PRODUCT.TYPE=TYPE.ID INNER JOIN Users ON PRODUCT.sellerID = Users.userID WHERE UPPER(TYPE.NAME) = UPPER(@cat_name) ORDER BY PRICE DESC";
                        SqlDataSource1.DataBind();
                    }
                    break;
                case "asc":
                    if (Session["category"] == null || Session["category"].ToString().Length == 0)
                    {
                        SqlDataSource1.SelectCommand = "SELECT *, Users.Address  + ', ' + Users.barangay + ', ' + Users.city AS Location  FROM PRODUCT INNER JOIN TYPE ON PRODUCT.TYPE=TYPE.ID INNER JOIN Users ON PRODUCT.sellerID = Users.userID ORDER BY PRODUCT.NAME A" +
                            "SC";
                        SqlDataSource1.DataBind();
                    }
                    else
                    {
                        SqlDataSource1.SelectCommand = "SELECT *, Users.Address  + ', ' + Users.barangay + ', ' + Users.city AS Location  FROM PRODUCT INNER JOIN TYPE ON PRODUCT.TYPE=TYPE.ID INNER JOIN Users ON PRODUCT.sellerID = Users.userID WHERE UPPER(TYPE.NAME) = UPPER(@cat_name) ORDER BY PRODUCT.NAME ASC";
                        SqlDataSource1.DataBind();
                    }
                    break;
                case "desc":
                    if (Session["category"] == null || Session["category"].ToString().Length == 0)
                    {
                        SqlDataSource1.SelectCommand = "SELECT *, Users.Address  + ', ' + Users.barangay + ', ' + Users.city AS Location  FROM PRODUCT INNER JOIN TYPE ON PRODUCT.TYPE=TYPE.ID INNER JOIN Users ON PRODUCT.sellerID = Users.userID ORDER BY PRODUCT.NAME DESC";
                        SqlDataSource1.DataBind();
                    }
                    else
                    {
                        SqlDataSource1.SelectCommand = "SELECT *, Users.Address  + ', ' + Users.barangay + ', ' + Users.city AS Location  FROM PRODUCT INNER JOIN TYPE ON PRODUCT.TYPE=TYPE.ID INNER JOIN Users ON PRODUCT.sellerID = Users.userID WHERE UPPER(TYPE.NAME) = UPPER(@cat_name) ORDER BY PRODUCT.NAME DESC";
                        SqlDataSource1.DataBind();
                    }
                    break;
                default:
                    Session["category"] = null;
                    SqlDataSource1.SelectCommand = "SELECT *, Users.Address  + ', ' + Users.barangay + ', ' + Users.city AS Location FROM PRODUCT INNER JOIN Users ON PRODUCT.sellerID = Users.userID ";
                    SqlDataSource1.SelectParameters.Clear();
                    SqlDataSource1.DataBind();
                    break;

            }
        }

        protected void btnclose_Click(object sender, EventArgs e)
        {
            allProduct.Visible = true;
            Address.Visible = false;
        }

        protected void btnLocation_Click(object sender, EventArgs e)
        {
            allProduct.Visible = false;
            Address.Visible = true;
            LinkButton btn = (LinkButton)sender;
            string sellerID = btn.CommandArgument.ToString();
            string city = "";
            string brgy = "";
            string add = "";

            try
            {
                using(var db = new SqlConnection(conprod))
                {
                    if(db.State == ConnectionState.Closed)
                    {
                        db.Open();
                    }
                    using(var cmd = db.CreateCommand())
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = "SELECT CITY, BARANGAY, ADDRESS FROM USERS WHERE USERID = @userID ";
                        cmd.Parameters.AddWithValue("@userID", sellerID);
                        SqlDataReader rd = cmd.ExecuteReader();
                        if (rd.Read())
                        {
                            city = rd["CITY"].ToString().Trim();
                            brgy = rd["BARANGAY"].ToString().Trim();
                            add = rd["ADDRESS"].ToString().Trim();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Something went wrong');</script><pre>" + ex.ToString() + "</pre>");
            }
            city = city.Replace(' ', '+');
            brgy = brgy.Replace(' ', '+');
            add = add.Replace(' ', '+');
            string source = "https://maps.google.com/maps?q=" + brgy + " %26 more%20of%20" + city + "%20" + add + " %26 more&t=&z=13&ie=UTF8&iwloc=&output=embed";
            gmap_canvas.Attributes.Add("src", "https://maps.google.com/maps?q="+brgy+" %26 more%20of%20"+city+"%20"+add+" %26 more&t=&z=13&ie=UTF8&iwloc=&output=embed");
            //gmap_canvas.Src = "https://maps.google.com/maps?q=" + brgy + " %26 more%20of%20" + city + "%20" + add + " %26 more&t=&z=13&ie=UTF8&iwloc=&output=embed";
        }
    }
}