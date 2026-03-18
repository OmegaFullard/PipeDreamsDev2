using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PipeDreamsDev2
{
    public partial class OrderConfirmation : Page
    {
        protected Label lblOrderId;
        protected Label lblOrderDate;
        protected Label lblCustomerName;
        protected Label lblEmail;
        protected Label lblConfirmEmail;
        protected Label lblShippingAddress;
        protected GridView gvOrderItems;
        protected Label lblSubtotal;
        protected Label lblTax;
        protected Label lblShipping;
        protected Label lblTotal;
        protected Button btnCancel;
        protected Button btnOk;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string orderId = Request.QueryString["orderId"];
                
                if (string.IsNullOrEmpty(orderId))
                {
                    Response.Redirect("~/Default.aspx");
                    return;
                }

                LoadOrderDetails(orderId);
            }
        }

        private void LoadOrderDetails(string orderId)
        {
            // Get order from session (in production, load from database)
            List<Order> orders = Session["Orders"] as List<Order>;
            Order order = orders?.FirstOrDefault(o => o.OrderId == orderId);

            if (order != null)
            {
                // Display order information
                lblOrderId.Text = order.OrderId;
                lblOrderDate.Text = order.OrderDate.ToString("MMMM dd, yyyy hh:mm tt");
                lblCustomerName.Text = $"{order.FirstName} {order.LastName}";
                lblEmail.Text = order.Email;
                lblConfirmEmail.Text = order.Email;
                
                lblShippingAddress.Text = $"{order.Address}<br />" +
                    (!string.IsNullOrEmpty(order.Address2) ? $"{order.Address2}<br />" : "") +
                    $"{order.City}, {order.State} {order.ZipCode}";

                // Display order items
                gvOrderItems.DataSource = order.Items;
                gvOrderItems.DataBind();

                // Display totals
                lblSubtotal.Text = order.Subtotal.ToString("C");
                lblTax.Text = order.Tax.ToString("C");
                lblShipping.Text = order.Shipping == 0 ? "FREE" : order.Shipping.ToString("C");
                lblTotal.Text = order.Total.ToString("C");
            }
            else
            {
                Response.Redirect("~/Default.aspx");
            }
        }

        protected void gvOrderItems_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            // This can be used for footer calculations if needed
        }
    }
}