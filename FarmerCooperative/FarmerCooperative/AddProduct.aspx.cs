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

        //static readonly string folder = @"C:\Users\pagay\OneDrive\Desktop\School\2nd Year\2nd Sem\Information Management\Final Project\FarmerCooperative\FarmerCooperative\productImg\";
        
        
        protected void Page_Load(object sender, EventArgs e)
        {
            productTypeList();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

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

       /*bool checkProductExist()
        {
            string sellerName = Session["name"];
            try
            {
                using (var db = new SqlConnection(conProduct)) {
                    if(db.State == ConnectionState.Closed)
                    {
                        db.Open();
                    }
                    using (var cmd = db.CreateCommand())
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = "SELECT NAME, HARVESTDATE, "
                    }
                }

            } catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }*/

        public void clearScreen()
        {
            txtProductName.Text = "";
            txtQuantity.Text = "";
            txtPrice.Text = "";
            txtHarvestDate.Text = "";
            txtExpiryDate.Text = "";
            txtAddress.Text = "";
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            clearScreen();
            deleteImg();
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            productImage.Visible = true;
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

                    if ((extension == ".jpg") || (extension == ".jpeg") || (extension == ".png") || (extension == ".JPG"))
                    {
                        if(filesize < 2100000) {
                            string savePath = Path.Combine(saveDIR, filename);
                            imgUpload.SaveAs(savePath);
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
                    
                    Response.Write("<pre style='background: white;'>" + f + "</pre><script>alert('You are about to delete file " + filename + "');</script>");
                    File.Delete(Path.Combine(folder, filename));
                    uploadStatus.InnerText = "Image successfully deleted";
                    productImage.Visible = false;
                } else
                {
                    
                    Response.Write("<pre style='background: white;'>" + f + "</pre><script>alert(' " + f + "');</script>");
                }
            } 
            catch (Exception ex)
            {
                Response.Write("<pre style='background: white;'>" + ex.ToString() + "</pre><script>alert('" + ex.Message + "');</script>");
            }
        }
    
    }
}