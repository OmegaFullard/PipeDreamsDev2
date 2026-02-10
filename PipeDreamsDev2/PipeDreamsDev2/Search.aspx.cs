using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PipeDreamsDev2
{
    public partial class Search : Page
    {
        protected TextBox txtSearch;
        protected Button btnSearch;
        protected Panel pnlResults;
        protected Panel pnlNoResults;
        protected Label lblResultCount;
        protected Label lblSearchTerm;
        protected Label lblNoResultsTerm;
        protected Label lblResultsTerm;
        protected Repeater rptSearchResults;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if search query is passed via URL
                string query = Request.QueryString["q"];
                if (!string.IsNullOrEmpty(query))
                {
                    // Validate and sanitize input
                    query = query.Trim();
                    if (query.Length > 100)
                    {
                        query = query.Substring(0, 100);
                    }
                    
                    txtSearch.Text = query;
                    PerformSearch(query);
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchQuery = txtSearch.Text.Trim();
            if (!string.IsNullOrEmpty(searchQuery))
            {
                // Redirect to include query in URL for bookmarking and refresh support
                Response.Redirect($"~/Search.aspx?q={HttpUtility.UrlEncode(searchQuery)}");
            }
        }

        private void PerformSearch(string query)
        {
            // Get all searchable pages and their content
            List<SearchResult> results = SearchPages(query);

            if (results.Count > 0)
            {
                // Sort by relevance score
                results = results.OrderByDescending(r => r.Score).ToList();

                // Display results
                pnlResults.Visible = true;
                pnlNoResults.Visible = false;
                lblResultCount.Text = results.Count.ToString();
                lblSearchTerm.Text = HttpUtility.HtmlEncode(query);
                rptSearchResults.DataSource = results;
                rptSearchResults.DataBind();
            }
            else
            {
                // No results found
                pnlResults.Visible = false;
                pnlNoResults.Visible = true;
                lblNoResultsTerm.Text = HttpUtility.HtmlEncode(query);
            }
        }

        private List<SearchResult> SearchPages(string query)
        {
            List<SearchResult> results = new List<SearchResult>();
            string[] keywords = query.ToLower().Split(new[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);

            // Define searchable pages with their content
            var pages = GetSearchablePages();

            foreach (var page in pages)
            {
                int score = CalculateRelevanceScore(page, keywords);
                if (score > 0)
                {
                    string snippet = ExtractSnippet(page.Content, keywords);
                    results.Add(new SearchResult
                    {
                        Title = page.Title,
                        PageName = page.PageName,
                        Url = page.Url,
                        Description = page.Description,
                        Snippet = snippet,
                        Score = score
                    });
                }
            }

            return results;
        }

        private List<PageContent> GetSearchablePages()
        {
            return new List<PageContent>
            {
                new PageContent
                {
                    PageName = "Home",
                    Title = "Pipe Dreams Developers - Home",
                    Url = "~/Default.aspx",
                    Description = "Welcome to Pipe Dreams Developers, your trusted partner in software development.",
                    Content = "home software development solutions custom applications web development mobile apps cloud services enterprise solutions innovation technology digital transformation"
                },
                new PageContent
                {
                    PageName = "Services",
                    Title = "Our Services",
                    Url = "~/Services.aspx",
                    Description = "Explore our comprehensive range of software development services.",
                    Content = "services web development mobile app development cloud solutions custom software enterprise applications consulting agile development devops software engineering quality assurance testing maintenance support"
                },
                new PageContent
                {
                    PageName = "Products",
                    Title = "Products & Pricing",
                    Url = "~/Products.aspx",
                    Description = "Discover our products and flexible pricing options.",
                    Content = "products pricing packages plans subscriptions enterprise solutions starter professional premium custom pricing free trial payment options billing"
                },
                new PageContent
                {
                    PageName = "Contact",
                    Title = "Contact Us",
                    Url = "~/Contact.aspx",
                    Description = "Get in touch with our team for any inquiries or support.",
                    Content = "contact us get in touch support customer service email phone address location royal city pennsylvania inquiries questions help assistance technical support sales"
                },
                new PageContent
                {
                    PageName = "About",
                    Title = "About Us",
                    Url = "~/About.aspx",
                    Description = "Learn more about Pipe Dreams Developers and our mission.",
                    Content = "about us company mission vision values team history experience expertise software development innovation commitment quality customer satisfaction"
                },
                new PageContent
                {
                    PageName = "Support",
                    Title = "Support Center",
                    Url = "~/Support.aspx",
                    Description = "Access our support resources and help documentation.",
                    Content = "support help center documentation faq frequently asked questions troubleshooting guides tutorials knowledge base customer support technical assistance"
                },
                new PageContent
                {
                    PageName = "Privacy",
                    Title = "Privacy Policy",
                    Url = "~/Privacy.aspx",
                    Description = "Read our privacy policy and data protection practices.",
                    Content = "privacy policy data protection personal information security cookies gdpr compliance terms conditions legal"
                },
                new PageContent
                {
                    PageName = "Social",
                    Title = "Social Media",
                    Url = "~/Social.aspx",
                    Description = "Connect with us on social media platforms.",
                    Content = "social media facebook twitter linkedin instagram youtube follow us connect share"
                },
                new PageContent
                {
                    PageName = "Cart",
                    Title = "Shopping Cart",
                    Url = "~/Cart.aspx",
                    Description = "View your shopping cart and checkout.",
                    Content = "shopping cart checkout purchase buy order payment products items"
                }
            };
        }

        private int CalculateRelevanceScore(PageContent page, string[] keywords)
        {
            int score = 0;
            string content = (page.Title + " " + page.Description + " " + page.Content).ToLower();

            foreach (string keyword in keywords)
            {
                // Count occurrences of keyword
                int occurrences = Regex.Matches(content, Regex.Escape(keyword)).Count;
                
                // Higher weight for title matches
                if (page.Title.ToLower().Contains(keyword))
                {
                    score += 30;
                }
                
                // Medium weight for description matches
                if (page.Description.ToLower().Contains(keyword))
                {
                    score += 15;
                }
                
                // Standard weight for content matches
                score += occurrences * 5;
            }

            return score;
        }

        private string ExtractSnippet(string content, string[] keywords)
        {
            // Find the first keyword match and extract surrounding text
            content = content.ToLower();
            int snippetLength = 150;
            
            foreach (string keyword in keywords)
            {
                int index = content.IndexOf(keyword);
                if (index >= 0)
                {
                    int start = Math.Max(0, index - 50);
                    int length = Math.Min(snippetLength, content.Length - start);
                    string snippet = content.Substring(start, length);
                    
                    // Highlight the keyword
                    snippet = Regex.Replace(snippet, Regex.Escape(keyword), 
                        match => $"<strong>{match.Value}</strong>", 
                        RegexOptions.IgnoreCase);
                    
                    return snippet;
                }
            }
            
            // If no keyword found, return first part of content
            return content.Length > snippetLength 
                ? content.Substring(0, snippetLength) 
                : content;
        }

        // Helper classes
        private class PageContent
        {
            public string PageName { get; set; }
            public string Title { get; set; }
            public string Url { get; set; }
            public string Description { get; set; }
            public string Content { get; set; }
        }

        public class SearchResult
        {
            public string Title { get; set; }
            public string PageName { get; set; }
            public string Url { get; set; }
            public string Description { get; set; }
            public string Snippet { get; set; }
            public int Score { get; set; }
        }
    }
}