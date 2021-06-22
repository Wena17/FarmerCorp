<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SellersProduct.aspx.cs" Inherits="FarmerCooperative.SellersProducts" %>
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
                                <h3 class="text-left font-weight-light my-2">My Products</h3>   
                                  <asp:Button class="btn btn-close" ID="btnClose" runat="server" CausesValidation="False" />                              
                            </div>
                        </div>
               
                        <div class="card-body">
                            <asp:GridView CssClass=" shadow-lg table table-bordered" ID="productList" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" OnRowCommand="productList_RowCommand">

                                <Columns>
                                    <asp:BoundField DataField="Id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <div class="container-fluid">
                                                <div class="row">
                                                    <div class="col-lg-8">
                                                        <div class="row">
                                                            <div class="col-12">
                                                                <asp:Label ID="lblName" runat="server" Text='<%# Eval("name") %>' Font-Names="OPEN SANS" Font-Bold="True" Font-Size="XX-Large"></asp:Label>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-12">
                                                                <asp:Label ID="lbl" runat="server" Text="Category:" Font-Italic="False" Font-Names="Kozuka Gothic Pr6N L" Font-Size="Medium"></asp:Label>
                                                                <asp:Label ID="lblType" runat="server" Font-Bold="True" Text='<%# Eval("type") %>' Font-Names="Arvo" Font-Size="Large"></asp:Label>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-12">
                                                                <asp:Label ID="lbl2" runat="server" Text="Harvest Date: " Font-Italic="False" Font-Names="Kozuka Gothic Pr6N L" Font-Size="Medium"></asp:Label>
                                                                <asp:Label ID="lblHDate" runat="server" Text='<%# Eval("harvestDate", "{0:d}") %>' Font-Names="Arvo" Font-Size="Large" Font-Bold="True"></asp:Label>
                                                                &nbsp;&nbsp; | &nbsp;&nbsp;
                                                                <asp:Label ID="lbl3" runat="server" Text="Expiry Date: " Font-Italic="False" Font-Names="Kozuka Gothic Pr6N L" Font-Size="Medium"></asp:Label>
                                                                <asp:Label ID="lblEDate" runat="server" Text='<%# Eval("expiryDate", "{0:d}") %>' Font-Names="Arvo" Font-Size="Large" Font-Bold="True"></asp:Label>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-12">
                                                                <asp:Label ID="lbl4" runat="server" Text="Price: " Font-Italic="False" Font-Names="Kozuka Gothic Pr6N L" Font-Size="Medium"></asp:Label>
                                                                <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("price") %>' Font-Names="Arvo" Font-Size="Large" Font-Bold="True"></asp:Label>
                                                                &nbsp;&nbsp; | &nbsp;&nbsp;
                                                                <asp:Label ID="lbl5" runat="server" Text="Stock: " Font-Italic="False" Font-Names="Kozuka Gothic Pr6N L" Font-Size="Medium"></asp:Label>
                                                                <asp:Label ID="lblQty" runat="server" Text='<%# Eval("quantity") %>' Font-Names="Arvo" Font-Size="Large" Font-Bold="True"></asp:Label>&nbsp;
                                                                <asp:Label ID="lblUnit" runat="server" Text='<%# Eval("unit") %>' Font-Names="Arvo" Font-Size="Large" Font-Bold="True"></asp:Label>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-12">
                                                                <asp:Label ID="lbl6" runat="server" Text="Address: " Font-Italic="False" Font-Names="Kozuka Gothic Pr6N L" Font-Size="Medium"></asp:Label>
                                                                <asp:Label ID="lblAdd" runat="server" Text='<%# Eval("location") %>' Font-Names="Arvo" Font-Size="Large" Font-Bold="True"></asp:Label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <asp:Image CssClass="img-fluid p-2" ID="productImg" runat="server" ImageUrl='<%# Eval("imgPath") %>' />
                                                    </div>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:ButtonField ControlStyle-CssClass="btn btn-info" ButtonType="Button" CommandName="prodUpdate" ShowHeader="True" Text="Update" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center">
<ControlStyle CssClass="btn btn-info"></ControlStyle>

<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                    </asp:ButtonField>
                                    <asp:ButtonField ControlStyle-CssClass="btn btn-danger" ButtonType="Button" CommandName="prodDelete" ShowHeader="True" Text="Delete" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center">

<ControlStyle CssClass="btn btn-danger"></ControlStyle>

<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                    </asp:ButtonField>

                                </Columns>                                
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [PRODUCT]"></asp:SqlDataSource>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
    </section>
</asp:Content>
