<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AllProduct.aspx.cs" Inherits="FarmerCooperative.AllProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #bgColor {
            background: linear-gradient(to bottom right, #AAD9CD, #e0f0e3,  #d2e7d6, #c8e1cc, #b8d8be);
        }
        .card-img-size {
            width: 350px;
            height: 300px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="page-section about-heading">
        <div class="container">           
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [PRODUCT]"></asp:SqlDataSource>
        </div>
        <div class="row row-cols-1 row-cols-lg-4 row-cols-md-3 row-cols-sm-1">
                <asp:Repeater ID="allProductRepeater" runat="server" DataSourceID="SqlDataSource1" EnableViewState="False">
                    <ItemTemplate>
                            <div class="col mb-4">
                                <div class="card shadow-lg border-0 rounded-lg mb-4 text-center" id="bgColor">
                                    <div class="">
                                        <asp:Image CssClass="shadow-lg card-img-top p-2 card-img-size" ID="productImg" runat="server" ImageUrl='<%# Eval("imgPath") %>' />
                                    </div>
                                    <div class="card-body"> 
                                        <div class="card-title">
                                            <asp:Label ID="lblName" runat="server" Text='<%# Eval("name") %>' Font-Names="OPEN SANS" Font-Bold="True" Font-Size="XX-Large"></asp:Label>
                                        </div>
                                        <div class="card-text text-danger">
                                            <asp:Label ID="lbl4" runat="server" Text="₱ " Font-Italic="False" Font-Names="Kozuka Gothic Pr6N L" Font-Size="Medium"></asp:Label>
                                            <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("price") %>' Font-Names="Arvo" Font-Size="Large" Font-Bold="True"></asp:Label>
                                        </div>
                                        <div class="card-text">                                            
                                            <asp:Label ID="lbl5" runat="server" Text="Available Stock: " Font-Italic="False" Font-Names="Kozuka Gothic Pr6N L" Font-Size="Medium"></asp:Label>
                                            <asp:Label ID="lblQty" runat="server" Text='<%# Eval("quantity") %>' Font-Names="Arvo" Font-Size="Large" Font-Bold="True"></asp:Label>&nbsp;
                                            <asp:Label ID="lblUnit" runat="server" Text='<%# Eval("unit") %>' Font-Names="Arvo" Font-Size="Large" Font-Bold="True"></asp:Label>
                                        </div>
                                        <div class="card-text">
                                            <asp:Label ID="lbl2" runat="server" Text="Harvest Date: " Font-Italic="False" Font-Names="Kozuka Gothic Pr6N L" Font-Size="Medium"></asp:Label>
                                            <asp:Label ID="lblHDate" runat="server" Text='<%# Eval("harvestDate", "{0:d}") %>' Font-Names="Arvo" Font-Size="Large" Font-Bold="True"></asp:Label>
                                        </div>
                                        <div class="card-text">
                                            <asp:Label ID="lbl3" runat="server" Text="Expiry Date: " Font-Italic="False" Font-Names="Kozuka Gothic Pr6N L" Font-Size="Medium"></asp:Label>
                                            <asp:Label ID="lblEDate" runat="server" Text='<%# Eval("expiryDate", "{0:d}") %>' Font-Names="Arvo" Font-Size="Large" Font-Bold="True"></asp:Label>
                                        </div>
                                        <div class="card-text">
                                            <asp:Label ID="lbl6" runat="server" Text="Address: " Font-Italic="False" Font-Names="Kozuka Gothic Pr6N L" Font-Size="Medium"></asp:Label>
                                            <asp:Label ID="lblAdd" runat="server" Text='<%# Eval("location") %>' Font-Names="Arvo" Font-Size="Large" Font-Bold="True"></asp:Label>
                                        </div>
                                    </div>                                
                                    <div class="card-footer">
                                        <asp:Button CssClass="btn w3-block" ID="btnAddCart" runat="server" Text="Add to Cart" />
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>                                
                    
                </asp:Repeater>
    </div>
    </section>
</asp:Content>
