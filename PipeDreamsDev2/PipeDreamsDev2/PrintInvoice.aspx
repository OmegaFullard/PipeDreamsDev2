<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintInvoice.aspx.cs" Inherits="PipeDreamsDev2.PrintInvoice" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Invoice</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <style>
        @media print {
            .no-print {
                display: none;
            }
        }
        body {
            background: white;
            padding: 20px;
        }
        .invoice-header {
            border-bottom: 3px solid #333;
            margin-bottom: 30px;
            padding-bottom: 20px;
        }
        .invoice-table th {
            background-color: #f8f9fa;
            border-bottom: 2px solid #dee2e6;
        }
        .total-section {
            background-color: #f8f9fa;
            padding: 15px;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <asp:Panel ID="pnlInvoiceNotFound" runat="server" Visible="false">
                <div class="alert alert-danger">
                    <h4>Invoice Not Found</h4>
                    <p>The order you are trying to print could not be found.</p>
                    <button type="button" class="btn btn-secondary no-print" onclick="window.close();">Close Window</button>
                </div>
            </asp:Panel>

            <asp:Panel ID="pnlInvoice" runat="server" Visible="false">
                <!-- Invoice Header -->
                <div class="invoice-header">
                    <div class="row">
                        <div class="col-md-6">
                            <h1>INVOICE</h1>
                            <p class="text-muted">PipeDreams Inc.</p>
                        </div>
                        <div class="col-md-6 text-end">
                            <h4>Order #<asp:Literal ID="litOrderId" runat="server"></asp:Literal></h4>
                            <p class="text-muted">Date: <asp:Literal ID="litOrderDate" runat="server"></asp:Literal></p>
                            <p>Status: <asp:Literal ID="litOrderStatus" runat="server"></asp:Literal></p>
                        </div>
                    </div>
                </div>

                <!-- Billing and Shipping Info -->
                <div class="row mb-4">
                    <div class="col-md-6">
                        <h5>Bill To:</h5>
                        <asp:Literal ID="litBillingAddress" runat="server"></asp:Literal>
                    </div>
                    <div class="col-md-6">
                        <h5>Ship To:</h5>
                        <asp:Literal ID="litShippingAddress" runat="server"></asp:Literal>
                    </div>
                </div>

                <!-- Order Items -->
                <h5 class="mb-3">Order Items</h5>
                <table class="table table-bordered invoice-table">
                    <thead>
                        <tr>
                            <th>Item</th>
                            <th>Description</th>
                            <th class="text-center">Quantity</th>
                            <th class="text-end">Unit Price</th>
                            <th class="text-end">Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rptInvoiceItems" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td><strong><%# Eval("ProductName") %></strong></td>
                                    <td><%# Eval("Description") %></td>
                                    <td class="text-center"><%# Eval("Quantity") %></td>
                                    <td class="text-end"><%# ((decimal)Eval("Price")).ToString("C") %></td>
                                    <td class="text-end"><%# (((decimal)Eval("Price")) * ((int)Eval("Quantity"))).ToString("C") %></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>

                <!-- Totals -->
                <div class="row mt-4">
                    <div class="col-md-6 offset-md-6">
                        <div class="total-section">
                            <div class="d-flex justify-content-between mb-2">
                                <span>Subtotal:</span>
                                <strong><asp:Literal ID="litSubtotal" runat="server"></asp:Literal></strong>
                            </div>
                            <div class="d-flex justify-content-between mb-2">
                                <span>Tax:</span>
                                <strong><asp:Literal ID="litTax" runat="server"></asp:Literal></strong>
                            </div>
                            <div class="d-flex justify-content-between mb-3">
                                <span>Shipping:</span>
                                <strong><asp:Literal ID="litShipping" runat="server"></asp:Literal></strong>
                            </div>
                            <hr />
                            <div class="d-flex justify-content-between">
                                <h5>Total:</h5>
                                <h5><asp:Literal ID="litTotal" runat="server"></asp:Literal></h5>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Payment Method -->
                <div class="row mt-4">
                    <div class="col-md-12">
                        <p><strong>Payment Method:</strong> <asp:Literal ID="litPaymentMethod" runat="server"></asp:Literal></p>
                    </div>
                </div>

                <!-- Print Button -->
                <div class="row mt-4 no-print">
                    <div class="col-md-12 text-center">
                        <button type="button" class="btn btn-primary" onclick="window.print();">
                            <i class="fa fa-print"></i> Print Invoice
                        </button>
                        <button type="button" class="btn btn-secondary ms-2" onclick="window.close();">
                            Close Window
                        </button>
                    </div>
                </div>

                <!-- Footer -->
                <div class="row mt-5 pt-4 border-top no-print">
                    <div class="col-md-12 text-center text-muted">
                        <small>Thank you for your business!</small>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </form>
</body>
</html>