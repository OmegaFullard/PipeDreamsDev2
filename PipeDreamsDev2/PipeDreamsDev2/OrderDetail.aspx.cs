using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PipeDreamsDev2
{
    public partial class OrderDetail : Page
    {
        private Label lblOrderId;
        private Label lblProductId;
        private Label lblProductName;
        private Label lblProductPrice;
        private Label lblPrice;
        private Label lblQuantity;
       private Label lblSubtotal;
        private Label lblTax;
        private Label lblShipping;
        private Label lblTotal;
        private Label lblDiscount;
        private Label lblDiscountTotal;
        private Label lblOrderDate;
        private Label lblStatus;
        private Label lblPaymentMethod;
        private Label lblCustomerName;
        private Label lblEmail;
        private Label lblPhone;
        private Label lblShippingAddress;
        private Label lblShippingCity;
        private Label lblShippingState;
        private Label lblShippingZip;
        private Label lblShippingCountry;
        private Label lblShippingCountryCity;
        private Label lblShippingCountryState;
        private GridView gvOrderItems;
        private Panel pnlNotes;
        private Panel pnlShipping;
        private Panel pnlShippingCity;
        private Label lblNotes;
        private Button btnCancel;
        private Button btnOk;
        private Panel pnlTrackingInfo;
        private Label lblTrackingNumber;
        private Label lblTrackingDate;
        private Label lblTrackingCity;
        private Label lblTrackingState;
        private Label lblTrackingZip;
        private Label lblTrackingCountry;
        private Label lblTrackingCountryCity;
        private Label lblOrderPlacedDate;
        private Label lblProcessingDate;
        private Label lblShippedDate;
        private Label lblDeliveredDate;
        private Panel pnlStepPlaced;
        private Panel pnlStepProcessing;
        private Panel pnlStepShipped;
        private Panel pnlStepDelivered;
        private Panel pnlStepShipping;
        private Order currentOrder;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string orderId = Request.QueryString["orderId"];
                
                if (string.IsNullOrEmpty(orderId))
                {
                    Response.Redirect("~/OrderHistory.aspx");
                    return;
                }

                LoadOrderDetails(orderId);
            }
        }

        private void LoadOrderDetails(string orderId)
        {
            // Get orders from session (in production, query from database)
            List<Order> orders = Session["Orders"] as List<Order>;
            currentOrder = orders?.FirstOrDefault(o => o.OrderId == orderId);

            if (currentOrder != null)
            {
                // Order Information
                lblOrderId.Text = currentOrder.OrderId;
                lblOrderDate.Text = currentOrder.OrderDate.ToString("MMMM dd, yyyy hh:mm tt");
                lblStatus.Text = currentOrder.Status;
                lblStatus.CssClass = "badge " + GetStatusBadgeClass(currentOrder.Status);
                lblPaymentMethod.Text = GetPaymentMethodDisplay(currentOrder.PaymentMethod);

                // Customer Information
                lblCustomerName.Text = $"{currentOrder.FirstName} {currentOrder.LastName}";
                lblEmail.Text = currentOrder.Email;
                lblPhone.Text = currentOrder.Phone;

                // Shipping Address
                lblShippingAddress.Text = $"{currentOrder.Address}<br />" +
                    (!string.IsNullOrEmpty(currentOrder.Address2) ? $"{currentOrder.Address2}<br />" : "") +
                    $"{currentOrder.City}, {currentOrder.State} {currentOrder.ZipCode}";

                // Order Items
                gvOrderItems.DataSource = currentOrder.Items;
                gvOrderItems.DataBind();

                // Order Summary
                lblSubtotal.Text = currentOrder.Subtotal.ToString("C");
                lblTax.Text = currentOrder.Tax.ToString("C");
                lblShipping.Text = currentOrder.Shipping == 0 ? "FREE" : currentOrder.Shipping.ToString("C");
                lblTotal.Text = currentOrder.Total.ToString("C");

                // Order Notes
                if (!string.IsNullOrEmpty(currentOrder.Notes))
                {
                    pnlNotes.Visible = true;
                    lblNotes.Text = currentOrder.Notes;
                }

                // Status Timeline - Update CSS classes and dates
                UpdateStatusTimeline(currentOrder.Status, currentOrder.OrderDate);

                // Tracking Information
                if (currentOrder.Status == "Shipped" || currentOrder.Status == "Delivered")
                {
                    pnlTrackingInfo.Visible = true;
                    lblTrackingNumber.Text = "TRK" + currentOrder.OrderId.Substring(3);
                }
            }
            else
            {
                Response.Redirect("~/OrderHistory.aspx");
            }
        }

        private void UpdateStatusTimeline(string status, DateTime orderDate)
        {
            int statusLevel = GetStatusLevel(status);
            
            // Order Placed - Always completed
            pnlStepPlaced.CssClass = "timeline-step completed";
            lblOrderPlacedDate.Text = orderDate.ToString("MMM dd, yyyy");

            // Processing
            if (statusLevel >= 2)
            {
                pnlStepProcessing.CssClass = "timeline-step completed";
                lblProcessingDate.Text = orderDate.AddHours(2).ToString("MMM dd, yyyy");
            }
            else
            {
                pnlStepProcessing.CssClass = "timeline-step";
                lblProcessingDate.Text = "";
            }

            // Shipped
            if (statusLevel >= 3)
            {
                pnlStepShipped.CssClass = "timeline-step completed";
                lblShippedDate.Text = orderDate.AddDays(1).ToString("MMM dd, yyyy");
            }
            else
            {
                pnlStepShipped.CssClass = "timeline-step";
                lblShippedDate.Text = "";
            }

            // Delivered
            if (statusLevel >= 4)
            {
                pnlStepDelivered.CssClass = "timeline-step completed";
                lblDeliveredDate.Text = orderDate.AddDays(3).ToString("MMM dd, yyyy");
            }
            else
            {
                pnlStepDelivered.CssClass = "timeline-step";
                lblDeliveredDate.Text = "";
            }
        }

        private int GetStatusLevel(string status)
        {
            switch (status)
            {
                case "Pending":
                    return 1;
                case "Processing":
                    return 2;
                case "Shipped":
                    return 3;
                case "Delivered":
                    return 4;
                case "Cancelled":
                    return 1; // Show as only placed
                default:
                    return 1;
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

        private string GetPaymentMethodDisplay(string method)
        {
            switch (method)
            {
                case "CreditCard":
                    return "Credit Card";
                case "PayPal":
                    return "PayPal";
                case "BankTransfer":
                    return "Bank Transfer";
                default:
                    return method;
            }
        }

        protected void btnReorder_Click(object sender, EventArgs e)
        {
            if (currentOrder != null)
            {
                // Get the current order from session again
                string orderId = Request.QueryString["orderId"];
                List<Order> orders = Session["Orders"] as List<Order>;
                Order order = orders?.FirstOrDefault(o => o.OrderId == orderId);

                if (order != null)
                {
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
                    Response.Redirect("~/Cart.aspx");
                }
            }
        }

        protected void btnContactSupport_Click(object sender, EventArgs e)
        {
            string orderId = Request.QueryString["orderId"];
            Response.Redirect($"~/Contact.aspx?subject=Order%20{orderId}");
        }

        protected void gvOrderItems_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            // Optional: Add any row data binding logic here
        }
    }
}