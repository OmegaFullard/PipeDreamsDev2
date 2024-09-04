<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="PipeDreamsDev2.Products" %>

<!DOCTYPE html>


 <link rel="icon" href="images/favicon/favicon.ico" type="image/x-icon"/>
  <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
         <link rel="apple-touch-icon" sizes="180x180" href="images/favicon/apple-touch-icon.png"/>
<link rel="icon" type="image/png" sizes="32x32" href="images/favicon/favicon-32x32.png"/>
<link rel="icon" type="image/png" sizes="16x16" href="images/favicon/favicon-16x16.png"/>
<link rel="manifest" href="/site.webmanifest"/>
<link rel="mask-icon" href="/safari-pinned-tab.svg" color="#5bbad5"/>

                  <%--Logo--%>

            <a href="#" class="logo">
                <img src="images/PDLogo.png" alt="company logo" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
                  <h4 style="font-size: xx-large; font-weight: bold; font-style: italic; text-align: center;">Pipe Dreams Developers</h4>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Services Offered</title>
    	 <!-- Custom Styles-->
	 
	 
			 
			     <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/headers/"/>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3"/>

<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet"/>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/footers/"/>
	  <link href="App_Themes/styles.css" rel="stylesheet" />
    <link href="App_Themes/Page.css" rel="stylesheet" />
    <link href="App_Themes/dropdowns.css" rel="stylesheet" />
    <link href="App_Themes/headers.css" rel="stylesheet" />
    <link href="App_Themes/modals.css" rel="stylesheet" />
    <link href="App_Themes/pricing.css" rel="stylesheet" />
    <link href="App_Themes/sign-in.css" rel="stylesheet" />
	<link href="App_Themes/jumbotrons.css" rel="stylesheet" />
	
		  <link href="http://localhost:64954/Content/DataTables/css/dataTables.jqueryui.min.css" rel="stylesheet" />

    <link href="http://localhost:64954/css/font-awesome.css" rel="stylesheet" />

    <script src="http://localhost:64954/Scripts/jquery-3.4.1.slim.min.js"></script>

    <script src="http://localhost:64954/Scripts/popper.min.js"></script>
    <script src="http://localhost:64954/Scripts/bootstrap.min.js"></script>
	  <!-- Add icon library -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>

<script>
    $(document).ready(function () {
        $('#pw').keypress(function (e) {
            if (e.keyCode == 13)
                $('#GoBtn').click();
        });
    });
</script>
       
</head>
<body>
    <form id="form1" runat="server">
        <div>
           
    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        width: 100%;
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }

      .btn-bd-primary {
        --bd-violet-bg: #712cf9;
        --bd-violet-rgb: 112.520718, 44.062154, 249.437846;

        --bs-btn-font-weight: 600;
        --bs-btn-color: var(--bs-white);
        --bs-btn-bg: var(--bd-violet-bg);
        --bs-btn-border-color: var(--bd-violet-bg);
        --bs-btn-hover-color: var(--bs-white);
        --bs-btn-hover-bg: #6528e0;
        --bs-btn-hover-border-color: #6528e0;
        --bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
        --bs-btn-active-color: var(--bs-btn-hover-color);
        --bs-btn-active-bg: #5a23c8;
        --bs-btn-active-border-color: #5a23c8;
      }

      .bd-mode-toggle {
        z-index: 1500;
      }

      .bd-mode-toggle .dropdown-menu .active .bi {
        display: block !important;
      }
    </style>
	
	  <style>
.map {
Height: 400px;
Width: 100%;
}

</style>

<div class="dropdown position-fixed bottom-0 end-0 mb-3 me-3 bd-mode-toggle">
      <button class="btn btn-bd-primary py-2 dropdown-toggle d-flex align-items-center"
              id="bd-theme"
              type="button"
              aria-expanded="false"
              data-bs-toggle="dropdown"
              aria-label="Toggle theme (auto)">
        <svg class="bi my-1 theme-icon-active" width="1em" height="1em"><use href="#circle-half"></use></svg>
        <span class="visually-hidden" id="bd-theme-text">Toggle theme</span>
      </button>
      <ul class="dropdown-menu dropdown-menu-end shadow" aria-labelledby="bd-theme-text">
        <li>
          <button type="button" class="dropdown-item d-flex align-items-center" data-bs-theme-value="light" aria-pressed="false">
            <svg class="bi me-2 opacity-50 theme-icon" width="1em" height="1em"><use href="#sun-fill"></use></svg>
            Light
            <svg class="bi ms-auto d-none" width="1em" height="1em"><use href="#check2"></use></svg>
          </button>
        </li>
        <li>
          <button type="button" class="dropdown-item d-flex align-items-center" data-bs-theme-value="dark" aria-pressed="false">
            <svg class="bi me-2 opacity-50 theme-icon" width="1em" height="1em"><use href="#moon-stars-fill"></use></svg>
            Dark
            <svg class="bi ms-auto d-none" width="1em" height="1em"><use href="#check2"></use></svg>
          </button>
        </li>
        <li>
          <button type="button" class="dropdown-item d-flex align-items-center active" data-bs-theme-value="auto" aria-pressed="true">
            <svg class="bi me-2 opacity-50 theme-icon" width="1em" height="1em"><use href="#circle-half"></use></svg>
            Auto
            <svg class="bi ms-auto d-none" width="1em" height="1em"><use href="#check2"></use></svg>
          </button>
        </li>
      </ul>
    </div>


    <div class="container">
      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
        <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
          <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use href="#bootstrap"/></svg>
        </a>

        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
          <li><a href="Default.aspx" class="nav-link px-2 text-secondary">Home</a></li>
          <li><a href="Services.aspx" class="nav-link px-2 text-white">Services</a></li>
          <li><a href="Products.aspx" class="nav-link px-2 text-white">Pricing</a></li>
          <li><a href="Contact.aspx" class="nav-link px-2 text-white">Contact</a></li>
          <li><a href="About.aspx" class="nav-link px-2 text-white">About</a></li>
             <li><a href="Support.aspx" class="nav-link px-2 text-white">Support</a></li>
        </ul>

          <input type="search" class="form-control form-control-dark text-bg-dark" placeholder="Search..." aria-label="Search"/>
        

        
      </div>
    </div>
  

  
