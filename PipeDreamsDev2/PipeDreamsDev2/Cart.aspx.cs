using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PipeDreamsDev2
{
    public partial class Cart : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCart();
            }
        }

        private void BindCart()
        {
            List<CartItem> cartItems = SiteMaster.GetCartItems();

            if (cartItems.Count > 0)
            {
                pnlEmptyCart.Visible = false;
                pnlCartItems.Visible = true;
                gvCart.DataSource = cartItems;
                gvCart.DataBind();
            }
            else
            {
                pnlEmptyCart.Visible = true;
                pnlCartItems.Visible = false;
            }
        }

        protected void gvCart_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                List<CartItem> cartItems = SiteMaster.GetCartItems();
                decimal grandTotal = cartItems.Sum(item => item.TotalPrice);
                
                Label lblGrandTotal = (Label)e.Row.FindControl("lblGrandTotal");
                if (lblGrandTotal != null)
                {
                    lblGrandTotal.Text = grandTotal.ToString("C");
                }
            }
        }

        protected void gvCart_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int productId = Convert.ToInt32(e.CommandArgument);
            List<CartItem> cartItems = SiteMaster.GetCartItems();
            CartItem item = cartItems.FirstOrDefault(i => i.ProductId == productId);

            if (item != null)
            {
                switch (e.CommandName)
                {
                    case "Increase":
                        item.Quantity++;
                        Session["CartItems"] = cartItems;
                        break;

                    case "Decrease":
                        if (item.Quantity > 1)
                        {
                            item.Quantity--;
                            Session["CartItems"] = cartItems;
                        }
                        else
                        {
                            SiteMaster.RemoveFromCart(productId);
                        }
                        break;

                    case "Remove":
                        SiteMaster.RemoveFromCart(productId);
                        break;
                }

                BindCart();
            }
        }

        protected void btnClearCart_Click(object sender, EventArgs e)
        {
            SiteMaster.ClearCart();
            BindCart();
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            // Redirect to checkout page (you'll need to create this)
            Response.Redirect("~/Checkout.aspx");
        }
    }
}