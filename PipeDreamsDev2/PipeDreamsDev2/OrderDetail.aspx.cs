using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PipeDreamsDev2
{
    public partial class OrderDetail : Page
    {
        protected Literal litOrderId;
        protected Literal litOrderDate;
        protected Literal litOrderStatus;
        protected Literal litSubtotal;
        protected Literal litTax;
        protected Literal litShipping;
        protected Literal litTotal;
        protected Literal litShippingAddress;
        protected Literal litPaymentMethod;
        protected Repeater rptOrderItems;
        protected Panel pnlOrderNotFound;
        protected Panel pnlOrderDetail;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string orderId = Request.QueryString["orderId"];
                
                if (string.IsNullOrEmpty(orderId))
                {
                    ShowOrderNotFound();
                    return;
                }

                LoadOrderDetails(orderId);
            }
        }

        private void LoadOrderDetails(string orderId)
        {
            // Get orders from session
            List<Order> orders = Session["Orders"] as List<Order>;
            Order order = orders?.FirstOrDefault(o => o.OrderId == orderId);

            if (order == null)
            {
                ShowOrderNotFound();
                return;
            }

            // Display order details
            pnlOrderDetail.Visible = true;
            pnlOrderNotFound.Visible = false;

            litOrderId.Text = order.OrderId;
            litOrderDate.Text = order.OrderDate.ToString("MMMM dd, yyyy");
            litOrderStatus.Text = $"<span class='badge {GetStatusBadgeClass(order.Status)}'>{order.Status}</span>";
            litSubtotal.Text = order.Subtotal.ToString("C");
            litTax.Text = order.Tax.ToString("C");
            litShipping.Text = order.Shipping.ToString("C");
            litTotal.Text = order.Total.ToString("C");
            
            litShippingAddress.Text = $@"
                {order.FirstName} {order.LastName}<br/>
                {order.Address}<br/>
                {order.City}, {order.State} {order.ZipCode}<br/>
                Phone: {order.Phone}<br/>
                Email: {order.Email}
            ";

            litPaymentMethod.Text = order.PaymentMethod;

            rptOrderItems.DataSource = order.Items;
            rptOrderItems.DataBind();
        }

        private void ShowOrderNotFound()
        {
            pnlOrderDetail.Visible = false;
            pnlOrderNotFound.Visible = true;
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

        protected void btnBackToOrders_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/OrderHistory.aspx");
        }

        protected void btnReorder_Click(object sender, EventArgs e)
        {
            string orderId = Request.QueryString["orderId"];
            
            if (string.IsNullOrEmpty(orderId))
            {
                return;
            }

            // Get orders from session
            List<Order> orders = Session["Orders"] as List<Order>;
            Order order = orders?.FirstOrDefault(o => o.OrderId == orderId);

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
        protected void btnContactSupport_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Support.aspx");
        }
    }
}