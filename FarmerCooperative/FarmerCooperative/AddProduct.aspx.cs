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


namespace FarmerCooperative
{
    public partial class AddProduct : System.Web.UI.Page
    {
        string conProduct = ConfigurationManager.ConnectionStrings["FarmerDBF"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null && Session["userID"] == null)
            {
                Response.Redirect("login.aspx", false);
            } else {
                if (Session["product"].Equals("change"))
                {
                    Add.Visible = false;
                    Changes.Visible = true;
                    Image.Visible = false;
                    CType.Visible = true;
                    Type.Visible = false;
                    CUnit.Visible = true;
                    Unit.Visible = false;
                    CDate.Visible = true;
                    Dates.Visible = false;
                    btnSubmit.Visible = false;
                    btnUpdate.Visible = true;
                    if (!IsPostBack) {  loadProduct(); }
                }
                else
                {
                    Add.Visible = true;
                    Changes.Visible = false;
                    Image.Visible = true;
                    CType.Visible = false;
                    Type.Visible = true;
                    CUnit.Visible = false;
                    Unit.Visible = true;
                    CDate.Visible = false;
                    Dates.Visible = true;
                    btnSubmit.Visible = true;
                    btnUpdate.Visible = false;
                    productTypeList();
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string name = txtProductName.Text;
            string type = ddlType.SelectedValue;
            double quantity = Convert.ToDouble(txtQuantity.Text);
            string unit = ddlUnit.SelectedValue;
            double price = Convert.ToDouble(txtPrice.Text);
            string harvestDate = txtHarvestDate.Text;
            string expiryDate = txtExpiryDate.Text;
            string location = txtAddress.Text;

            try
            {
                if(Session["filename"].ToString().Length == 0 && Session["imgPath"].ToString().Length == 0)
                {
                    uploadStatus.InnerText = "Uploaded Product image";
                    Response.Write("<script>alert('Must upload image first');</script>");
                }
                else {
                    using(var db = new SqlConnection(conProduct))
                    {
                        if (db.State == ConnectionState.Closed)
                        {
                            db.Open();
                        }
                        using(var cmd = db.CreateCommand())
                        {
                            cmd.CommandType = CommandType.Text;
                            cmd.CommandText = "INSERT INTO PRODUCT(NAME, TYPE, QUANTITY, UNIT, PRICE, HARVESTDATE, EXPIRYDATE, LOCATION, IMGFILENAME, IMGPATH, SELLERID)"
                                + "VALUES( "
                                + "@name, "
                                + "@type, "
                                + "@quantity, "
                                + "@unit, "
                                + "@price, "
                                + "@harvestDate, "
                                + "@expiryDate, "
                                + "@location, "
                                + "@img, "
                                + "@imgPath, "
                                + "@sellerID)";
                            cmd.Parameters.AddWithValue("@name", name);
                            cmd.Parameters.AddWithValue("@type", type);
                            cmd.Parameters.AddWithValue("@quantity", quantity);
                            cmd.Parameters.AddWithValue("@unit", unit);
                            cmd.Parameters.AddWithValue("@price", price);
                            cmd.Parameters.AddWithValue("@harvestDate", harvestDate);
                            cmd.Parameters.AddWithValue("@expiryDate", expiryDate);
                            cmd.Parameters.AddWithValue("@location", location);
                            cmd.Parameters.AddWithValue("@img", Session["filename"].ToString());
                            cmd.Parameters.AddWithValue("@imgPath", Session["imgPath"].ToString());
                            cmd.Parameters.AddWithValue("@sellerID", Session["userID"].ToString());
                            var ctr = cmd.ExecuteNonQuery();
                            if(ctr == 1)
                            {
                                Response.Write("<script>alert('"+ quantity +" "+ name +" has been added to your products');</script>");
                                productImage.Visible = false;
                                uploadStatus.InnerText = "Uploaded Product image";
                                clearScreen();
                            }
                            else
                            {
                                Response.Write("<script>alert('Something went wrong with your input data.');</script>");
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void btnclose_Click(object sender, EventArgs e)
        {
            Session["filename"] = null;
            Session["filename"] = "";
            Response.Redirect("homepage.aspx", false);
        }

        public void productTypeList()
        {
            try
            {
                using (var db = new SqlConnection(conProduct))
                {
                    db.Open();
                    using (var cmd = db.CreateCommand())
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = "SELECT NAME FROM TYPE";

                        ddlType.DataValueField = "name";
                        ddlType.DataTextField = "name";
                        ddlType.DataSource = cmd.ExecuteReader();
                        ddlType.DataBind();
                    }
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        public void loadProduct()
        {
            string prodID = Session["prodID"].ToString().Trim();
            string userID = Session["userID"].ToString().Trim();
            try
            {
                using (var db = new SqlConnection(conProduct))
                {
                    db.Open();
                    using (var cmd = db.CreateCommand())
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = "SELECT * FROM PRODUCT WHERE ID = @prodID AND SELLERID = @userID ";

                        cmd.Parameters.AddWithValue("@prodID", prodID);
                        cmd.Parameters.AddWithValue("@userID", userID);

                        SqlDataReader rdr = cmd.ExecuteReader();
                        if (rdr.Read())
                        {
                            txtProductName.Text = rdr["NAME"].ToString();
                            txtCType.Text = rdr["TYPE"].ToString();
                            txtQuantity.Text = rdr["QUANTITY"].ToString();
                            txtCUnit.Text = rdr["UNIT"].ToString();
                            txtPrice.Text = rdr["PRICE"].ToString();
                            txtCHarvestDate.Text = Convert.ToDateTime(rdr["HARVESTDATE"].ToString()).ToString("d");
                            txtCExpiryDate.Text = Convert.ToDateTime(rdr["EXPIRYDATE"].ToString()).ToString("d");
                            txtAddress.Text = rdr["LOCATION"].ToString();
                        }
                        rdr.Close();
                    }
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        public void clearScreen()
        {
            txtProductName.Text = string.Empty;
            ddlType.ClearSelection();
            txtCType.Text = string.Empty;
            txtQuantity.Text = string.Empty;
            ddlUnit.ClearSelection();
            txtCUnit.Text = string.Empty;
            txtPrice.Text = string.Empty;
            txtHarvestDate.Text = string.Empty;
            txtCHarvestDate.Text = string.Empty;
            txtExpiryDate.Text = string.Empty;
            txtCExpiryDate.Text = string.Empty;
            txtAddress.Text = string.Empty;
            Session["filename"] = null;
            Session["filename"] = string.Empty;
            Session["imgPath"] = null;
            Session["imgPath"] = string.Empty;
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            clearScreen();
            if (Session["product"].Equals("change"))
            {
                Session["product"] = "";
                Session["prodID"] = "";
                Response.Redirect("sellersproduct.aspx", false);
            }
            else
            {
                deleteImg();
            }
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            uploadImg();
        }

        public void uploadImg()
        {
            string saveDIR = Server.MapPath("/productImg");
            try
            {
                if (imgUpload.HasFile)
                {
                    string filename = Server.HtmlEncode(imgUpload.FileName);
                    string extension = System.IO.Path.GetExtension(filename);
                    int filesize = imgUpload.PostedFile.ContentLength;
                    if(File.Exists(Path.Combine(saveDIR, filename)))
                    {
                        uploadStatus.InnerText = "File already exist";
                    }
                    else {
                        if ((extension == ".jpg") || (extension == ".jpeg") || (extension == ".png") || (extension == ".JPG") || (extension == ".JPEG") || (extension == ".PNG"))
                        {
                            if(filesize < 2100000) {
                                string savePath = Path.Combine(saveDIR, filename);
                                imgUpload.SaveAs(savePath);
                                productImage.Visible = true;
                                productImage.ImageUrl = Path.Combine("/productImg/",  filename);
                                Session["imgPath"] = Path.Combine("/productImg/", filename);
                                Session["filename"] = filename;
                                uploadStatus.InnerText = "Your file was uploaded successfully.";
                            }
                            else
                            {
                                uploadStatus.InnerText = "Your file was not uploaded because image size is more than 2MB";
                            }
                        }
                        else
                        {
                            uploadStatus.InnerText = "Your file was not uploaded because it does not have a .jpg or .jpeg or .png extension.";
                        }
                    }
                }
                else
                {
                    uploadStatus.InnerText = "Upload Failed: Try again";
                }
            }
            catch (Exception ex)
            {
                Response.Write("<pre style='background: white;'>" + ex.ToString() + "</pre><script>alert('" + ex.Message + "');</script>");
            }
        }
        public void deleteImg()
        {
            string folder = Server.MapPath("/productImg");
            string filename = Session["filename"].ToString();
            try
            {
                string f = Path.Combine(folder, filename);
                if (File.Exists(Path.Combine(folder, filename)))
                {
                    File.Delete(Path.Combine(folder, filename));
                    uploadStatus.InnerText = "Image successfully deleted";
                    productImage.Visible = false;
                    Session["filename"] = null;
                } else
                {

                    Response.Write("<pre style='background: white;'>" + filename + "</pre><script>alert(' " + filename + "');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string prodID = Session["prodID"].ToString().Trim();
            string userID = Session["userID"].ToString().Trim();
            string name = txtProductName.Text;
            string type = txtCType.Text;
            double quantity = Convert.ToDouble(txtQuantity.Text);
            string unit = txtCUnit.Text;
            double price = Convert.ToDouble(txtPrice.Text);
            DateTime harvestDate = DateTime.ParseExact(txtCHarvestDate.Text, "dd/MM/yyyy", null);
            DateTime expiryDate = DateTime.ParseExact(txtCHarvestDate.Text, "dd/MM/yyyy", null);
            string location = txtAddress.Text;

            try
            {
                using (var db = new SqlConnection(conProduct))
                {
                    if (db.State == ConnectionState.Closed)
                    {
                        db.Open();
                    }
                    using (var cmd = db.CreateCommand())
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = "UPDATE PRODUCT "
                                + " SET NAME = @name, "
                                + " TYPE = @type, "
                                + " QUANTITY = @quantity, "
                                + " UNIT = @unit, "
                                + " PRICE = @price, "
                                + " HARVESTDATE = @harvestDate, "
                                + " EXPIRYDATE = @expiryDate, "
                                + " LOCATION = @location "
                                + " WHERE ID = @prodID AND SELLERID = @userID";
                        cmd.Parameters.AddWithValue("@prodID", prodID);
                        cmd.Parameters.AddWithValue("@userID", userID);
                        cmd.Parameters.AddWithValue("@name", name);
                        cmd.Parameters.AddWithValue("@type", type);
                        cmd.Parameters.AddWithValue("@quantity", quantity);
                        cmd.Parameters.AddWithValue("@unit", unit);
                        cmd.Parameters.AddWithValue("@price", price);
                        cmd.Parameters.AddWithValue("@harvestDate", harvestDate);
                        cmd.Parameters.AddWithValue("@expiryDate", expiryDate);
                        cmd.Parameters.AddWithValue("@location", location);
                        var ctr = cmd.ExecuteNonQuery();
                        if (ctr == 1)
                        {
                            Session["prodID"] = "";
                            Session["product"] = "";
                            Response.Redirect("sellersproduct.aspx", false);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<pre style='background: white;'>" + ex.ToString() + "</pre><script>alert('Something went wrong');</script>");
            }
        }

        
    }
}
