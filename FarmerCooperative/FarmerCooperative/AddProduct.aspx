<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="FarmerCooperative.AddProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="page-section about-heading">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6">
                    <div class="card shadow-lg border-0 rounded-lg mb-4">
                        <div class="card-header" id="Add" runat="server">
                            <div class="form-group d-flex justify-content-between">
                                <h3 class="text-center font-weight-light my-2">&nbsp;</h3>
                                <h3 class="text-center font-weight-light my-2">Add New Product</h3>
                                <asp:Button class="btn btn-close" ID="btnclose" runat="server" CausesValidation="False" OnClick="btnclose_Click" />
                            </div>
                        </div>
                        <div class="card-header" id="Changes" runat="server">
                            <div class="form-group d-flex justify-content-between">
                                <h3 class="text-center font-weight-light my-2">&nbsp;</h3>
                                <h3 class="text-center font-weight-light my-2">Update Product</h3>
                                <asp:Button class="btn btn-close" ID="btnCClose" runat="server" CausesValidation="False" OnClick="btnclose_Click" />
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="row"  id="Image" runat="server">
                                <label class="small mb-1" ID="uploadStatus" for="imgUpload" runat="server">Upload Product Image</label>
                                <div class="col-md-5">
                                    <asp:FileUpload class="form-control" ID="imgUpload" runat="server"/>
                                </div>
                                <div class="col-md-2">
                                    <asp:Button class="form-control btn btn-dark btn-sm"  ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" CausesValidation="False" />
                                </div>
                                <div class="col-md-5">
                                    <asp:Image CssClass="img-fluid img-thumbnail" ID="productImage" runat="server" Visible="False" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-form-label" for="txtProductName">Product Name</label>
                                <asp:RequiredFieldValidator ID="rqrtxtProductName" runat="server" ErrorMessage="*Please enter the name*" ControlToValidate="txtProductName" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                <asp:TextBox class="form-control py-4" ID="txtProductName" runat="server" placeholder="Apple"></asp:TextBox>
                            </div>
                            <div class="form-group" id="CType" runat="server">
                                <label class="col-form-label" for="txtCType">Type</label>
                                <asp:RequiredFieldValidator ID="rqrtxtCType" runat="server" ErrorMessage="*Enter the quantity*" ControlToValidate="txtCType" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                <asp:TextBox class="form-control" ID="txtCType" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group" id="Type" runat="server">
                                <label class="col-form-label" for="txtType">Type</label>
                                <asp:RequiredFieldValidator ID="rqrddlType" runat="server" ErrorMessage="*Please choose a product type*" ControlToValidate="ddlType" ForeColor="Red" SetFocusOnError="True" InitialValue="Select"></asp:RequiredFieldValidator>
                                <asp:DropDownList class="form-control" ID="ddlType" runat="server" AppendDataBoundItems="True">
                                    <asp:ListItem Text="--Select one--" Value="Select" />
                                </asp:DropDownList>
                            </div>
                            <div class="row">
                                <div class="col-md-5">
                                    <div class="form-group">
                                        <label class="col-form-label" for="txtQuantity">Quantity</label>
                                        <asp:RequiredFieldValidator ID="rqrtxtQuantity" runat="server" ErrorMessage="*Enter the quantity*" ControlToValidate="txtQuantity" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        <asp:TextBox class="form-control" ID="txtQuantity" runat="server" TextMode="Number"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-2" id="CUnit" runat="server">
                                    <div class="form-group">
                                        <label class="col-form-label" for="txtCUnit">Unit</label>
                                        <asp:RequiredFieldValidator ID="rqrtxtCUnit" runat="server" ErrorMessage="*" ControlToValidate="txtCUnit" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        <asp:TextBox class="form-control" ID="txtCUnit" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-2" id="Unit" runat="server">
                                    <div class="form-group">
                                        <label class="col-form-label" for="ddlUnit">Unit</label>
                                        <asp:RequiredFieldValidator ID="rqrUnit" runat="server" ErrorMessage="*" ControlToValidate="ddlUnit" ForeColor="Red" SetFocusOnError="True" InitialValue="Select"></asp:RequiredFieldValidator>
                                        <asp:DropDownList class="form-control" ID="ddlUnit" runat="server">
                                                <asp:ListItem Text="Select" Value="Select" />
                                                <asp:ListItem Text="kilogram" Value="kg" />
                                                <asp:ListItem Text="pieces" Value="pcs" />
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-5">
                                    <div class="form-group">
                                        <label class="col-form-label" for="txtPrice">Price per Unit</label>
                                        <asp:RequiredFieldValidator ID="rqrtxtPrice" runat="server" ErrorMessage="*Enter price*" ControlToValidate="txtPrice" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        <asp:TextBox class="form-control" ID="txtPrice" runat="server" TextMode="Number" step="0.01"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row"  id="CDate" runat="server">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="col-form-label" for="txtCHarvestDate">Harvest Date</label>
                                        <asp:RequiredFieldValidator ID="rqrtxtCHarvestDate" runat="server" ControlToValidate="txtCHarvestDate" ErrorMessage="*Required*" Display="Dynamic" ForeColor="red"></asp:RequiredFieldValidator>
                                        <asp:TextBox class="form-control py-4" ID="txtCHarvestDate" runat="server" ></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="col-form-label" for="txtCExpiryDate">Expiry Date</label>
                                        <asp:RequiredFieldValidator ID="rqrtxtCExpiryDate" runat="server" ControlToValidate="txtCExpiryDate" ErrorMessage="*Please select a date*" Display="Dynamic" ForeColor="red"></asp:RequiredFieldValidator>
                                        <asp:TextBox class="form-control py-4" ID="txtCExpiryDate" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row" id="Dates" runat="server">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="col-form-label" for="txtHarvestDate">Harvest Date</label>
                                        <asp:RequiredFieldValidator ID="rqrtxtHarvestDate" runat="server" ControlToValidate="txtHarvestDate" ErrorMessage="*Please select a date*" Display="Dynamic" ForeColor="red"></asp:RequiredFieldValidator>
                                        <asp:TextBox class="form-control py-4" ID="txtHarvestDate" runat="server" TextMode="Date"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="col-form-label" for="txtExpiryDate">Expiry Date</label>
                                        <asp:RequiredFieldValidator ID="rqrtxtExpiryDate" runat="server" ControlToValidate="txtExpiryDate" ErrorMessage="*Please select a date*" Display="Dynamic" ForeColor="red"></asp:RequiredFieldValidator>
                                        <asp:TextBox class="form-control py-4" ID="txtExpiryDate" runat="server" TextMode="Date"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="txtAddress">Address</label>
                                <asp:RequiredFieldValidator ID="rqrAddress" runat="server" ErrorMessage="*Please enter your address*" ControlToValidate="txtAddress" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                <asp:TextBox class="form-control" ID="txtAddress" runat="server" placeholder="House #, Street, Barangay" TextMode="MultiLine" Rows="2"></asp:TextBox>
                            </div>
                        </div>
                        <div class="card-footer text-center">
                            <label class="font-weight-light text-danger" id="imgNote" runat="server">**Make sure you uploaded the right image for the product before clicking submit</label>
                            <div class="form-group d-flex align-items-center justify-content-evenly mt-3 mb-3">
                                <asp:Button class="btn btn-success btn-lg" ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                <asp:Button class="btn btn-info btn-lg" ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                                <asp:Button class="btn btn-warning btn-lg" ID="btnClear" runat="server" Text="Clear" CausesValidation="False" OnClick="btnClear_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
