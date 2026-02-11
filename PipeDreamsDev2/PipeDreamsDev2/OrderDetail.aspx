<%@ Page Title="Order Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderDetail.aspx.cs" Inherits="PipeDreamsDev2.OrderDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container my-5">
        <div class="row">
            <div class="col-lg-12">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h1 class="display-4">
                        <i class="fa fa-file-text-o"></i> Order Details
                    </h1>
                    <a href="OrderHistory.aspx" class="btn btn-outline-primary">
                        <i class="fa fa-arrow-left"></i> Back to Orders
                    </a>
                </div>

                <!-- Order Status Timeline -->
                <div class="card mb-4">
                    <div class="card-header bg-primary text-white">
                        <h5 class="mb-0"><i class="fa fa-clock-o"></i> Order Status</h5>
                    </div>
                    <div class="card-body">
                        <div class="order-timeline">
                            <asp:Panel ID="pnlStepPlaced" runat="server" CssClass="timeline-step">
                                <div class="timeline-icon"><i class="fa fa-check"></i></div>
                                <div class="timeline-content">
                                    <h6>Order Placed</h6>
                                    <small><asp:Label ID="lblOrderPlacedDate" runat="server"></asp:Label></small>
                                </div>
                            </asp:Panel>
                            <asp:Panel ID="pnlStepProcessing" runat="server" CssClass="timeline-step">
                                <div class="timeline-icon"><i class="fa fa-cog"></i></div>
                                <div class="timeline-content">
                                    <h6>Processing</h6>
                                    <small><asp:Label ID="lblProcessingDate" runat="server"></asp:Label></small>
                                </div>
                            </asp:Panel>
                            <asp:Panel ID="pnlStepShipped" runat="server" CssClass="timeline-step">
                                <div class="timeline-icon"><i class="fa fa-truck"></i></div>
                                <div class="timeline-content">
                                    <h6>Shipped</h6>
                                    <small><asp:Label ID="lblShippedDate" runat="server"></asp:Label></small>
                                </div>
                            </asp:Panel>
                            <asp:Panel ID="pnlStepDelivered" runat="server" CssClass="timeline-step">
                                <div class="timeline-icon"><i class="fa fa-check-circle"></i></div>
                                <div class="timeline-content">
                                    <h6>Delivered</h6>
                                    <small><asp:Label ID="lblDeliveredDate" runat="server"></asp:Label></small>
                                </div>
                            </asp:Panel>
                        </div>
                        
                        <asp:Panel ID="pnlTrackingInfo" runat="server" Visible="false" CssClass="mt-4 alert alert-info">
                            <strong><i class="fa fa-truck"></i> Tracking Number:</strong> 
                            <asp:Label ID="lblTrackingNumber" runat="server"></asp:Label>
                            <a href="#" class="btn btn-sm btn-primary ms-3">Track Package</a>
                        </asp:Panel>
                    </div>
                </div>

                <div class="row">
                    <!-- Order Information -->
                    <div class="col-md-6">
                        <div class="card mb-4">
                            <div class="card-header bg-info text-white">
                                <h5 class="mb-0"><i class="fa fa-info-circle"></i> Order Information</h5>
                            </div>
                            <div class="card-body">
                                <table class="table table-borderless mb-0">
                                    <tr>
                                        <td><strong>Order Number:</strong></td>
                                        <td><asp:Label ID="lblOrderId" runat="server" CssClass="text-primary"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td><strong>Order Date:</strong></td>
                                        <td><asp:Label ID="lblOrderDate" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td><strong>Status:</strong></td>
                                        <td><asp:Label ID="lblStatus" runat="server" CssClass="badge"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td><strong>Payment Method:</strong></td>
                                        <td><asp:Label ID="lblPaymentMethod" runat="server"></asp:Label></td>
                                    </tr>
                                </table>
                            </div>
                        </div>

                        <div class="card mb-4">
                            <div class="card-header bg-success text-white">
                                <h5 class="mb-0"><i class="fa fa-user"></i> Customer Information</h5>
                            </div>
                            <div class="card-body">
                                <p class="mb-2"><strong><asp:Label ID="lblCustomerName" runat="server"></asp:Label></strong></p>
                                <p class="mb-2"><i class="fa fa-envelope"></i> <asp:Label ID="lblEmail" runat="server"></asp:Label></p>
                                <p class="mb-0"><i class="fa fa-phone"></i> <asp:Label ID="lblPhone" runat="server"></asp:Label></p>
                            </div>
                        </div>

                        <div class="card mb-4">
                            <div class="card-header bg-warning">
                                <h5 class="mb-0"><i class="fa fa-map-marker"></i> Shipping Address</h5>
                            </div>
                            <div class="card-body">
                                <asp:Label ID="lblShippingAddress" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>

                    <!-- Order Items and Summary -->
                    <div class="col-md-6">
                        <div class="card mb-4">
                            <div class="card-header bg-secondary text-white">
                                <h5 class="mb-0"><i class="fa fa-shopping-cart"></i> Order Items</h5>
                            </div>
                            <div class="card-body">
                                <asp:GridView ID="gvOrderItems" runat="server" CssClass="table table-striped" 
                                    AutoGenerateColumns="false" ShowHeader="false" GridLines="None">
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <div class="d-flex align-items-center mb-3">
                                                    <asp:Image ID="imgProduct" runat="server" 
                                                        ImageUrl='<%# Eval("ImageUrl") %>' 
                                                        Width="60" Height="60" CssClass="me-3" />
                                                    <div class="flex-grow-1">
                                                        <strong><%# Eval("ProductName") %></strong><br />
                                                        <small class="text-muted"><%# Eval("Description") %></small><br />
                                                        <small>Qty: <%# Eval("Quantity") %> × <%# ((decimal)Eval("Price")).ToString("C") %></small>
                                                    </div>
                                                    <div class="text-end">
                                                        <strong><%# ((decimal)Eval("TotalPrice")).ToString("C") %></strong>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>

                        <div class="card mb-4">
                            <div class="card-header bg-dark text-white">
                                <h5 class="mb-0"><i class="fa fa-calculator"></i> Order Summary</h5>
                            </div>
                            <div class="card-body">
                                <div class="d-flex justify-content-between mb-2">
                                    <span>Subtotal:</span>
                                    <strong><asp:Label ID="lblSubtotal" runat="server"></asp:Label></strong>
                                </div>
                                <div class="d-flex justify-content-between mb-2">
                                    <span>Tax:</span>
                                    <strong><asp:Label ID="lblTax" runat="server"></asp:Label></strong>
                                </div>
                                <div class="d-flex justify-content-between mb-3">
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

                        <asp:Panel ID="pnlNotes" runat="server" Visible="false">
                            <div class="card mb-4">
                                <div class="card-header">
                                    <h5 class="mb-0"><i class="fa fa-comment"></i> Order Notes</h5>
                                </div>
                                <div class="card-body">
                                    <asp:Label ID="lblNotes" runat="server"></asp:Label>
                                </div>
                            </div>
                        </asp:Panel>

                        <div class="d-grid gap-2">
                            <asp:Button ID="btnReorder" runat="server" Text="Reorder Items" CssClass="btn btn-primary" OnClick="btnReorder_Click" />
                            <asp:Button ID="btnPrintInvoice" runat="server" Text="Print Invoice" CssClass="btn btn-outline-secondary" 
                                OnClientClick="window.print(); return false;" />
                            <asp:Button ID="btnContactSupport" runat="server" Text="Contact Support" CssClass="btn btn-outline-info" 
                                OnClick="btnContactSupport_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <style>
        .order-timeline {
            display: flex;
            justify-content: space-between;
            position: relative;
            padding: 20px 0;
        }

        .timeline-step {
            flex: 1;
            text-align: center;
            position: relative;
        }

        .timeline-step:not(:last-child)::after {
            content: '';
            position: absolute;
            top: 20px;
            left: 50%;
            width: 100%;
            height: 2px;
            background: #ddd;
            z-index: 0;
        }

        .timeline-step.completed:not(:last-child)::after {
            background: #28a745;
        }

        .timeline-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: #ddd;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            position: relative;
            z-index: 1;
        }

        .timeline-step.completed .timeline-icon {
            background: #28a745;
            color: white;
        }

        .timeline-content {
            margin-top: 10px;
        }

        .timeline-content h6 {
            margin: 0;
            font-size: 14px;
        }

        .timeline-content small {
            color: #666;
        }
    </style>
</asp:Content>