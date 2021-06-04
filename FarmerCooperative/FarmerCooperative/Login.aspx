<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FarmerCooperative.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="page-section about-heading">
        <div class="container">
            <div class="row justify-content-center">
            <div class="col-lg-5">
                <div class="card shadow-lg border-0 rounded-lg mb-4">
                    <div class="card-header">
                        <div class="form-group d-flex justify-content-between">
                            <h3 class="text-center font-weight-light my-2">&nbsp;</h3>  
                            <h3 class="font-weight-light my-2">Login</h3>  
                            <asp:Button class="btn btn-close" ID="btnclose" runat="server" CausesValidation="False" OnClick="btnclose_Click" />
                        </div>
                    </div>
                    <div class="card-body">
                            <div class="form-group">
                                <label class="small mb-1" for="txtUserID">User ID</label>
                                <asp:TextBox class="form-control py-4" ID="txtUserID" runat="server" placeholder="sample0223"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label class="small mb-1" for="inputPassword">Password</label>
                                <asp:TextBox class="form-control py-4" ID="txtPassword" runat="server" placeholder="•••••••••••••"  TextMode="Password"></asp:TextBox>
                            </div>
                            <div class="form-group d-flex align-items-center justify-content-end mt-4 mb-0">
                                <asp:Button class="btn btn-primary" ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
                            </div>
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
