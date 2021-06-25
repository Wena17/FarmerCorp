<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="FarmerCooperative.Product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="page-section">
            <div class="container">
                <div class="product-item">
                    <div class="product-item-title d-flex">
                        <div class="bg-faded p-5 d-flex ms-auto rounded">
                            <h2 class="section-heading mb-0 text-center">
                                <span class="section-heading-upper">Fresh fruit, stay cool</span> 
                                <asp:Button CssClass="section-heading-lower" ID="btnFruits" runat="server" Text="FRUITS" OnClick="btnCategory_Click" CommandArgument="fruit" />
                            </h2>
                        </div>
                    </div>
                    <div class="img-container">
                        <asp:ImageButton CssClass=" product-item-img mx-auto d-flex rounded mb-3 mb-lg-0" ID="btnImgFruit" runat="server" CommandArgument="fruit" OnClick="imgbtnCategory_Click" ImageUrl="~/imgs/fruits.jpg" />
                    </div>
                    <div class="product-item-description d-flex me-auto">
                        <div class="bg-faded p-5 rounded"><p class="mb-0"> Fruits provide a wide range of health-boosting antioxidants, including flavonoids. Eating a diet high in fruits and vegetables can reduce a person's risk of developing heart disease, cancer, inflammation, and diabetes. </p></div>
                    </div>
                </div>
            </div>
        </section>
        <section class="page-section">
            <div class="container">
                <div class="product-item">
                    <div class="product-item-title d-flex">
                        <div class="bg-faded p-5 d-flex me-auto rounded">
                            <h2 class="section-heading mb-0 text-center">
                                <span class="section-heading-upper">Lose the strain, gain the grain!</span>
                                <asp:Button CssClass="section-heading-lower" ID="btnGrain" runat="server" Text="Grain" OnClick="btnCategory_Click" CommandArgument="grain" />
                            </h2>
                        </div>
                    </div>
                    <asp:ImageButton CssClass="product-item-img mx-auto d-flex rounded mb-3 mb-lg-0" ID="btnGrainImg" runat="server" CommandArgument="grain" OnClick="imgbtnCategory_Click" ImageUrl="~/imgs/grains.jpg" />
                    <div class="product-item-description d-flex ms-auto">
                        <div class="bg-faded p-5 rounded"><p class="mb-0">Grains are important sources of many nutrients, including fiber, B vitamins (thiamin, riboflavin, niacin and folate) and minerals (iron, magnesium and selenium).</p></div>
                    </div>
                </div>
            </div>
        </section>
        <section class="page-section">
        <div class="container">
            <div class="product-item">
                <div class="product-item-title d-flex">
                    <div class="bg-faded p-5 d-flex ms-auto rounded">
                        <h2 class="section-heading mb-0 text-center">
                            <span class="section-heading-upper">Eat veggies, stay healthy</span>
                            <asp:Button CssClass="section-heading-lower" ID="btnVege" runat="server" Text="VEGETABLES" OnClick="btnCategory_Click" CommandArgument="vegetable" />
                        </h2>
                    </div>
                </div>
                <asp:ImageButton CssClass="product-item-img mx-auto d-flex rounded mb-3 mb-lg-0" ID="btnVegeImg" runat="server" CommandArgument="vegetable" OnClick="imgbtnCategory_Click" ImageUrl="~/imgs/Veggies.jpg" />
                <div class="product-item-description d-flex me-auto">
                    <div class="bg-faded p-5 rounded"><p class="mb-0">Eating vegetables provides health benefits — people who eat more vegetables and fruits as part of an overall healthy diet are likely to have a reduced risk of some chronic diseases. Vegetables provide nutrients vital for health and maintenance of your body.</p></div>
                </div>
            </div>
        </div>
        </section>
        <section class="page-section">
            <div class="container">
                <div class="product-item">
                    <div class="product-item-title d-flex">
                        <div class="bg-faded p-5 d-flex me-auto rounded">
                            <h2 class="section-heading mb-0 text-center">
                                <span class="section-heading-upper">No Ifs or Buts, Our Deals Are Nuts!</span>
                                <asp:Button CssClass="section-heading-lower" ID="btnNut" runat="server" Text="Nuts" OnClick="btnCategory_Click" CommandArgument="nut" />
                            </h2>
                        </div>
                    </div>
                    <asp:ImageButton CssClass="product-item-img mx-auto d-flex rounded mb-3 mb-lg-0" ID="btnNutImg" runat="server" CommandArgument="nut" OnClick="imgbtnCategory_Click" ImageUrl="imgs/Nuts.jpg" />
                    <div class="product-item-description d-flex ms-auto">
                        <div class="bg-faded p-5 rounded"><p class="mb-0">Nuts are a good source of healthful fats, fiber, and other beneficial nutrients. Each type of nut offers different nutritional benefits.</p></div>
                    </div>
                </div>
            </div>
        </section>
        <section class="page-section">
        <div class="container">
            <div class="product-item">
                <div class="product-item-title d-flex">
                    <div class="bg-faded p-5 d-flex ms-auto rounded">
                        <h2 class="section-heading mb-0 text-center">
                            <span class="section-heading-upper">Well rooted</span>
                            <asp:Button CssClass="section-heading-lower" ID="btnCrop" runat="server" Text="Root Crops" OnClick="btnCategory_Click" CommandArgument="root crop" />
                        </h2>
                    </div>
                </div>
                <asp:ImageButton CssClass="product-item-img mx-auto d-flex rounded mb-3 mb-lg-0" ID="btnCropImg" runat="server" CommandArgument="root crop" OnClick="imgbtnCategory_Click" ImageUrl="imgs/rootcrops.jpg" />
                <div class="product-item-description d-flex me-auto">
                    <div class="bg-faded p-5 rounded"><p class="mb-0">Root crops are good sources of dietary fiber and fermentable in the colon. The soluble fiber in root crops may have a physiological effect related to glucose and cholesterol metabolism.</p></div>
                </div>
            </div>
        </div>
    </section>           
        <section class="page-section">
            <div class="container">
                <div class="product-item">
                    <div class="product-item-title d-flex">
                        <div class="bg-faded p-5 d-flex me-auto rounded">
                            <h2 class="section-heading mb-0 text-center">
                                <span class="section-heading-upper">Beans, beans, the magic legumes </span><span class="section-heading-upper">- the more you ingest, </span><span class="section-heading-upper">the more you consume.</span>
                                <asp:Button CssClass="section-heading-lower" ID="btnLegume" runat="server" Text="Legumes | Beans" OnClick="btnCategory_Click" CommandArgument="legume" />
                            </h2>
                        </div>
                    </div>
                    <asp:ImageButton CssClass="product-item-img mx-auto d-flex rounded mb-3 mb-lg-0" ID="btnLegumeImg" runat="server" CommandArgument="legume" OnClick="imgbtnCategory_Click" ImageUrl="imgs/beans.jpg" />
                    <div class="product-item-description d-flex ms-auto">
                        <div class="bg-faded p-5 rounded"><p class="mb-0">Legumes are naturally low in fat, are practically free of saturated fat, and because they are plant foods, they are cholesterol free as well.</p></div>
                    </div>
                </div>
            </div>
        </section>
</asp:Content>
