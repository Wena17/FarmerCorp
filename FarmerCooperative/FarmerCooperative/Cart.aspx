<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="FarmerCooperative.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #bgColor {
            background: linear-gradient(to bottom right, #e8f4ea, #e0f0e3,  #d2e7d6, #c8e1cc, #b8d8be);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<section class="page-section about-heading">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-10">
                <div class="card shadow-lg border-0 rounded-lg mb-4" id="bgColor">
                <div class="card-header">
                    <div class="form-group d-flex justify-content-between">
                        <h3 class="text-left font-weight-light my-2">My Shopping Cart</h3>   
                            <asp:Button class="btn btn-close" ID="btnClose" runat="server" CausesValidation="False" OnClick="btnClose_Click"/>                              
                    </div>
                </div>
               
                <div class="card-body">
                    <label id="cartStatus" runat="server">Your Cart is Empty</label>
                    <asp:gridview CssClass="table shadow-lg" id="shoppingCart" runat="server" DataSourceID="ObjectDataSource1" AutoGenerateColumns="False" DataKeyNames="ProductId" >
                        <Columns>
                            <asp:CommandField ControlStyle-CssClass="btn btn-danger fas fa-trash-alt" ShowDeleteButton="True" DeleteText=" " >
<ControlStyle CssClass="btn btn-danger fas fa-trash-alt"></ControlStyle>
                            </asp:CommandField>
                            <asp:TemplateField>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" TextMode="Number" runat="server" Text='<%# Bind("Amount") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Amount") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="ProductName" ReadOnly="True" />
                            <asp:BoundField HeaderText="Price" DataField="Price" ReadOnly="True" />
                            <asp:BoundField HeaderText="Subtotal" DataField="Subtotal" ReadOnly="True" />
                            <asp:BoundField DataField="ProductId" Visible="False" readonly="False"/>
                        </Columns>
                    </asp:gridview>
                    <div class=" d-flex justify-content-end mr-2">
                        <asp:Button CssClass="btn btn-warning btn-lg" ID="btnCheckout" runat="server" Text="Checkout" />
                    </div>
                    <asp:objectdatasource id="ObjectDataSource1" runat="server" selectmethod="CartItems" SelectCountMethod="CartItemCount" DeleteMethod="RemoveItem" typename="FarmerCooperative.Cart" DataObjectTypeName="FarmerCooperative.CartItem" >
                        <deleteparameters>
                            <asp:parameter name="ProductId" type="Int32" />
                        </deleteparameters>
                    </asp:objectdatasource>
                </div>
                </div>
            </div>
        </div>
    </div>
</section> 
    
</asp:Content>