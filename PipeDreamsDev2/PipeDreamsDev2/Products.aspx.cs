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

		}

		protected void AddToCart_Click(object sender, EventArgs e)
		{
			Button btn = (Button)sender;
			
			// Get product details from button's CommandArgument or from data
			// This is an example - adjust based on your actual product structure
			int productId = Convert.ToInt32(btn.CommandArgument);
			
			CartItem item = new CartItem
			{
				ProductId = productId,
				ProductName = "Free", // Get from your data source
				Description = "Individual or Student",
				Price = 0.00m,
				Quantity = 1,
				ImageUrl = "~/images/product2.png"

				
			};

			CartItem item1 = new CartItem
			{
				ProductId = productId,
				ProductName = "Pro", 
				Description = "Professional",
				Price = 99.00m,
				Quantity = 1,
				ImageUrl = "~/images/product1.png"
			};

			CartItem item2 = new CartItem
			{
				ProductId = productId,
				ProductName = "Enterprise",
                Description = "Enterprise",
				Price = 299.00m,
				Quantity = 1,
				ImageUrl = "~/images/product3.png"
			};

            SiteMaster.AddToCart(item);
            SiteMaster.AddToCart(item1);
            SiteMaster.AddToCart(item2);

			// Optional: Show confirmation message or redirect
			Response.Redirect(Request.RawUrl); // Refresh to update cart count
		}
	}
}