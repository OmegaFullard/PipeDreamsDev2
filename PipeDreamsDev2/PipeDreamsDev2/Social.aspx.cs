using System;
using System.Collections.Generic;
using System.EnterpriseServices.Internal;
using System.Linq;
using System.Runtime.InteropServices;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PipeDreamsDev2
{
    public partial class Social : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        // Method to redirect to Facebook
        protected void btnFacebook_Click(object sender, EventArgs e)
        {
            Response.Redirect("https://www.facebook.com/YourPageName", false);
        }

        // Method to redirect to Twitter/X
        protected void btnTwitter_Click(object sender, EventArgs e)
        {
            Response.Redirect("https://twitter.com/YourHandle", false);
        }

        // Method to redirect to LinkedIn
        protected void btnLinkedIn_Click(object sender, EventArgs e)
        {
            Response.Redirect("https://www.linkedin.com/company/YourCompany", false);
        }

        // Method to redirect to Instagram
        protected void btnInstagram_Click(object sender, EventArgs e)
        {
            Response.Redirect("https://www.instagram.com/YourHandle", false);
        }

        // Method to redirect to YouTube
        protected void btnYouTube_Click(object sender, EventArgs e)
        {
            Response.Redirect("https://www.youtube.com/@YourChannel", false);
        }

        // Method to share current page on social media
        [System.Web.Services.WebMethod]
        public static string GetShareUrl(string platform, string url, string title)
        {
            switch (platform.ToLower())
            {
                case "facebook":
                    return $"https://www.facebook.com/sharer/sharer.php?u={Uri.EscapeDataString(url)}";
                case "twitter":
                    return $"https://twitter.com/intent/tweet?url={Uri.EscapeDataString(url)}&text={Uri.EscapeDataString(title)}";
                case "linkedin":
                    return $"https://www.linkedin.com/sharing/share-offsite/?url={Uri.EscapeDataString(url)}";
                case "whatsapp":
                    return $"https://api.whatsapp.com/send?text={Uri.EscapeDataString(title + " " + url)}";
                default:
                    return url;
            }
        }
    }
}