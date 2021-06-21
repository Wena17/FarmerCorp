<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="FarmerCooperative.dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="page-section about-heading">
        <div class="card shadow-lg mb-4">
            <div class="card-header">
                <div class="d-flex justify-content-between">
                    <h3 class="font-weight-light my-2">&nbsp;</h3>                    
                    <asp:Label class="font-monospace font-weight-bold h4" ID="lblUserHeader" runat="server" Text="USERS"></asp:Label>
                    <asp:Button class="btn btn-close" ID="btnclose" runat="server" CausesValidation="False" OnClick="btnclose_Click" />
                </div>
            </div>
            <div class="card-body">
                <asp:GridView CssClass="table container" ID="userView" runat="server" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" AutoGenerateColumns="False" OnRowCommand="userView_RowCommand">               
                    <Columns>
                        <asp:BoundField DataField="userID" HeaderText="USERID" SortExpression="userID" />
                        <asp:BoundField DataField="fname" HeaderText="First Name" SortExpression="fname" />
                        <asp:BoundField DataField="lname" HeaderText="Last Name" SortExpression="lname" />
                        <asp:BoundField DataField="minitial" HeaderText="Middle Initial" SortExpression="mname" />
                        <asp:BoundField DataField="password" HeaderText="Password" ReadOnly="True" SortExpression="password" />
                        <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                        <asp:BoundField DataField="address" HeaderText="Address" SortExpression="address" />
                        <asp:BoundField DataField="phone" HeaderText="Phone Number" SortExpression="phonNo" />
                        <asp:BoundField DataField="role" HeaderText="Role" SortExpression="role" ItemStyle-HorizontalAlign="Center" />
                        <asp:BoundField DataField="approvalStatus" HeaderText="Approval Status" SortExpression="approvalStatus" ItemStyle-HorizontalAlign="Center" />
                        <asp:ButtonField ControlStyle-CssClass="btn btn-info" ButtonType="Button" CommandName="Approve" HeaderText="Approval" ShowHeader="True" Text="Approve" />
                        <asp:ButtonField ControlStyle-CssClass="btn btn-warning" ButtonType="Button" CommandName="Decline" HeaderText="Declined" ShowHeader="True" Text="Decline" />
                        <asp:ButtonField ControlStyle-CssClass="btn btn-danger" ButtonType="Button" CommandName="Delete" HeaderText="Delete" ShowHeader="True" Text="Delete" />
                    </Columns>
                
                    <FooterStyle BackColor="White" ForeColor="#333333" />
                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#487575" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#275353" />
                </asp:GridView>
            </div>
        </div>
    </section>
</asp:Content>
