<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Sales.aspx.cs" Inherits="FarmerCooperative.Sales" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .bgColor {
            background: linear-gradient(to bottom right, #e8f4ea, #e0f0e3,  #d2e7d6, #c8e1cc, #b8d8be);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="page-section about-heading">
        <div class="card shadow-lg mb-4">
            <div class="card-header">
                <div class="d-flex justify-content-between">
                    <h3 class="font-weight-light my-2">&nbsp;</h3>                    
                    <asp:Label class="h2" ID="lblUserHeader" runat="server" Text="Sales"></asp:Label>
                    <asp:Button class="btn btn-close" ID="btnclose" runat="server" CausesValidation="False" OnClick="btnclose_Click" />
                </div>
                <p class="font-weight-light my-2">Status: 0 - Preparing : 1 - Received : 2 - Cancelled </p>
            </div>
            <div class="card-body">
                <asp:GridView CssClass="table container" ID="userView" runat="server" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">               
                    <Columns>                        
                        <asp:BoundField DataField="userID" HeaderText="User Id" SortExpression="userID" />
                        <asp:BoundField DataField="Fname" HeaderText="Firstname" SortExpression="Fname" />
                        <asp:BoundField DataField="Lname" HeaderText="Lastname" SortExpression="Lname" />                        
                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                        <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                        <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                        <asp:BoundField DataField="name" HeaderText="Product" SortExpression="name" />
                        <asp:BoundField DataField="quantity" HeaderText="Quantity" SortExpression="quantity" />
                        <asp:BoundField DataField="amount" HeaderText="Price" SortExpression="amount" />
                        <asp:BoundField DataField="TOTAL" HeaderText="Total" ReadOnly="True" SortExpression="TOTAL" />   
                        <asp:BoundField DataField="payment" HeaderText="payment" SortExpression="payment" />
                        <asp:BoundField DataField="dateofPurchase" HeaderText="dateofPurchase" SortExpression="dateofPurchase" />                     
                        <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT SALE.quantity, SALE.amount, SALE.payment, SALE.dateofPurchase, SALE.status, Users.userID, Users.Fname, Users.Lname, Users.Email, Users.Address, Users.Phone, PRODUCT.name, SALE.amount * SALE.quantity AS TOTAL FROM SALE LEFT OUTER JOIN Users ON Users.userID = SALE.buyerID LEFT OUTER JOIN PRODUCT ON SALE.productID = PRODUCT.Id WHERE (SALE.seller = @sellerId)">
                    <SelectParameters>
                        <asp:SessionParameter Name="sellerId" SessionField="userID" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </section>
</asp:Content>
