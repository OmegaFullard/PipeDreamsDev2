<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Products.aspx.cs" Inherits="PipeDreamsDev2.Products" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   
      
          <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/pricing/">

    

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">

<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">


    
    <!-- Custom styles for this template -->
    <link href="pricing.css" rel="stylesheet">
  
<svg xmlns="http://www.w3.org/2000/svg" class="d-none">
  <symbol id="check" viewBox="0 0 16 16">
    <title>Check</title>
    <path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"/>
  </symbol>
</svg>

<div class="container py-3">
 
    <div class="d-flex flex-column flex-md-row align-items-center pb-3 mb-4 border-bottom">
      <a href="/" class="d-flex align-items-center link-body-emphasis text-decoration-none"></a>
      <nav>
	  
	  </nav>
    </div>
      <hr />
    <div class="pricing-header p-3 pb-md-4 mx-auto text-center">
      
     <center> <h4><strong>Compare our competitive pricing below</strong></h4></center>
    </div>

    <hr />
        </div>

    <!-- Success Message -->
    <asp:Panel ID="pnlSuccess" runat="server" Visible="false" CssClass="alert alert-success alert-dismissible fade show" role="alert">
        <i class="fa fa-check-circle"></i> <strong>Success!</strong> <asp:Label ID="lblSuccessMessage" runat="server"></asp:Label> has been added to your cart.
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </asp:Panel>

    <div class="row row-cols-1 row-cols-md-3 mb-3 text-center">
      <div class="col">
        <div class="card mb-4 rounded-3 shadow-sm">
          <div class="card-header py-3">
            <h4 class="my-0 fw-normal">Free</h4>
          </div>
          <div class="card-body">
          <h1 class="card-title pricing-card-title">$0<small class="text-body-secondary fw-light">/mo</small></h1>
            <ul class="list-unstyled mt-3 mb-4">
              <li>5 users included</li>
              <li>20 GB of storage</li>
              <li>limited email support</li>
              
            </ul>
            <asp:Button ID="btnFree" runat="server" Text="Sign up for free" 
                CssClass="w-100 btn btn-lg btn-outline-primary" 
                style="color: #2097db;" 
                OnClick="btnAddToCart_Click" 
                CommandArgument="Free" />
          </div>
        </div>
      </div>
      <div class="col">
        <div class="card mb-4 rounded-3 shadow-sm">
          <div class="card-header py-3">
            <h4 class="my-0 fw-normal">Pro</h4>
          </div>
          <div class="card-body">
            <h4 class="card-title pricing-card-title">$99<small class="text-body-secondary fw-dark">/mo</small></h4>
            <ul class="list-unstyled mt-3 mb-4">
              <li>10 users included</li>
              <li>100 GB of storage</li>
              <li>Priority email support</li>
              <li>Royal City Notification Center</li>
            </ul>
            <asp:Button ID="btnPro" runat="server" Text="Buy Now" 
                CssClass="w-100 btn btn-lg btn-primary" 
                OnClick="btnAddToCart_Click" 
                CommandArgument="Pro" />
          </div>
        </div>
      </div>
      <div class="col">
        <div class="card mb-4 rounded-3 shadow-sm border-primary">
          <div class="card-header py-3 text-bg-primary border-primary">
            <h4 class="my-0 fw-normal">Enterprise</h4>
          </div>
          <div class="card-body">
            <h4 class="card-title pricing-card-title">$299<small class="text-body-secondary fw-dark">/mo</small></h4>
            <ul class="list-unstyled mt-3 mb-4">
              <li>20 users included</li>
              <li>unlimited storage</li>
              <li>Phone and email support 24/7</li>
              <li>Royal City Notification Center</li>
            </ul>
            <asp:Button ID="btnEnterprise" runat="server" Text="Buy Now" 
                CssClass="w-100 btn btn-lg btn-primary mb-2" 
                OnClick="btnAddToCart_Click" 
                CommandArgument="Enterprise" />
            <a href="mailto:Sales@example.com" class="w-100 btn btn-lg btn-outline-primary">Questions</a>
          </div>
        </div>
      </div>
    </div>
      <hr />
    <h2 class="display-6 text-center mb-4">Compare plans</h2>

    <div class="table-responsive">
      <table class="table text-center">
        <thead>
          <tr>
            <th style="width: 34%;"></th>
            <th style="width: 22%;">Free</th>
            <th style="width: 22%;">Pro</th>
            <th style="width: 22%;">Enterprise</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <th scope="row" class="text-start">Public</th>
            <td><svg class="bi bi-check" width="24" height="24"><use href="#check"/></svg></td>
            <td><svg class="bi bi-check" width="24" height="24"><use href="#check"/></svg></td>
            <td><svg class="bi bi-check" width="24" height="24"><use href="#check"/></svg></td>
          </tr>
          <tr>
            <th scope="row" class="text-start">Private</th>
            <td></td>
            <td><svg class="bi bi-check" width="24" height="24"><use href="#check"/></svg></td>
            <td><svg class="bi bi-check" width="24" height="24"><use href="#check"/></svg></td>
          </tr>
        </tbody>

        <tbody>
          <tr>
            <th scope="row" class="text-start">Permissions</th>
            <td><svg class="bi bi-check" width="24" height="24"><use href="#check"/></svg></td>
            <td><svg class="bi bi-check" width="24" height="24"><use href="#check"/></svg></td>
            <td><svg class="bi bi-check" width="24" height="24"><use href="#check"/></svg></td>
          </tr>
          <tr>
            <th scope="row" class="text-start">Sharing</th>
            <td></td>
            <td><svg class="bi bi-check" width="24" height="24"><use href="#check"/></svg></td>
            <td><svg class="bi bi-check" width="24" height="24"><use href="#check"/></svg></td>
          </tr>
          <tr>
            <th scope="row" class="text-start">Unlimited members</th>
            <td></td>
            <td></td>
            <td><svg class="bi bi-check" width="24" height="24"><use href="#check"/></svg></td>
          </tr>
          <tr>
            <th scope="row" class="text-start">Extra security</th>
            <td></td>
            <td></td>
            <td><svg class="bi bi-check" width="24" height="24"><use href="#check"/></svg></td>
          </tr>
        </tbody>
      </table>
    </div>
    
      <br />
      <br />
    
    <center>
        <asp:HyperLink ID="lnkViewCart" runat="server" NavigateUrl="~/Cart.aspx" CssClass="btn btn-success btn-lg" Visible="false">
            <i class="fa fa-shopping-cart"></i> View Cart & Checkout
        </asp:HyperLink>
      
    </center>
             <br/>
            <a href="default.aspx"><< Back to Home</a>
         
             <br/>
    <hr />

    <div class="row">
      <div class="col-12 col-md">
        <img src="images/PDLogo.png" alt="logo" style="width:50px;height:50px;" />
        <small class="d-block mb-3 text-body-secondary">&copy; 2018–2024</small>
      </div>
        <br />
        <hr />
      <div class="col-4 col-md">
        <h5>Features</h5>
        <ul class="list-unstyled text-small">
          <li class="mb-1"><a class="link-secondary text-decoration-none" href="#">Custom Design</a></li>
          <li class="mb-1"><a class="link-secondary text-decoration-none" href="#">Free Consultation</a></li>
          <li class="mb-1"><a class="link-secondary text-decoration-none" href="#">Custom Logos</a></li>
          <li class="mb-1"><a class="link-secondary text-decoration-none" href="#">Developer Portfolio</a></li>
          <li class="mb-1"><a class="link-secondary text-decoration-none" href="#">Leagues and Tournaments</a></li>
          
        </ul>
      </div>
      <div class="col-4 col-md">
        <h5>Resources</h5>
        <ul class="list-unstyled text-small">
          <li class="mb-1"><a class="link-secondary text-decoration-none" href="#">Royal City Coders</a></li>
          <li class="mb-1"><a class="link-secondary text-decoration-none" href="#">Dev Ops Training</a></li>
          <li class="mb-1"><a class="link-secondary text-decoration-none" href="#">Code Camp</a></li>
          <li class="mb-1"><a class="link-secondary text-decoration-none" href="#">Tech Times</a></li>
        </ul>
      </div>
      <div class="col-4 col-md">
        <h5>About</h5>
        <ul class="list-unstyled text-small">
          <li class="mb-1"><a class="link-secondary text-decoration-none" href="Team.aspx">Team</a></li>
          <li class="mb-1"><a class="link-secondary text-decoration-none" href="Directions.aspx">Locations</a></li>
          <li class="mb-1"><a class="link-secondary text-decoration-none" href="Privacy.aspx">Privacy</a></li>
          <li class="mb-1"><a class="link-secondary text-decoration-none" href="Terms.aspx">Terms</a></li>
        </ul>
      </div>
    </div>

   <script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
</asp:Content>