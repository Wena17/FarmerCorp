<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CheckoutComplete.aspx.cs" Inherits="FarmerCooperative.CheckoutComplete" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="row justify-content-center">
            <div class="col-lg-5">
                <div class="card shadow-lg border-0 rounded-lg mb-4 bgColor">
                <div class="card-header">
                    <div class="form-group d-flex justify-content-between">
                        <h3 class="text-left font-weight-light my-2">Payment Complete</h3>   
                            <asp:Button class="btn btn-close" ID="Button1" runat="server" CausesValidation="False"/>                              
                    </div>
                </div>               
                <div class="card-body">
                    <div class="jumbotron">
                        Thank you for supporting local farmers!!
                    </div>
                </div>
                </div>
            </div>
        </div>
    
</asp:Content>
