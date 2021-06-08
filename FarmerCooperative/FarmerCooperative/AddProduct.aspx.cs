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
            productTypeList();
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
                //No user it will direct you to the login page
                if(Session["id"] == null)
                {
                    if(Session["filename"] == null)
                    {
                        Response.Write("<script>alert('No seller found: Try logging in');</script>");
                        Response.Redirect("login.aspx");
                    }
                    else
                    {
                        //image is uploaded but cannot be save yet to database because no user
                        deleteImg();
                        Response.Write("<script>alert('No seller found: Try logging in');</script>");
                        Response.Redirect("login.aspx");
                    }
                    
                }
                else 
                { 
                    if(Session["filename"] == null)
                    {
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
                                cmd.CommandText = "INSERT INTO PRODUCT(NAME, TYPE, QUANTITY, UNIT, PRICE, HARVESTDATE, EXPIRYDATE, LOCATION, IMGFILENAME, SELLERID)"
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
                                    + "@sellerID)";
                                cmd.Parameters.AddWithValue("@name", name);
                                cmd.Parameters.AddWithValue("@type", type);
                                cmd.Parameters.AddWithValue("@quantity", quantity);
                                cmd.Parameters.AddWithValue("@unit", unit);
                                cmd.Parameters.AddWithValue("@price", price);
                                cmd.Parameters.AddWithValue("@harvestDate", harvestDate);
                                cmd.Parameters.AddWithValue("@expiryDate", expiryDate);
                                cmd.Parameters.AddWithValue("@location", location);
                                cmd.Parameters.AddWithValue("@img", Session["filename"]);
                                cmd.Parameters.AddWithValue("@sellerID", Session["id"]);
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
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void btnclose_Click(object sender, EventArgs e)
        {
            Response.Redirect("homepage.aspx");
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

        public void clearScreen()
        {            
            txtProductName.Text = "";
            txtQuantity.Text = "";
            txtPrice.Text = "";
            txtHarvestDate.Text = "";
            txtExpiryDate.Text = "";
            txtAddress.Text = "";
            Session["filename"] = null;
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            clearScreen();
            deleteImg();
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
                        if ((extension == ".jpg") || (extension == ".jpeg") || (extension == ".png") || (extension == ".JPG"))
                        {
                            if(filesize < 2100000) {
                                string savePath = Path.Combine(saveDIR, filename);
                                imgUpload.SaveAs(savePath);
                                productImage.Visible = true;
                                productImage.ImageUrl = "/productImg/" + filename;
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
                    
                    Response.Write("<pre style='background: white;'>" + f + "</pre><script>alert(' " + f + "');</script>");
                }
            } 
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    
    }
}