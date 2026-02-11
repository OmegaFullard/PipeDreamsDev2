using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PipeDreamsDev2
{
    public partial class Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if cart has items to show the cart link
                UpdateCartLink();
            }
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string packageType = btn.CommandArgument;

            // Get package details based on the selected plan
            CartItem item = GetPackageDetails(packageType);

            if (item != null)
            {
                // Add to cart
                SiteMaster.AddToCart(item);

                // Show success message
                ShowSuccessMessage(item.ProductName);

                // Update cart link visibility
                UpdateCartLink();

                // Scroll to top to see the message
                ScriptManager.RegisterStartupScript(this, GetType(), "scrollToTop", 
                    "window.scrollTo({top: 0, behavior: 'smooth'});", true);
            }
        }

        private CartItem GetPackageDetails(string packageType)
        {
            CartItem item = null;

            switch (packageType)
            {
                case "Free":
                    item = new CartItem
                    {
                        ProductId = 1,
                        ProductName = "Free Plan",
                        Description = "5 users, 20 GB storage, limited email support",
                        Price = 0m,
                        Quantity = 1,
                        ImageUrl = "~/images/free.png"
                    };
                    break;

                case "Pro":
                    item = new CartItem
                    {
                        ProductId = 2,
                        ProductName = "Pro Plan",
                        Description = "10 users, 100 GB storage, priority email support, Royal City Notification Center",
                        Price = 99m,
                        Quantity = 1,
                        ImageUrl = "~/images/pro.png"
                    };
                    break;

                case "Enterprise":
                    item = new CartItem
                    {
                        ProductId = 3,
                        ProductName = "Enterprise Plan",
                        Description = "20 users, unlimited storage, 24/7 phone and email support, Royal City Notification Center",
                        Price = 299m,
                        Quantity = 1,
                        ImageUrl = "~/images/enterprise.png"
                    };
                    break;
            }

            return item;
        }

        private void ShowSuccessMessage(string productName)
        {
            pnlSuccess.Visible = true;
            lblSuccessMessage.Text = productName;
        }

        private void UpdateCartLink()
        {
            List<CartItem> cartItems = SiteMaster.GetCartItems();
            if (cartItems != null && cartItems.Count > 0)
            {
                lnkViewCart.Visible = true;
            }
        }
    }
}