using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PipeDreamsDev2
{


    public partial class Checkout : Page
    {
        private Label lblSubtotal;
        private Label lblTax;
        private Label lblShipping;
        private Label lblTotal;
        private Label lblTotalTax;
        private Label lblShippingTax;
        private Label lblTotalTaxTaxTax;
        private Label lblError;
        private Label lblErrorTax;
        private Label lblErrorTaxTaxTax;
        private Label lblErrorTaxTaxTaxTax;
        private Panel pnlError;
        private Panel pnlErrorTax;
        private Panel pnlErrorTaxTaxTax;
        private Panel pnlTax;
        private Panel pnlTaxTaxTax;
        private Panel pnlTaxTaxTaxTax;
        private TextBox txtFirstName;
        private TextBox txtLastName;
        private TextBox txtEmail;
        private TextBox txtPhone;
        private TextBox txtAddress;
        private TextBox txtAddress2;
        private TextBox txtCity;
        private DropDownList ddlState;
        private TextBox txtZipCode;
        private RadioButtonList rblPaymentMethod;
        private TextBox txtCardName;
        private TextBox txtCardNumber;
        private TextBox txtExpiryDate;
        private TextBox txtCVV;
        private TextBox txtCVV2;
        private TextBox txtCVV3;
        private TextBox txtCVV4;
        private TextBox txtNotes;
        private Button btnPlaceOrder;
        private Button btnOrder;
        private Repeater rptOrderItems;


        private decimal subtotal = 0;
        private decimal tax = 0;
        private decimal shipping = 5.99m; // Flat rate shipping
        private decimal total = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if cart has items
                List<CartItem> cartItems = SiteMaster.GetCartItems();
                if (cartItems == null || cartItems.Count == 0)
                {
                    Response.Redirect("~/Cart.aspx");
                    return;
                }

                LoadOrderSummary();
                
                // Pre-fill customer info if user is logged in
                LoadCustomerInfo();
            }
        }

        private void LoadOrderSummary()
        {
            List<CartItem> cartItems = SiteMaster.GetCartItems();
            
            // Bind cart items to repeater
            rptOrderItems.DataSource = cartItems;
            rptOrderItems.DataBind();

            // Calculate totals
            subtotal = cartItems.Sum(item => item.TotalPrice);
            tax = subtotal * 0.06m; // 6% tax
            
            // Free shipping over $50
            if (subtotal >= 50)
            {
                shipping = 0;
            }
            
            total = subtotal + tax + shipping;

            // Display totals
            lblSubtotal.Text = subtotal.ToString("C");
            lblTax.Text = tax.ToString("C");
            lblShipping.Text = shipping == 0 ? "FREE" : shipping.ToString("C");
            lblTotal.Text = total.ToString("C");
        }

        private void LoadCustomerInfo()
        {
            // If user is logged in, pre-fill their information
            // This is a placeholder - implement based on your authentication system
            if (Session["UserId"] != null)
            {
                // Load customer info from database
                // Example:
                // Customer customer = GetCustomerById(Session["UserId"]);
                // txtFirstName.Text = customer.FirstName;
                // etc.
            }
        }

        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    // Get cart items
                    List<CartItem> cartItems = SiteMaster.GetCartItems();
                    
                    if (cartItems == null || cartItems.Count == 0)
                    {
                        ShowError("Your cart is empty. Please add items before checking out.");
                        return;
                    }

                    // Create order object
                    Order order = new Order
                    {
                        OrderId = GenerateOrderId(),
                        OrderDate = DateTime.Now,
                        FirstName = txtFirstName.Text.Trim(),
                        LastName = txtLastName.Text.Trim(),
                        Email = txtEmail.Text.Trim(),
                        Phone = txtPhone.Text.Trim(),
                        Address = txtAddress.Text.Trim(),
                        Address2 = txtAddress2.Text.Trim(),
                        City = txtCity.Text.Trim(),
                        State = ddlState.SelectedValue,
                        ZipCode = txtZipCode.Text.Trim(),
                        PaymentMethod = rblPaymentMethod.SelectedValue,
                        Subtotal = subtotal,
                        Tax = tax,
                        Shipping = shipping,
                        Total = total,
                        Notes = txtNotes.Text.Trim(),
                        Status = "Pending",
                        Items = cartItems
                    };

                    // Process payment (integrate with payment gateway)
                    bool paymentSuccess = ProcessPayment(order);

                    if (paymentSuccess)
                    {
                        // Save order to database/session
                        SaveOrder(order);

                        // Send confirmation email
                        SendOrderConfirmationEmail(order);

                        // Clear cart
                        SiteMaster.ClearCart();

                        // Redirect to confirmation page
                        Response.Redirect($"~/OrderConfirmation.aspx?orderId={order.OrderId}");
                    }
                    else
                    {
                        ShowError("Payment processing failed. Please check your payment information and try again.");
                    }
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine($"Checkout error: {ex.Message}");
                    ShowError("An error occurred while processing your order. Please try again.");
                }
            }
        }

        private bool ProcessPayment(Order order)
        {
            // TODO: Integrate with actual payment gateway (Stripe, PayPal, etc.)
            // This is a simulation for demo purposes
            
            string paymentMethod = order.PaymentMethod;
            
            switch (paymentMethod)
            {
                case "CreditCard":
                    // Validate card information
                    if (string.IsNullOrEmpty(txtCardName.Text) || 
                        string.IsNullOrEmpty(txtCardNumber.Text) ||
                        string.IsNullOrEmpty(txtExpiryDate.Text) ||
                        string.IsNullOrEmpty(txtCVV.Text))
                    {
                        return false;
                    }
                    
                    // In production: Process card with payment gateway
                    // Example: Stripe.Charges.Create(...)
                    return true;
                    
                case "PayPal":
                    // Redirect to PayPal for payment
                    // Store order and redirect
                    return true;
                    
                case "BankTransfer":
                    // Generate payment instructions
                    return true;
                    
                default:
                    return false;
            }
        }

        private void SaveOrder(Order order)
        {
            // Save to database
            // In production, use Entity Framework or ADO.NET to save to database
            
            // For now, save to session for demo
            List<Order> orders = Session["Orders"] as List<Order>;
            if (orders == null)
            {
                orders = new List<Order>();
            }
            orders.Add(order);
            Session["Orders"] = orders;
        }

        private void SendOrderConfirmationEmail(Order order)
        {
            try
            {
                // Use the same email configuration from Contact form
                System.Configuration.Configuration config = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("~");
                string smtpServer = System.Configuration.ConfigurationManager.AppSettings["SmtpServer"];
                string fromEmail = System.Configuration.ConfigurationManager.AppSettings["SmtpUsername"];

                if (string.IsNullOrEmpty(smtpServer)) return;

                System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
                mail.From = new System.Net.Mail.MailAddress(fromEmail, "Pipe Dreams Developers");
                mail.To.Add(order.Email);
                mail.Subject = $"Order Confirmation - Order #{order.OrderId}";
                mail.IsBodyHtml = true;

                // Build email body
                System.Text.StringBuilder emailBody = new System.Text.StringBuilder();
                emailBody.AppendLine("<html><body>");
                emailBody.AppendLine($"<h2>Thank you for your order, {order.FirstName}!</h2>");
                emailBody.AppendLine($"<p>Your order #{order.OrderId} has been received and is being processed.</p>");
                emailBody.AppendLine("<h3>Order Details:</h3>");
                emailBody.AppendLine("<table style='border-collapse: collapse; width: 100%;'>");
                
                foreach (var item in order.Items)
                {
                    emailBody.AppendLine($"<tr><td>{item.ProductName} (x{item.Quantity})</td><td>{item.TotalPrice:C}</td></tr>");
                }
                
                emailBody.AppendLine("</table>");
                emailBody.AppendLine($"<p><strong>Total: {order.Total:C}</strong></p>");
                emailBody.AppendLine("<p>We'll send you another email when your order ships.</p>");
                emailBody.AppendLine("</body></html>");

                mail.Body = emailBody.ToString();

                // Send email
                System.Net.Mail.SmtpClient smtpClient = new System.Net.Mail.SmtpClient(smtpServer);
                smtpClient.Send(mail);
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Email error: {ex.Message}");
            }
        }

        private string GenerateOrderId()
        {
            // Generate unique order ID
            return "ORD" + DateTime.Now.ToString("yyyyMMddHHmmss") + new Random().Next(1000, 9999);
        }

        private void ShowError(string message)
        {
            pnlError.Visible = true;
            lblError.Text = message;
        }
    }

    // Order class definition
    [Serializable]
    public class Order
    {
        public string OrderId { get; set; }
        public DateTime OrderDate { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public string Address2 { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string ZipCode { get; set; }
        public string PaymentMethod { get; set; }
        public decimal Subtotal { get; set; }
        public decimal Tax { get; set; }
        public decimal Shipping { get; set; }
        public decimal Total { get; set; }
        public string Notes { get; set; }
        public string Status { get; set; }
        public List<CartItem> Items { get; set; }
    }
}