<svg xmlns="http://www.w3.org/2000/svg" class="d-none">
  <symbol id="check" viewBox="0 0 16 16">
    <title>Check</title>
    <path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"/>
  </symbol>
</svg>

<div class="container py-3">
  <header>
    <div class="d-flex flex-column flex-md-row align-items-center pb-3 mb-4 border-bottom">
      <a href="/" class="d-flex align-items-center link-body-emphasis text-decoration-none"></a>
      <nav>
	  
	  </nav>
    </div>
      <hr />
    <div class="pricing-header p-3 pb-md-4 mx-auto text-center">
      <h1 class="display-4 fw-normal text-body-emphasis">Pipe Dreams Developers</h1>
        <asp:Image ID="logo" runat="server" ImageUrl="~/images/PDLogo.png"  BorderColor="#0eb7a1" BorderStyle="Solid" BorderWidth="1px" Height="300px" style="margin-top: 5px" Width="300px" />
      <p class="fs-5 text-body-secondary">Compare our competitive pricing below</p>
    </div>
  </header>
    <hr />
        </div>
     <main>


    <div class="row row-cols-1 row-cols-md-3 mb-3 text-center">
      <div class="col">
        <div class="card mb-4 rounded-3 shadow-sm">
          <div class="card-header py-3">
            <h4 class="my-0 fw-normal">Free</h4>
          </div>
          <div class="card-body">
            <h4 class="card-title pricing-card-title">$0<small class="text-body-secondary fw-light">/mo</small></h4>
            <ul class="list-unstyled mt-3 mb-4">
              <li>5 users included</li>
              <li>20 GB of storage</li>
              <li>limited email support</li>
              
            </ul>
            <button type="button" class="w-100 btn btn-lg btn-outline-primary">Sign up for free</button>
          </div>
        </div>
      </div>
      <div class="col">
        <div class="card mb-4 rounded-3 shadow-sm">
          <div class="card-header py-3">
            <h4 class="my-0 fw-normal">Pro</h4>
          </div>
          <div class="card-body">
            <h4 class="card-title pricing-card-title">$99<small class="text-body-secondary fw-light">/mo</small></h4>
            <ul class="list-unstyled mt-3 mb-4">
              <li>10 users included</li>
              <li>100 GB of storage</li>
              <li>Priority email support</li>
              <li>Royal City Notification Center</li>
            </ul>
            <button type="button" class="w-100 btn btn-lg btn-primary">Get started</button>
          </div>
        </div>
      </div>
      <div class="col">
        <div class="card mb-4 rounded-3 shadow-sm border-primary">
          <div class="card-header py-3 text-bg-primary border-primary">
            <h4 class="my-0 fw-normal">Enterprise</h4>
          </div>
          <div class="card-body">
            <h4 class="card-title pricing-card-title">$299<small class="text-body-secondary fw-light">/mo</small></h4>
            <ul class="list-unstyled mt-3 mb-4">
              <li>20 users included</li>
              <li>unlimited storage</li>
              <li>Phone and email support 24/7</li>
              <li>Royal City Notification Center</li>
            </ul>
            <button type="button" class="w-100 btn btn-lg btn-primary">Contact us</button>
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
      <a href="Cart.aspx">Continue to Checkout!</a>
      
  </main>
    <br />
     <br/>
             <br/>
            <a href="default.aspx"><< Back to Home</a>
             <br/>
             <br/>
    <hr />
  <footer class="pt-4 my-md-5 pt-md-5 border-top">
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
          <li class="mb-1"><a class="link-secondary text-decoration-none" href="#">Team</a></li>
          <li class="mb-1"><a class="link-secondary text-decoration-none" href="#">Locations</a></li>
          <li class="mb-1"><a class="link-secondary text-decoration-none" href="#">Privacy</a></li>
          <li class="mb-1"><a class="link-secondary text-decoration-none" href="#">Terms</a></li>
        </ul>
      </div>
    </div>
  </footer>
</div>
<script src="../assets/dist/js/bootstrap.bundle.min.js"></script>

<div class="b-example-divider"></div>

<div class="container">
  <footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
    <div class="col-md-4 d-flex align-items-center">
      <a href="/" class="mb-3 me-2 mb-md-0 text-body-secondary text-decoration-none lh-1">
      
      </a>
      <span class="mb-3 mb-md-0 text-body-secondary">&copy; 2024 Pipe Dreams Developers</span>
    </div>

    <ul class="nav col-md-4 justify-content-end list-unstyled d-flex">
      <li class="ms-3"><a class="text-body-secondary" href="#"><svg class="bi" width="24" height="24"><use href="#twitter"/></svg></a></li>
      <li class="ms-3"><a class="text-body-secondary" href="#"><svg class="bi" width="24" height="24"><use href="#instagram"/></svg></a></li>
      <li class="ms-3"><a class="text-body-secondary" href="#"><svg class="bi" width="24" height="24"><use href="#facebook"/></svg></a></li>
    </ul>
  </footer>
</div>
  
            </form>
</body>
</html>
