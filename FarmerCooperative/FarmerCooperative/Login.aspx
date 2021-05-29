<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FarmerCooperative.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="page-section about-heading">
        <div class="container">
            <div class="row justify-content-center">
            <div class="col-lg-5">
                <div class="card shadow-lg border-0 rounded-lg mb-4">
                    <div class="card-header"><h3 class="text-center font-weight-light my-2">Login</h3></div>
                    <div class="card-body">
                        <form runat="server">
                            <div class="form-group">
                                <label class="small mb-1" for="txtEmailAddress">Email</label>
                                <asp:TextBox class="form-control py-4" ID="txtEmailAddress" runat="server" placeholder="sample@sample.com" TextMode="Email"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label class="small mb-1" for="inputPassword">Password</label>
                                <asp:TextBox class="form-control py-4" ID="txtPassword" runat="server" placeholder="•••••••••••••"  TextMode="Password"></asp:TextBox>
                            </div>
                            <div class="form-group d-flex align-items-center justify-content-end mt-4 mb-0">
                                <asp:Button class="btn btn-primary" ID="btnLogin" runat="server" Text="Login" />
                            </div>
                        </form>
                    </div>
                    <div class="card-footer text-center">
                        <div class="small"><a href="signup.aspx">Need an account? Sign up!</a></div>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </section>
</asp:Content>
