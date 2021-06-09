<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SellersProducts.aspx.cs" Inherits="FarmerCooperative.SellersProducts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-left: 20px;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<section class="page-section about-heading">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-15">
                        <div class="card shadow-lg border-0 rounded-lg mb-4">
                        <div class="card-header">
                            <div class="form-group d-flex justify-content-between">
                                <h3 class="text-left font-weight-light my-2">My Products</h3>   
                                  <asp:Button class="btn btn-close" ID="btnClose" runat="server" CausesValidation="False" />                              
                            </div>
                        </div>
               
                        <div class="card-body">
                            <asp:GridView ID="ProductList" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CssClass="auto-style1" Height="230px" Width="871px" CellSpacing="2">
                                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                                <SortedDescendingHeaderStyle BackColor="#93451F" />
                            </asp:GridView>
                        </div>
                        <div class="card-footer text-center">
                            <div class="form-group d-flex align-items-center justify-content-evenly mt-3 mb-3">
                                <asp:Button class="btn btn-primary btn-lg" ID="Button1" runat="server" Text="Search" OnClick="btnSearch_Click" />
                                <asp:Button class="btn btn-primary btn-lg" ID="btnDelete" runat="server" Text="Delete Product" CausesValidation="False" OnClick="btnDelete_Click" />
                            </div>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
    </section>
</asp:Content>
