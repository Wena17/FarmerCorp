<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AllProduct.aspx.cs" Inherits="FarmerCooperative.AllProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="page-section about-heading">
            <div class="container">
                <asp:Repeater ID="allProduct" runat="server" DataSourceID="productSource" EnableViewState="False" runat="server">
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" />
                    </ItemTemplate>
                </asp:Repeater>
                <asp:ObjectDataSource ID ="productSource" runat="server" > 

                </asp:ObjectDataSource>
    
            </div>
    </section>    
</asp:Content>
