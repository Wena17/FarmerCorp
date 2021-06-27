 <%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="FarmerCooperative.Homepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            font-size: large;
        }
        .auto-style2 {
            font-size: large;
            margin-bottom: 1rem;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<section class="page-section clearfix">
        <div class="container">
            <div class="intro">
                <img class="intro-img img-fluid mb-3 mb-lg-0 rounded" src="imgs/freshly-harvested.jpg" alt="..." />
                <div class="intro-text left-0 text-center bg-faded p-5 rounded">
                    <h2 class="section-heading mb-4">
                        <span class="section-heading-upper">FRESH PRODUCE</span>
                        <span class="section-heading-lower"> Locally Grown Food</span>
                    </h2>
                    <p class="mb-3">Harnessing the full potential of the local farmers to ensure food security, achieve environmental sustainability, and drive economic opportunity. <br /><span class="auto-style1">BY BUYING THROUGH US <br /> YOU ARE SUPPORTING  <br /> <strong>Locally Grown Foods from our Local Farmers </strong> </span> </p>
                    <div class="intro-button mx-auto"><a class="btn btn-primary btn-xl" href="Product.aspx">Shop Now!</a></div>
                </div>
            </div>
        </div>
</section>
<section class="page-section cta">
        <div class="container">
            <div class="row">
                <div class="col-xl-9 mx-auto">
                    <div class="cta-inner bg-faded text-center rounded">
                        <h2 class="section-heading mb-4">
                            <span class="section-heading-upper"></span>
                            <span class="section-heading-lower">FARMER COOPERATIVE'S PLATFORM</span>
                        </h2>
                        <p class="mb-0">Farmer Cooperative’s Platform believes that everyone should have reliable access to nutritious food. We connect people in the city to fresh food and high-quality local goods that support communities and farmers. We are a local social enterprise that promotes a more conscious way of producing, purchasing and consuming. We also advocate local agriculture, social entrepreneurship, people empowerment and environmentalism. </p>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
