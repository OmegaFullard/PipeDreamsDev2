using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PipeDreamsDev2
{
    public partial class PrintInvoice : Page
    {
        protected Literal litOrderId;
        protected Literal litOrderDate;
        protected Literal litOrderStatus;
        protected Literal litBillingAddress;
        protected Literal litShippingAddress;
        protected Literal litSubtotal;
        protected Literal litTax;
        protected Literal litShipping;
        protected Literal litTotal;
        protected Literal litPaymentMethod;
        protected Repeater rptInvoiceItems;
        protected Panel pnlInvoiceNotFound;
        protected Panel pnlInvoice;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string orderId = Request.QueryString["orderId"];
                
                if (string.IsNullOrEmpty(orderId))
                {
                    ShowInvoiceNotFound();
                    return;
                }

                LoadInvoice(orderId);
            }
        }

        private void LoadInvoice(string orderId)
        {
            // Get orders from session
            List<Order> orders = Session["Orders"] as List<Order>;
            Order order = orders?.FirstOrDefault(o => o.OrderId == orderId);

            if (order == null)
            {
                ShowInvoiceNotFound();
                return;
            }

            // Display invoice
            pnlInvoice.Visible = true;
            pnlInvoiceNotFound.Visible = false;

            litOrderId.Text = order.OrderId;
            litOrderDate.Text = order.OrderDate.ToString("MMMM dd, yyyy");
            litOrderStatus.Text = $"<span class='badge {GetStatusBadgeClass(order.Status)}'>{order.Status}</span>";
            
            // Billing and Shipping addresses (in this demo, they're the same)
            string address = $@"
                <p class='mb-0'>{order.FirstName} {order.LastName}</p>
                <p class='mb-0'>{order.Address}</p>
                <p class='mb-0'>{order.City}, {order.State} {order.ZipCode}</p>
                <p class='mb-0'>Phone: {order.Phone}</p>
                <p class='mb-0'>Email: {order.Email}</p>
            ";
            
            litBillingAddress.Text = address;
            litShippingAddress.Text = address;

            litSubtotal.Text = order.Subtotal.ToString("C");
            litTax.Text = order.Tax.ToString("C");
            litShipping.Text = order.Shipping.ToString("C");
            litTotal.Text = order.Total.ToString("C");
            litPaymentMethod.Text = order.PaymentMethod;

            rptInvoiceItems.DataSource = order.Items;
            rptInvoiceItems.DataBind();
        }

        private void ShowInvoiceNotFound()
        {
            pnlInvoice.Visible = false;
            pnlInvoiceNotFound.Visible = true;
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
    }
}