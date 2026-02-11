<%@ Page Title="Order Confirmation" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderConfirmation.aspx.cs" Inherits="PipeDreamsDev2.OrderConfirmation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container my-5">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="text-center mb-4">
                    <i class="fa fa-check-circle fa-5x text-success mb-3"></i>
                    <h1 class="display-4">Order Confirmed!</h1>
                    <p class="lead">Thank you for your purchase</p>
                </div>

                <div class="card mb-4">
                    <div class="card-header bg-success text-white">
                        <h5 class="mb-0"><i class="fa fa-info-circle"></i> Order Details</h5>
                    </div>
                    <div class="card-body">
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <strong>Order Number:</strong><br />
                                <asp:Label ID="lblOrderId" runat="server" CssClass="text-primary"></asp:Label>
                            </div>
                            <div class="col-md-6">
                                <strong>Order Date:</strong><br />
                                <asp:Label ID="lblOrderDate" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <strong>Customer:</strong><br />
                                <asp:Label ID="lblCustomerName" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-6">
                                <strong>Email:</strong><br />
                                <asp:Label ID="lblEmail" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="mb-3">
                            <strong>Shipping Address:</strong><br />
                            <asp:Label ID="lblShippingAddress" runat="server"></asp:Label>
                        </div>
                    </div>
                </div>

                <div class="card mb-4">
                    <div class="card-header bg-primary text-white">
                        <h5 class="mb-0"><i class="fa fa-list"></i> Order Items</h5>
                    </div>
                    <div class="card-body">
                        <asp:GridView ID="gvOrderItems" runat="server" CssClass="table table-striped" 
                            AutoGenerateColumns="false" ShowFooter="true" OnRowDataBound="gvOrderItems_RowDataBound">
                            <Columns>
                                <asp:BoundField DataField="ProductName" HeaderText="Product" />
                                <asp:BoundField DataField="Quantity" HeaderText="Quantity" ItemStyle-CssClass="text-center" />
                                <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:C}" ItemStyle-CssClass="text-end" />
                                <asp:BoundField DataField="TotalPrice" HeaderText="Total" DataFormatString="{0:C}" ItemStyle-CssClass="text-end" />
                            </Columns>
                        </asp:GridView>
                        
                        <div class="row mt-3">
                            <div class="col-md-6 offset-md-6">
                                <div class="d-flex justify-content-between mb-2">
                                    <span>Subtotal:</span>
                                    <strong><asp:Label ID="lblSubtotal" runat="server"></asp:Label></strong>
                                </div>
                                <div class="d-flex justify-content-between mb-2">
                                    <span>Tax:</span>
                                    <strong><asp:Label ID="lblTax" runat="server"></asp:Label></strong>
                                </div>
                                <div class="d-flex justify-content-between mb-2">
                                    <span>Shipping:</span>
                                    <strong><asp:Label ID="lblShipping" runat="server"></asp:Label></strong>
                                </div>
                                <hr />
                                <div class="d-flex justify-content-between">
                                    <h5>Total:</h5>
                                    <h5 class="text-success"><asp:Label ID="lblTotal" runat="server"></asp:Label></h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="alert alert-info">
                    <h5><i class="fa fa-info-circle"></i> What's Next?</h5>
                    <ul class="mb-0">
                        <li>A confirmation email has been sent to <strong><asp:Label ID="lblConfirmEmail" runat="server"></asp:Label></strong></li>
                        <li>Your order is being processed and will ship within 1-2 business days</li>
                        <li>You'll receive a tracking number once your order ships</li>
                    </ul>
                </div>

                <div class="text-center">
                    <a href="~/Default.aspx" runat="server" class="btn btn-primary btn-lg me-2">
                        <i class="fa fa-home"></i> Back to Home
                    </a>
                    <asp:Button ID="btnPrintOrder" runat="server" Text="Print Order" CssClass="btn btn-outline-secondary btn-lg" 
                        OnClientClick="window.print(); return false;" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>