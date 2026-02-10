<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Social.aspx.cs" MasterPageFile="~/Site.Master" Inherits="PipeDreamsDev2.Social" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .social-container {
            max-width: 800px;
            margin: 50px auto;
            padding: 30px;
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .social-header {
            text-align: center;
            color: #1e1e2f;
            margin-bottom: 30px;
            font-size: 32px;
            border-bottom: 3px solid #8035f0;
            padding-bottom: 15px;
        }

        .social-links {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 20px;
            margin-bottom: 40px;
        }

        .social-button {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 15px 20px;
            border-radius: 8px;
            text-decoration: none;
            color: white;
            font-weight: bold;
            transition: transform 0.2s, box-shadow 0.2s;
            cursor: pointer;
        }

        .social-button:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
        }

        .social-button i {
            margin-right: 10px;
            font-size: 20px;
        }

        .btn-facebook { background: #1877f2; }
        .btn-twitter { background: #1da1f2; }
        .btn-linkedin { background: #0077b5; }
        .btn-instagram { background: linear-gradient(45deg, #f09433 0%, #e6683c 25%, #dc2743 50%, #cc2366 75%, #bc1888 100%); }
        .btn-youtube { background: #ff0000; }
        .btn-whatsapp { background: #25d366; }

        .share-section {
            margin-top: 40px;
            padding: 20px;
            background: #f9f9f9;
            border-radius: 8px;
            border-left: 4px solid #8035f0;
        }

        .share-section h3 {
            color: #1e1e2f;
            margin-bottom: 15px;
        }

        .share-buttons {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }

        .share-btn {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            color: white;
            font-weight: bold;
            cursor: pointer;
            transition: opacity 0.2s;
        }

        .share-btn:hover {
            opacity: 0.8;
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="social-container">
        <h1 class="social-header">🌐 Connect With Us</h1>

        <div class="social-links">
            <asp:LinkButton ID="btnFacebook" runat="server" CssClass="social-button btn-facebook" OnClick="btnFacebook_Click">
                <i class="fab fa-facebook-f"></i> Facebook
            </asp:LinkButton>

            <asp:LinkButton ID="btnTwitter" runat="server" CssClass="social-button btn-twitter" OnClick="btnTwitter_Click">
                <i class="fab fa-twitter"></i> Twitter
            </asp:LinkButton>

            <asp:LinkButton ID="btnLinkedIn" runat="server" CssClass="social-button btn-linkedin" OnClick="btnLinkedIn_Click">
                <i class="fab fa-linkedin-in"></i> LinkedIn
            </asp:LinkButton>

            <asp:LinkButton ID="btnInstagram" runat="server" CssClass="social-button btn-instagram" OnClick="btnInstagram_Click">
                <i class="fab fa-instagram"></i> Instagram
            </asp:LinkButton>

            <asp:LinkButton ID="btnYouTube" runat="server" CssClass="social-button btn-youtube" OnClick="btnYouTube_Click">
                <i class="fab fa-youtube"></i> YouTube
            </asp:LinkButton>

            <a href="#" class="social-button btn-whatsapp" onclick="shareOnWhatsApp(); return false;">
                <i class="fab fa-whatsapp"></i> WhatsApp
            </a>
        </div>

        <div class="share-section">
            <h3>📤 Share This Page</h3>
            <div class="share-buttons">
                <button class="share-btn btn-facebook" onclick="shareOn('facebook'); return false;">
                    <i class="fab fa-facebook-f"></i> Share on Facebook
                </button>
                <button class="share-btn btn-twitter" onclick="shareOn('twitter'); return false;">
                    <i class="fab fa-twitter"></i> Share on Twitter
                </button>
                <button class="share-btn btn-linkedin" onclick="shareOn('linkedin'); return false;">
                    <i class="fab fa-linkedin-in"></i> Share on LinkedIn
                </button>
            </div>
        </div>
    </div>

    <script>
        function shareOn(platform) {
            const url = window.location.href;
            const title = document.title;

            let shareUrl = '';
            switch(platform) {
                case 'facebook':
                    shareUrl = `https://www.facebook.com/sharer/sharer.php?u=${encodeURIComponent(url)}`;
                    break;
                case 'twitter':
                    shareUrl = `https://twitter.com/intent/tweet?url=${encodeURIComponent(url)}&text=${encodeURIComponent(title)}`;
                    break;
                case 'linkedin':
                    shareUrl = `https://www.linkedin.com/sharing/share-offsite/?url=${encodeURIComponent(url)}`;
                    break;
            }

            window.open(shareUrl, '_blank', 'width=600,height=400');
        }

        function shareOnWhatsApp() {
            const url = window.location.href;
            const title = document.title;
            const shareUrl = `https://api.whatsapp.com/send?text=${encodeURIComponent(title + ' ' + url)}`;
            window.open(shareUrl, '_blank');
        }
    </script>
</asp:Content>