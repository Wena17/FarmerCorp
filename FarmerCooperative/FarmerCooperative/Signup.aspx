﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="FarmerCooperative.Signup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="page-section about-heading">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6 mx-auto">
                    <div class="card shadow-lg border-0 rounded-lg mb-4">
                        <div class="card-header"><h3 class="text-center font-weight-light my-2">Sign up</h3></div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <div class="card-body">
                            <form runat="server">
                                <div class="form-row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="col-form-label" for="txtfname">Full Name</label>
                                            <asp:TextBox class="form-control py-4" ID="txtfname" runat="server" placeholder="First Name"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="col-form-label" for="txtlname">&nbsp;</label>
                                            <asp:TextBox class="form-control py-4" ID="txtlname" runat="server" placeholder="Last Name"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="col-form-label" for="txtPhoneNo">Phone Number</label>
                                            <asp:TextBox class="form-control py-4" ID="txtPhoneNo" runat="server" placeholder="9112256596" ></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="col-form-label" for="txtEmail">Email</label>
                                            <asp:TextBox class="form-control py-4" ID="txtEmail" runat="server" placeholder="sample@email.com"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="col-6">
                                        <div class="form-group">
                                            <label class="col-form-label" for="txtPassword">Password</label>
                                            <asp:TextBox class="form-control py-4" ID="txtPassword" runat="server" placeholder="•••••••••••••"  TextMode="Password"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="col-form-label" for="txtConfirmPass">Confirm Password</label>
                                            <asp:TextBox class="form-control py-4" ID="txtConfirmPass" runat="server" placeholder="•••••••••••••"  TextMode="Password"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                    <div class="row">
                                    <div class="col-md-5">
                                        <div class="form-group">
                                            <label for="ddlProvince">Province</label>
                                            <asp:RequiredFieldValidator ID="rqrProvince" runat="server" ErrorMessage="*" ControlToValidate="ddlProvince" ForeColor="Red" SetFocusOnError="True" InitialValue="Select"></asp:RequiredFieldValidator>
                                            <asp:DropDownList class="form-control" ID="ddlProvince" runat="server">
                                                <asp:ListItem Text="Select" Value="Select" />
                                                <asp:ListItem Text="Abra" Value="Abra" />
                                                <asp:ListItem Text="Agusan del Norte" Value="Agusan del Norte" />
                                                <asp:ListItem Text="Agusan del Sur" Value="Agusan del Sur" />
                                                <asp:ListItem Text="Aklan" Value="Aklan" />
                                                <asp:ListItem Text="Albay" Value="Albay" />
                                                <asp:ListItem Text="Antique" Value="Antique" />
                                                <asp:ListItem Text="Apayo" Value="Apayo" />
                                                <asp:ListItem Text="Aurora" Value="Aurora" />
                                                <asp:ListItem Text="Cebu" Value="Cebu" />
                                                <asp:ListItem Text="Eastern Samar" Value="Eastern Samar" />
                                                <asp:ListItem Text="Guimaras" Value="Guimaras" />
                                                <asp:ListItem Text="Ifugao" Value="Ifugao" />
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="txtCity">Municipality/City</label>
                                            <asp:RequiredFieldValidator ID="rqrCity" runat="server" ErrorMessage="*" ControlToValidate="txtCity" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            <asp:TextBox class="form-control" ID="txtCity" runat="server" placeholder="City" ></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="txtZipcode">Zipcode</label>
                                            <asp:RequiredFieldValidator ID="rqrZip" runat="server" ErrorMessage="*" ControlToValidate="txtZipcode" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            <asp:TextBox class="form-control" ID="txtZipcode" runat="server" placeholder="Zipcode"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>               
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <label for="txtAddress">Address</label>
                                            <asp:RequiredFieldValidator ID="rqrAddress" runat="server" ErrorMessage="*" ControlToValidate="txtAddress" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            <asp:TextBox class="form-control" ID="txtAddress" runat="server" placeholder="House #, Street, Barangay" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <hr />
                                    </div>
                                </div>
                                <div class="form-group d-flex justify-content-center  mt-3 mb-3">
                                    <a class="btn btn-primary btn-lg" id="btnRegister" href="#">Sign up</a>
                                </div>
                            </form>
                        </div>
                        <div class="card-footer text-center">
                            <div class="small"><a href="#">Already have an account?</a></div>
                        </div>
                    </div>
                </div>  
            </div>
        </div>
    </section>
</asp:Content>