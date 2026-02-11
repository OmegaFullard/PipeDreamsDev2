<%@ Page Title="Order History" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderHistory.aspx.cs" Inherits="PipeDreamsDev2.OrderHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container my-5">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="display-4 mb-4">
                    <i class="fa fa-history"></i> Order History
                </h1>

                <!-- Filter Options -->
                <div class="card mb-4">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-3">
                                <label for="ddlStatus">Filter by Status:</label>
                                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged">
                                    <asp:ListItem Value="" Text="All Orders"></asp:ListItem>
                                    <asp:ListItem Value="Pending" Text="Pending"></asp:ListItem>
                                    <asp:ListItem Value="Processing" Text="Processing"></asp:ListItem>
                                    <asp:ListItem Value="Shipped" Text="Shipped"></asp:ListItem>
                                    <asp:ListItem Value="Delivered" Text="Delivered"></asp:ListItem>
                                    <asp:ListItem Value="Cancelled" Text="Cancelled"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-3">
                                <label for="ddlTimeRange">Time Range:</label>
                                <asp:DropDownList ID="ddlTimeRange" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlTimeRange_SelectedIndexChanged">
                                    <asp:ListItem Value="All" Text="All Time"></asp:ListItem>
                                    <asp:ListItem Value="30" Text="Last 30 Days"></asp:ListItem>
                                    <asp:ListItem Value="90" Text="Last 90 Days"></asp:ListItem>
                                    <asp:ListItem Value="180" Text="Last 6 Months"></asp:ListItem>
                                    <asp:ListItem Value="365" Text="Last Year"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-4">
                                <label for="txtSearch">Search Orders:</label>
                                <div class="input-group">
                                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Order ID or Product Name"></asp:TextBox>
                                    <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="btnSearch_Click" />
                                </div>
                            </div>
                            <div class="col-md-2">
                                <label>&nbsp;</label>
                                <asp:Button ID="btnReset" runat="server" Text="Reset Filters" CssClass="btn btn-outline-secondary w-100" OnClick="btnReset_Click" />
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Orders List -->
                <asp:Panel ID="pnlNoOrders" runat="server" Visible="false">
                    <div class="alert alert-info text-center">
                        <i class="fa fa-info-circle fa-3x mb-3"></i>
                        <h4>No Orders Found</h4>
                        <p>You haven't placed any orders yet.</p>
                        <a href="~/Products.aspx" runat="server" class="btn btn-primary">Start Shopping</a>
                    </div>
                </asp:Panel>

                <asp:Panel ID="pnlOrders" runat="server" Visible="false">
                    <div class="mb-3">
                        <strong>Showing <asp:Label ID="lblOrderCount" runat="server"></asp:Label> order(s)</strong>
                    </div>

                    <asp:Repeater ID="rptOrders" runat="server" OnItemCommand="rptOrders_ItemCommand" OnItemDataBound="rptOrders_ItemDataBound">
                        <ItemTemplate>
                            <div class="card mb-3">
                                <div class="card-header">
                                    <div class="row align-items-center">
                                        <div class="col-md-3">
                                            <strong>Order #<%# Eval("OrderId") %></strong>
                                        </div>
                                        <div class="col-md-3">
                                            <small class="text-muted">
                                                <i class="fa fa-calendar"></i> <%# ((DateTime)Eval("OrderDate")).ToString("MMM dd, yyyy") %>
                                            </small>
                                        </div>
                                        <div class="col-md-2">
                                            <asp:Label ID="lblStatus" runat="server" 
                                                Text='<%# Eval("Status") %>'>
                                            </asp:Label>
                                        </div>
                                        <div class="col-md-2 text-end">
                                            <strong><%# ((decimal)Eval("Total")).ToString("C") %></strong>
                                        </div>
                                        <div class="col-md-2 text-end">
                                            <asp:Button ID="btnViewDetails" runat="server" 
                                                Text="View Details" 
                                                CssClass="btn btn-sm btn-primary" 
                                                CommandName="ViewDetails" 
                                                CommandArgument='<%# Eval("OrderId") %>' />
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-8">
                                            <h6 class="mb-2">Items:</h6>
                                            <asp:Repeater ID="rptOrderItems" runat="server" DataSource='<%# Eval("Items") %>'>
                                                <ItemTemplate>
                                                    <div class="d-flex align-items-center mb-2">
                                                        <asp:Image ID="imgProduct" runat="server" 
                                                            ImageUrl='<%# Eval("ImageUrl") %>' 
                                                            Width="40" Height="40" CssClass="me-2" 
                                                            AlternateText='<%# Eval("ProductName") %>' />
                                                        <div>
                                                            <strong><%# Eval("ProductName") %></strong>
                                                            <small class="text-muted">(Qty: <%# Eval("Quantity") %>)</small>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                        <div class="col-md-4">
                                            <h6 class="mb-2">Shipping To:</h6>
                                            <p class="mb-1"><%# Eval("FirstName") %> <%# Eval("LastName") %></p>
                                            <p class="mb-0 text-muted small">
                                                <%# Eval("Address") %><br />
                                                <%# Eval("City") %>, <%# Eval("State") %> <%# Eval("ZipCode") %>
                                            </p>
                                        </div>
                                    </div>
                                    <hr />
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <asp:Literal ID="litOrderActions" runat="server"></asp:Literal>
                                        </div>
                                        <div>
                                            <asp:Button ID="btnReorder" runat="server" 
                                                Text="Reorder" 
                                                CssClass="btn btn-sm btn-outline-primary" 
                                                CommandName="Reorder" 
                                                CommandArgument='<%# Eval("OrderId") %>' />
                                            <asp:Button ID="btnPrintInvoice" runat="server" 
                                                Text="Print Invoice" 
                                                CssClass="btn btn-sm btn-outline-secondary" 
                                                CommandName="PrintInvoice" 
                                                CommandArgument='<%# Eval("OrderId") %>' 
                                                OnClientClick='<%# "window.open(\"PrintInvoice.aspx?orderId=" + Eval("OrderId") + "\", \"_blank\"); return false;" %>' />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                    <!-- Pagination -->
                    <asp:Panel ID="pnlPagination" runat="server" Visible="false">
                        <nav aria-label="Order pagination">
                            <ul class="pagination justify-content-center">
                                <asp:Panel ID="pnlPreviousPage" runat="server" CssClass="page-item">
                                    <asp:LinkButton ID="lnkPrevious" runat="server" CssClass="page-link" OnClick="lnkPrevious_Click">Previous</asp:LinkButton>
                                </asp:Panel>
                                <asp:Repeater ID="rptPagination" runat="server" OnItemDataBound="rptPagination_ItemDataBound">
                                    <ItemTemplate>
                                        <asp:Panel ID="pnlPageItem" runat="server" CssClass="page-item">
                                            <asp:LinkButton ID="lnkPage" runat="server" CssClass="page-link" 
                                                CommandName="Page" CommandArgument='<%# Eval("PageNumber") %>' 
                                                OnCommand="lnkPage_Command">
                                                <%# Eval("PageNumber") %>
                                            </asp:LinkButton>
                                        </asp:Panel>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:Panel ID="pnlNextPage" runat="server" CssClass="page-item">
                                    <asp:LinkButton ID="lnkNext" runat="server" CssClass="page-link" OnClick="lnkNext_Click">Next</asp:LinkButton>
                                </asp:Panel>
                            </ul>
                        </nav>
                    </asp:Panel>
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>