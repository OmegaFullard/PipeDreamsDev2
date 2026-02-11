using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PipeDreamsDev2
{
    public partial class OrderHistory : Page
    {
        private Label lblOrderCount;
        private Panel pnlNoOrders;
        private List<Order> orders;
        private Panel pnlOrders;
        private List<OrderDetail> orderDetail;
        private Repeater rptOrders;
        private List<OrderDetail> orderDetailList;
        private DropDownList ddlStatus;
        private DropDownList ddlTimeRange;
        private TextBox txtSearch;
        private Panel pnlPagination;
        private Repeater rptPagination;
        private Panel pnlPreviousPage;
        private LinkButton lnkPrevious;
        private Panel pnlNextPage;
        private LinkButton lnkNext;
        private LinkButton lnkPrev;

        private const int PageSize = 10;
        
        protected int CurrentPage
        {
            get { return ViewState["CurrentPage"] != null ? (int)ViewState["CurrentPage"] : 1; }
            set { ViewState["CurrentPage"] = value; }
        }

        protected int TotalPages
        {
            get { return ViewState["TotalPages"] != null ? (int)ViewState["TotalPages"] : 1; }
            set { ViewState["TotalPages"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadOrders();
            }
        }

        private void LoadOrders()
        {
            // Get all orders (in production, filter by logged-in user)
            List<Order> allOrders = GetUserOrders();

            // Apply filters
            allOrders = ApplyFilters(allOrders);

            if (allOrders.Count > 0)
            {
                // Calculate pagination
                TotalPages = (int)Math.Ceiling(allOrders.Count / (double)PageSize);
                int skip = (CurrentPage - 1) * PageSize;
                List<Order> pagedOrders = allOrders.OrderByDescending(o => o.OrderDate).Skip(skip).Take(PageSize).ToList();

                pnlNoOrders.Visible = false;
                pnlOrders.Visible = true;
                lblOrderCount.Text = allOrders.Count.ToString();
                rptOrders.DataSource = pagedOrders;
                rptOrders.DataBind();

                // Show pagination if needed
                if (TotalPages > 1)
                {
                    BindPagination();
                    pnlPagination.Visible = true;
                    UpdatePaginationButtons();
                }
                else
                {
                    pnlPagination.Visible = false;
                }
            }
            else
            {
                pnlNoOrders.Visible = true;
                pnlOrders.Visible = false;
            }
        }

        private void UpdatePaginationButtons()
        {
            // Update Previous button state
            if (CurrentPage == 1)
            {
                pnlPreviousPage.CssClass = "page-item disabled";
                lnkPrevious.Enabled = false;
            }
            else
            {
                pnlPreviousPage.CssClass = "page-item";
                lnkPrevious.Enabled = true;
            }

            // Update Next button state
            if (CurrentPage == TotalPages)
            {
                pnlNextPage.CssClass = "page-item disabled";
                lnkNext.Enabled = false;
            }
            else
            {
                pnlNextPage.CssClass = "page-item";
                lnkNext.Enabled = true;
            }
        }

        private List<Order> GetUserOrders()
        {
            // Get orders from session (in production, query from database by UserId)
            List<Order> orders = Session["Orders"] as List<Order>;
            
            // For demo purposes, create some sample orders if none exist
            if (orders == null || orders.Count == 0)
            {
                orders = GenerateSampleOrders();
            }

            return orders ?? new List<Order>();
        }

        private List<Order> ApplyFilters(List<Order> orders)
        {
            // Filter by status
            if (!string.IsNullOrEmpty(ddlStatus.SelectedValue))
            {
                orders = orders.Where(o => o.Status == ddlStatus.SelectedValue).ToList();
            }

            // Filter by time range
            if (ddlTimeRange.SelectedValue != "All")
            {
                int days = int.Parse(ddlTimeRange.SelectedValue);
                DateTime cutoffDate = DateTime.Now.AddDays(-days);
                orders = orders.Where(o => o.OrderDate >= cutoffDate).ToList();
            }

            // Filter by search term
            string searchTerm = txtSearch.Text.Trim().ToLower();
            if (!string.IsNullOrEmpty(searchTerm))
            {
                orders = orders.Where(o => 
                    o.OrderId.ToLower().Contains(searchTerm) ||
                    o.Items.Any(i => i.ProductName.ToLower().Contains(searchTerm))
                ).ToList();
            }

            return orders;
        }

        private void BindPagination()
        {
            List<PageInfo> pages = new List<PageInfo>();
            for (int i = 1; i <= TotalPages; i++)
            {
                pages.Add(new PageInfo { PageNumber = i });
            }
            rptPagination.DataSource = pages;
            rptPagination.DataBind();
        }

        protected void rptOrders_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                // Get the order data
                Order order = (Order)e.Item.DataItem;
                
                // Find and set the status label
                Label lblStatus = (Label)e.Item.FindControl("lblStatus");
                if (lblStatus != null)
                {
                    lblStatus.CssClass = "badge " + GetStatusBadgeClass(order.Status);
                }
                
                // Find and set the order actions literal
                Literal litOrderActions = (Literal)e.Item.FindControl("litOrderActions");
                if (litOrderActions != null)
                {
                    litOrderActions.Text = GetOrderActions(order.Status, order.OrderId);
                }
            }
        }

        private string GetOrderActions(string status, string orderId)
        {
            string actions = "";
            
            switch (status)
            {
                case "Pending":
                    actions = "<span class='text-warning'><i class='fa fa-clock-o'></i> Order pending</span>";
                    break;
                case "Processing":
                    actions = "<span class='text-info'><i class='fa fa-cog fa-spin'></i> Processing order</span>";
                    break;
                case "Shipped":
                    actions = "<span class='text-primary'><i class='fa fa-truck'></i> Order shipped</span>";
                    break;
                case "Delivered":
                    actions = "<span class='text-success'><i class='fa fa-check-circle'></i> Order delivered</span>";
                    break;
                case "Cancelled":
                    actions = "<span class='text-danger'><i class='fa fa-times-circle'></i> Order cancelled</span>";
                    break;
                default:
                    actions = "<span class='text-muted'>Status unknown</span>";
                    break;
            }
            
            return actions;
        }

        protected void rptPagination_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Panel pnlPageItem = (Panel)e.Item.FindControl("pnlPageItem");
                LinkButton lnkPage = (LinkButton)e.Item.FindControl("lnkPage");
                
                if (pnlPageItem != null && lnkPage != null)
                {
                    PageInfo pageInfo = (PageInfo)e.Item.DataItem;
                    
                    // Mark current page as active
                    if (pageInfo.PageNumber == CurrentPage)
                    {
                        pnlPageItem.CssClass = "page-item active";
                        lnkPage.Enabled = false;
                    }
                    else
                    {
                        pnlPageItem.CssClass = "page-item";
                        lnkPage.Enabled = true;
                    }
                }
            }
        }

        private string GetStatusBadgeClass(string status)
        {
            switch (status)
            {
                case "Pending":
                    return "bg-warning text-dark";
                case "Processing":
                    return "bg-info text-white";
                case "Shipped":
                    return "bg-primary text-white";
                case "Delivered":
                    return "bg-success text-white";
                case "Cancelled":
                    return "bg-danger text-white";
                default:
                    return "bg-secondary text-white";
            }
        }

        protected void rptOrders_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string orderId = e.CommandArgument.ToString();

            switch (e.CommandName)
            {
                case "ViewDetails":
                    Response.Redirect($"~/OrderDetail.aspx?orderId={orderId}");
                    break;

                case "Reorder":
                    ReorderItems(orderId);
                    break;

                case "PrintInvoice":
                    // Handled by OnClientClick
                    break;
            }
        }

        private void ReorderItems(string orderId)
        {
            List<Order> orders = GetUserOrders();
            Order order = orders.FirstOrDefault(o => o.OrderId == orderId);

            if (order != null)
            {
                // Add all items from this order to cart
                foreach (var item in order.Items)
                {
                    SiteMaster.AddToCart(new CartItem
                    {
                        ProductId = item.ProductId,
                        ProductName = item.ProductName,
                        Description = item.Description,
                        Price = item.Price,
                        Quantity = item.Quantity,
                        ImageUrl = item.ImageUrl
                    });
                }

                // Redirect to cart
                Response.Redirect("~/Cart.aspx");
            }
        }

        protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            CurrentPage = 1;
            LoadOrders();
        }

        protected void ddlTimeRange_SelectedIndexChanged(object sender, EventArgs e)
        {
            CurrentPage = 1;
            LoadOrders();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            CurrentPage = 1;
            LoadOrders();
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            ddlStatus.SelectedIndex = 0;
            ddlTimeRange.SelectedIndex = 0;
            txtSearch.Text = string.Empty;
            CurrentPage = 1;
            LoadOrders();
        }

        protected void lnkPrevious_Click(object sender, EventArgs e)
        {
            if (CurrentPage > 1)
            {
                CurrentPage--;
                LoadOrders();
            }
        }

        protected void lnkNext_Click(object sender, EventArgs e)
        {
            if (CurrentPage < TotalPages)
            {
                CurrentPage++;
                LoadOrders();
            }
        }

        protected void lnkPage_Command(object sender, CommandEventArgs e)
        {
            CurrentPage = int.Parse(e.CommandArgument.ToString());
            LoadOrders();
        }

        // Helper method to generate sample orders for demo
        private List<Order> GenerateSampleOrders()
        {
            List<Order> sampleOrders = new List<Order>();
            Random random = new Random();
            string[] statuses = { "Pending", "Processing", "Shipped", "Delivered", "Cancelled" };

            for (int i = 0; i < 15; i++)
            {
                sampleOrders.Add(new Order
                {
                    OrderId = "ORD" + DateTime.Now.AddDays(-i).ToString("yyyyMMdd") + random.Next(1000, 9999),
                    OrderDate = DateTime.Now.AddDays(-i * 3),
                    FirstName = "John",
                    LastName = "Doe",
                    Email = "john.doe@example.com",
                    Phone = "555-1234",
                    Address = "123 Main St",
                    City = "Royal City",
                    State = "PA",
                    ZipCode = "19106",
                    PaymentMethod = "CreditCard",
                    Subtotal = 100m + (i * 10),
                    Tax = (100m + (i * 10)) * 0.06m,
                    Shipping = 5.99m,
                    Total = (100m + (i * 10)) * 1.06m + 5.99m,
                    Status = statuses[random.Next(statuses.Length)],
                    Items = new List<CartItem>
                    {
                        new CartItem
                        {
                            ProductId = i + 1,
                            ProductName = $"Product {i + 1}",
                            Description = "Sample product",
                            Price = 29.99m,
                            Quantity = random.Next(1, 5),
                            ImageUrl = "~/images/product-placeholder.png"
                        }
                    }
                });
            }

            return sampleOrders;
        }

        private class PageInfo
        {
            public int PageNumber { get; set; }
        }
    }
}