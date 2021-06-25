<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="FarmerCooperative.Signup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="page-section about-heading">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6 mx-auto">
                    <div class="card shadow-lg border-0 rounded-lg mb-4">
                        <div class="card-header" id="signupHeader" runat="server">
                            <div class="form-group d-flex justify-content-between">
                                <h3 class="text-center font-weight-light my-2">&nbsp;</h3>  
                                <h3 class="font-weight-light my-2">Sign up</h3>  
                                <asp:Button class="btn btn-close" ID="btnclose" runat="server" CausesValidation="False" OnClick="btnclose_Click" />
                            </div>
                        </div>
                        <div class="card-header" id="chooseHeader" runat="server">
                            <div class="form-group d-flex justify-content-between">
                                <h3 class="text-center font-weight-light my-2">&nbsp;</h3>  
                                <h3 class="font-weight-light my-2">Which one are you?</h3>  
                                <asp:Button class="btn btn-close" ID="btnChooseClose" runat="server" CausesValidation="False" OnClick="btnChooseClose_Click" />
                            </div>
                        </div>
                        <div class="card-body" id="choose" runat="server">
                            <div class="form-group d-flex justify-content-around  mt-3 mb-3">
                                <asp:Button class="btn btn-secondary btn-lg" ID="btnSeller" runat="server" Text="Seller" OnClick="btnSeller_Click" />
                                <asp:Button class="btn btn-info btn-lg" ID="btnBuyer" runat="server" Text="Buyer" OnClick="btnBuyer_Click" />
                                <asp:Button class="btn btn-primary btn-lg" ID="btnBothSB" runat="server" Text="Both Buyer & Seller" OnClick="btnBothSB_Click" />
                            </div>
                        </div>
                        <div class="card-body" id="fillIn" runat="server">
                                <div class="form-row">
                                    <div class="col-md-5">
                                        <div class="form-group">
                                            <label class="col-form-label" for="txtfname">Full Name</label>
                                            <asp:TextBox class="form-control py-4" ID="txtfname" runat="server" placeholder="First Name"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-5">
                                        <div class="form-group">
                                            <label class="col-form-label" for="txtlname">&nbsp;</label>
                                            <asp:TextBox class="form-control py-4" ID="txtlname" runat="server" placeholder="Last Name"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label class="col-form-label" for="txtMname">&nbsp;</label>
                                            <asp:TextBox class="form-control py-4" ID="txtMname" runat="server" placeholder="M.I"></asp:TextBox>
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
                                            <asp:CompareValidator runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPass" ErrorMessage="Incorrect password" SetFocusOnError="True" ForeColor="Red"></asp:CompareValidator>
                                            <asp:TextBox class="form-control py-4" ID="txtConfirmPass" runat="server" placeholder="•••••••••••••"  TextMode="Password"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                    <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="ddlCity">Municipality/City</label>
                                            <asp:RequiredFieldValidator ID="rqrProvince" runat="server" ErrorMessage="*" ControlToValidate="ddlCity" ForeColor="Red" SetFocusOnError="True" InitialValue="Select"></asp:RequiredFieldValidator>
                                            <asp:DropDownList CssClass="form-control" ID="ddlCity" runat="server">
                                                <asp:ListItem Text="City" Value="Select" />
                                                <asp:ListItem Text="Alcantara" Value="Alcantara" />
                                                <asp:ListItem Text="Alcoy" Value="Alcoy" />
                                                <asp:ListItem Text="Alegria" Value="Alegria" />
                                                <asp:ListItem Text="Aloguinsan" Value="Aloguinsan" />
                                                <asp:ListItem Text="Argao" Value="Argao" />
                                                <asp:ListItem Text="Asturias" Value="Asturias" />
                                                <asp:ListItem Text="Badian" Value="Badian" />
                                                <asp:ListItem Text="Balamban" Value="Balamban" />
                                                <asp:ListItem Text="Bantayan" Value="Bantayan" />
                                                <asp:ListItem Text="Barili" Value="Barili" />
                                                <asp:ListItem Text="Bogo City" Value="Bogo City" />
                                                <asp:ListItem Text="Boljoon" Value="Boljoon" />
                                                <asp:ListItem Text="Borbon" Value="Borbon" />
                                                <asp:ListItem Text="Carcar City" Value="Carcar City" />
                                                <asp:ListItem Text="Carmen" Value="Carmen" />
                                                <asp:ListItem Text="Catmon" Value="Catmon" />
                                                <asp:ListItem Text="Cebu City" Value="Cebu City" />
                                                <asp:ListItem Text="Compostela" Value="Compostela" />
                                                <asp:ListItem Text="Consolacion" Value="Consolacion" />
                                                <asp:ListItem Text="Cordova" Value="Cordova" />
                                                <asp:ListItem Text="Daanbatayan" Value="Daanbatayan" />
                                                <asp:ListItem Text="Dalaguete" Value="Dalaguete" />
                                                <asp:ListItem Text="Danao City" Value="Danao City" />
                                                <asp:ListItem Text="Dumanjug" Value="Dumanjug" />
                                                <asp:ListItem Text="Ginatilan" Value="Ginatilan" />
                                                <asp:ListItem Text="Liloan" Value="Liloan" />
                                                <asp:ListItem Text="Lapu-lapu City" Value="Lapu-lapu City" />
                                                <asp:ListItem Text="Madridejos" Value="Madridejos" />
                                                <asp:ListItem Text="Malabuyoc" Value="Malabuyoc" />
                                                <asp:ListItem Text="Mandaue City" Value="Mandaue City" />
                                                <asp:ListItem Text="Medellin" Value="Medellin" />
                                                <asp:ListItem Text="Minglanilla" Value="Minglanilla" />
                                                <asp:ListItem Text="Moalboal" Value="Moalboal" />
                                                <asp:ListItem Text="Oslob" Value="Oslob" />
                                                <asp:ListItem Text="Pilar" Value="Pilar" />
                                                <asp:ListItem Text="Pinamungajan" Value="Pinamungajan" />
                                                <asp:ListItem Text="Poro" Value="Poro" />
                                                <asp:ListItem Text="Ronda" Value="Ronda" />
                                                <asp:ListItem Text="Samboan" Value="Samboan" />
                                                <asp:ListItem Text="San Fernando" Value="San Fernando" />
                                                <asp:ListItem Text="San Francisco" Value="San Francisco" />
                                                <asp:ListItem Text="San Remegio" Value="San Remegio" />
                                                <asp:ListItem Text="Santa Fe" Value="Santa Fe" />
                                                <asp:ListItem Text="Santander" Value="Santander" />
                                                <asp:ListItem Text="Sibonga" Value="Sibonga" />
                                                <asp:ListItem Text="Sogod" Value="Sogod" />
                                                <asp:ListItem Text="Tabogon" Value="Tabogon" />
                                                <asp:ListItem Text="Tabuelan" Value="Tabuelan" />
                                                <asp:ListItem Text="Talisay City" Value="Talisay City" />
                                                <asp:ListItem Text="Toledo City" Value="Toledo City" />
                                                <asp:ListItem Text="Tuburan" Value="Tuburan" />
                                                <asp:ListItem Text="Tudela" Value="Tudela" />
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="txtbrgy">Barangay</label>
                                            <asp:RequiredFieldValidator ID="rqrZip" runat="server" ErrorMessage="*" ControlToValidate="txtbrgy" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            <asp:TextBox class="form-control" ID="txtbrgy" runat="server" placeholder="Barangay"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="txtAddress">Address</label>
                                    <asp:RequiredFieldValidator ID="rqrAddress" runat="server" ErrorMessage="*" ControlToValidate="txtAddress" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    <asp:TextBox class="form-control" ID="txtAddress" runat="server" placeholder="House #, Street" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <hr />
                                    </div>
                                </div>
                                <div class="form-group d-flex justify-content-center  mt-3 mb-3">
                                    <asp:Button class="btn btn-primary btn-lg" ID="btnRegister" runat="server" Text="Sign up" OnClick="btnRegister_Click" />
                                </div>
                        </div>
                        <div class="card-footer text-center" id="fillFooter" runat="server">
                            <div class="small"><a href="login.aspx">Already have an account?</a></div>
                        </div>
                    </div>
                </div>  
            </div>
        </div>
    </section>
</asp:Content>
