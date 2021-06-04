<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="FarmerCooperative.AddProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="page-section about-heading">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6">
                    <div class="card shadow-lg border-0 rounded-lg mb-4">
                        <div class="card-header">
                            <div class="form-group d-flex justify-content-between">
                                <h3 class="text-center font-weight-light my-2">&nbsp;</h3>
                                <h3 class="text-center font-weight-light my-2">Add New Product</h3>
                                <asp:Button class="btn btn-close" ID="btnclose" runat="server" CausesValidation="False" OnClick="btnclose_Click" />
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <label class="small mb-1" ID="uploadStatus" for="imgUpload" runat="server">Upload Product Image</label>
                                <div class="col-md-5">
                                    <asp:FileUpload class="form-control" ID="imgUpload" runat="server"/>
                                </div>
                                <div class="col-md-2">
                                    <asp:Button class="form-control btn btn-dark btn-sm"  ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" CausesValidation="False" />
                                </div>
                                <div class="col-md-5">
                                    <asp:Image CssClass="rounded" ID="productImage" runat="server" Visible="False" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-form-label" for="txtProductName">Product Name</label>
                                <asp:RequiredFieldValidator ID="rqrtxtProductName" runat="server" ErrorMessage="*Please enter the name*" ControlToValidate="txtProductName" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                <asp:TextBox class="form-control py-4" ID="txtProductName" runat="server" placeholder="Apple"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label class="col-form-label" for="txtType">Type</label>
                                <asp:RequiredFieldValidator ID="rqrddlType" runat="server" ErrorMessage="*Please choose a product type*" ControlToValidate="ddlType" ForeColor="Red" SetFocusOnError="True" InitialValue="Select"></asp:RequiredFieldValidator>
                                <asp:DropDownList class="form-control" ID="ddlType" runat="server" AppendDataBoundItems="True">
                                    <asp:ListItem Text="--Select one--" Value="Select" />
                                </asp:DropDownList>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="col-form-label" for="txtQuantity">Quantity</label>
                                        <asp:RequiredFieldValidator ID="rqrtxtQuantity" runat="server" ErrorMessage="*Please enter the quantity*" ControlToValidate="txtQuantity" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        <asp:TextBox class="form-control py-4" ID="txtQuantity" runat="server" TextMode="Number"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="col-form-label" for="txtPrice">Price</label>
                                        <asp:RequiredFieldValidator ID="rqrtxtPrice" runat="server" ErrorMessage="*Please enter the price*" ControlToValidate="txtPrice" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        <asp:TextBox class="form-control py-4" ID="txtPrice" runat="server" TextMode="Number" step="0.01"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
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
                            <div class="form-group d-flex align-items-center justify-content-evenly mt-3 mb-3">
                                <asp:Button class="btn btn-primary btn-lg" ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                <asp:Button class="btn btn-primary btn-lg" ID="btnClear" runat="server" Text="Clear" CausesValidation="False" OnClick="btnClear_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
