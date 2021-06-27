<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="FarmerCooperative.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="page-section about-heading">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-10">
                <div class="card shadow-lg border-0 rounded-lg mb-4 bgColor">
                    <div class="card-header">                    
                        <h3 class="text-left font-weight-light my-2">Profile</h3>
                        <div class="form-group d-flex justify-content-end">   
                            <asp:Button class="btn btn-close" ID="btnClose" runat="server" CausesValidation="False"/>                              
                        </div>
                    </div>               
                    <div class="card-body">                        
                        <asp:Repeater ID="statView" runat="server">
                    <ItemTemplate>
                            <div class="col mb-4">
                                <div class="card shadow-lg border-0 rounded-lg mb-4" id="bgColor">
                                    <div class="">
                                        <asp:Image CssClass="img-thumbnail" ID="productImg" runat="server" ImageUrl="~/imgs/generaluser.png" />
                                    </div>
                                    <div class="card-body"> 
                                        <div class="card-title text-center">
                                            <asp:Label runat="server" Text='<%# Eval("ApprovalStatus") %>' Font-Names="OPEN SANS" Font-Bold="True" Font-Size="XX-Large"></asp:Label>
                                        </div>
                                        <div class="card-text ml-5">                                            
                                            <asp:Label CssClass="text-muted" ID="lbl5" runat="server" Text="Available Stock: " Font-Italic="False" Font-Names="Kozuka Gothic Pr6N L" Font-Size="Medium"></asp:Label>
                                            <asp:Label ID="lblQty" runat="server" Text='<%# Eval("Fname") %>' Font-Names="Arvo" Font-Size="Large" Font-Bold="True"></asp:Label>&nbsp;
                                            <asp:Label ID="lblUnit" runat="server" Text='<%# Eval("Lname") %>' Font-Names="Arvo" Font-Size="Large" Font-Bold="True"></asp:Label>
                                        </div>
                                        <div class="card-text ml-5">
                                            <asp:Label CssClass="text-muted" ID="lbl2" runat="server" Text="Harvest Date: " Font-Italic="False" Font-Names="Kozuka Gothic Pr6N L" Font-Size="Medium"></asp:Label>
                                            <asp:Label ID="lblHDate" runat="server" Text='<%# Eval("Email") %>' Font-Names="Arvo" Font-Size="Large" Font-Bold="True"></asp:Label>
                                        </div>
                                        <div class="card-text ml-5">
                                            <asp:Label CssClass="text-muted" ID="lbl3" runat="server" Text="Expiry Date: " Font-Italic="False" Font-Names="Kozuka Gothic Pr6N L" Font-Size="Medium"></asp:Label>
                                            <asp:Label ID="lblEDate" runat="server" Text='<%# Eval("Address") %>' Font-Names="Arvo" Font-Size="Large" Font-Bold="True"></asp:Label>
                                        </div>
                                        <div class="card-text ml-5">
                                            <asp:Label CssClass="text-muted" ID="lbl6" runat="server" Text="Address: " Font-Italic="False" Font-Names="Kozuka Gothic Pr6N L" Font-Size="Medium"></asp:Label>
                                            <asp:Label ID="lblAdd" runat="server" Text='<%# Eval("Phone") %>' Font-Names="Arvo" Font-Size="Large" Font-Bold="True"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>        
    </div>
</section>
</asp:Content>
