<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AllProduct.aspx.cs" Inherits="FarmerCooperative.AllProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #bgColor {
            background: linear-gradient(to bottom right, #AAD9CD, #e0f0e3, #d2e7d6, #c8e1cc, #b8d8be);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="page-section about-heading">
        <div class="container">
            <div class="row breadcrumb d-flex justify-content-end pt-3 pb-3 mb-5">               
                <div class="col-3">
                    <li class="nav-item dropdown">                        
                        <asp:LinkButton class="nav-link text-black-50 dropdown-toggle" ID="btnSort" runat="server" role="button" data-toggle="dropdown" aria-expanded="false" CausesValidation="False">Sort by</asp:LinkButton>
                        <ul class="dropdown-menu" aria-labelledby="btnSort">
                            <li><asp:Button class="dropdown-item" ID="btnPricelh" runat="server" CommandArgument="lh" Text="Price (low to high)" OnClick="sort_Click"/></li>
                            <li><asp:Button class="dropdown-item" ID="btnPricehl" runat="server" CommandArgument="hl"  Text="Price (high to low)" OnClick="sort_Click"/></li>
                            <li><hr class="dropdown-divider" /></li>
                            <li><asp:Button class="dropdown-item" ID="btnNameasc" CommandArgument="asc" runat="server" Text="Name A-Z" OnClick="sort_Click"/></li>
                            <li><asp:Button class="dropdown-item" ID="btnNamedesc" CommandArgument="desc" runat="server" Text="Name Z-A" OnClick="sort_Click"/></li>
                            <li><hr class="dropdown-divider" /></li>
                            <li><asp:Button class="dropdown-item" ID="btnAll" runat="server" Text="All" OnClick="sort_Click"/></li>
                        </ul>                            
                    </li>
                </div>
            </div>
            <div class="row row-cols-1 row-cols-lg-4 row-cols-md-3 row-cols-sm-1">
                <asp:Repeater ID="allProductRepeater" runat="server" DataSourceID="SqlDataSource1" EnableViewState="True" OnItemCommand="allProductRepeater_ItemCommand">
                    <ItemTemplate>
                            <div class="col mb-4">
                                <div class="card shadow-lg border-0 rounded-lg mb-4" id="bgColor">
                                    <div class="">
                                        <asp:Image CssClass="shadow-lg card-img-top p-2 responsive" ID="productImg" runat="server" ImageUrl='<%# Eval("imgPath") %>' />
                                    </div>
                                    <div class="card-body"> 
                                        <div class="card-title text-center">
                                            <asp:Label runat="server" Text='<%# Eval("name") %>' Font-Names="OPEN SANS" Font-Bold="True" Font-Size="XX-Large"></asp:Label>
                                        </div>
                                        <div class="card-text text-danger text-center">
                                            <asp:Label ID="lbl4" runat="server" Text="₱ " Font-Italic="False" Font-Names="Kozuka Gothic Pr6N L" Font-Size="Medium"></asp:Label>
                                            <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("price") %>' Font-Names="Arvo" Font-Size="Large" Font-Bold="True"></asp:Label>
                                        </div>
                                        <hr />
                                        <div class="card-text ml-5">                                            
                                            <asp:Label CssClass="text-muted" ID="lbl5" runat="server" Text="Available Stock: " Font-Italic="False" Font-Names="Kozuka Gothic Pr6N L" Font-Size="Medium"></asp:Label>
                                            <asp:Label ID="lblQty" runat="server" Text='<%# Eval("quantity") %>' Font-Names="Arvo" Font-Size="Large" Font-Bold="True"></asp:Label>&nbsp;
                                            <asp:Label ID="lblUnit" runat="server" Text='<%# Eval("unit") %>' Font-Names="Arvo" Font-Size="Large" Font-Bold="True"></asp:Label>
                                        </div>
                                        <div class="card-text ml-5">
                                            <asp:Label CssClass="text-muted" ID="lbl2" runat="server" Text="Harvest Date: " Font-Italic="False" Font-Names="Kozuka Gothic Pr6N L" Font-Size="Medium"></asp:Label>
                                            <asp:Label ID="lblHDate" runat="server" Text='<%# Eval("harvestDate", "{0:d}") %>' Font-Names="Arvo" Font-Size="Large" Font-Bold="True"></asp:Label>
                                        </div>
                                        <div class="card-text ml-5">
                                            <asp:Label CssClass="text-muted" ID="lbl3" runat="server" Text="Expiry Date: " Font-Italic="False" Font-Names="Kozuka Gothic Pr6N L" Font-Size="Medium"></asp:Label>
                                            <asp:Label ID="lblEDate" runat="server" Text='<%# Eval("expiryDate", "{0:d}") %>' Font-Names="Arvo" Font-Size="Large" Font-Bold="True"></asp:Label>
                                        </div>
                                        <div class="card-text ml-5">
                                            <asp:Label CssClass="text-muted" ID="lbl6" runat="server" Text="Address: " Font-Italic="False" Font-Names="Kozuka Gothic Pr6N L" Font-Size="Medium"></asp:Label>
                                            <asp:Label ID="lblAdd" runat="server" Text='<%# Eval("location") %>' Font-Names="Arvo" Font-Size="Large" Font-Bold="True"></asp:Label>
                                        </div>
                                    </div>                                
                                    <div class="card-footer">
                                        <asp:Button CssClass="btn w3-block text-to-bottom" ID="btnAddCart" runat="server" Text="Add to Cart"  UseSubmitBehavior="False" CommandName="AddCart" CommandArgument='<%# Eval("Id") %>' />
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                </asp:Repeater>
            </div>        
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM PRODUCT INNER JOIN TYPE ON PRODUCT.TYPE=TYPE.ID WHERE UPPER(TYPE.NAME) = UPPER(@cat_name)">
                <SelectParameters>
                    <asp:SessionParameter Name="cat_name" SessionField="category" DefaultValue="" />
                </SelectParameters>
            </asp:SqlDataSource>        
        </div>
    </section>
</asp:Content>
