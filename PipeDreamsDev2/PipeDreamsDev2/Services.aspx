<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master"  CodeBehind="Services.aspx.cs" Inherits="PipeDreamsDev2.Services" %>


  <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

      <asp:PlaceHolder runat="server">
      <%: Scripts.Render("~/bundles/modernizr") %>
  </asp:PlaceHolder>

  <webopt:bundlereference runat="server" path="~/Content/css" />


  <section class="py-5 text-center container">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
        <h1 class="fw-light">Completed and Current Projects</h1>
        <p class="lead text-secondary">Examples of projects recently completed by our talented team of developers. Be sure to contact us for further questions.</p>
        <p>
          <a href="Contact.aspx" class="btn btn-info my-2">Contact</a>
          <a href="About.aspx" class="btn btn-info my-2">About</a>
        </p>
      </div>
    </div>
  </section>

  <div class="card-group">
  <div class="card">
    <img class="card-img-top" src="images/ajslogo.png" alt="logo" style="width:100px;height:100px; Border-Radius:25px;"/>
    <div class="card-body">
      <h5 class="card-title">AJ's Sweets</h5>
      <p class="card-text">Project for a bakery <strong>"AJ's Sweets"</strong> with custom logo and color schemes.</p>
		<p>Mobile Ordering Application Design in Progress</p>
              
      <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
    </div>
  </div>
  <div class="card">
    <img class="card-img-top" src="images/LogoLoStylz.png" alt="LogoLoStylz" style="width:100px;height:100px; Border-Radius:25px;"/ >
    <div class="card-body">
      <h5 class="card-title">Lo Stylz Salon</h5>
      <p class="card-text">Web Design Project for newly opened <strong>LoStylz Hair Salon</strong></p> 
	  <p>with custom logo, design and color schemes. Appointment Booker Mobile Application in development phase.</p>
      <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
    </div>
  </div>
  <div class="card">
    <img class="card-img-top" src="images/basketball1.png" alt="bbtournament" style="width:100px;height:100px; Border-Radius:25px;"/ >
    <div class="card-body">
      <h5 class="card-title">Royal City</h5>
      <p class="card-text">Web Design Project devoloped for <strong>Royal City Basketball League</strong> with custom logo, design, and color schemes.</P> 
	  <p>Mobile Game App "Royal All-Stars" in progress!</p>             
      <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
    </div>
  </div>
  
  <div class="card">
    <img class="card-img-top" src="images/RCDLogo.png" alt="dating app" style="width:100px;height:100px; Border-Radius:25px;"/>
    <div class="card-body">
      <h5 class="card-title">Royal City Dreamers </h5>
      <p class="card-text">Mobile Game Design Project designed for <strong>Royal City Dreamers</strong> with custom logo and color schemes. Simulated dating game.</p>
	
      <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
    </div>
  </div>
  <div class="card">
    <img class="card-img-top" src="images/fps1.png" alt="fpsgame" style="width:100px;height:100px; Border-Radius:25px;"/ >
    <div class="card-body">
      <h5 class="card-title">Lost Angels Corporation</h5>
      <p class="card-text">Mobile Game conted created for <strong>Lost Angels Corporation</strong>.</p> 
	  <p>First Person Shooter game with heads up display, in-game purchases, advertisements, free/paid option, and more.</p> 
	    <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
    </div>
  </div>
  <div class="card">
    <img class="card-img-top" src="images/LRLogo.png" alt="Lucky Rollers Logo" style="width:100px;height:100px; Border-Radius:25px;"/>
    <div class="card-body">
      <h5 class="card-title">Lucky Rollers Casino and Games</h5>
      <p class="card-text">Website Application Project for <strong>Lucky Rollers Casino and Games</strong>.</p>
	  <p>Mobile Game App "Royal All-Stars" in progress!</p>             
      <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
    </div>
  </div>
  
  
</div>

        <center>
 <div class="scroll-container">
  
            <img src="images/ajslogo.png" alt="logo" style="width:100px;height:100px; Border-Radius:25px;"/>
            <img src="images/pies.png" alt="pie" style="width:100px;height:100px; Border-Radius:25px;"/>
            <img src="images/LogoLoStylz.png" alt="LogoLoStylz" style="width:100px;height:100px; Border-Radius:25px;"/>
            <img src="images/10offPromo.png" alt="promo flyer" style="width:100px;height:100px; Border-Radius:25px;"/>  
            <img src="images/RCLogo.png" alt="rclogo" style="width:100px;height:100px; Border-Radius:25px;"/>
			 <img src="images/player.png" alt="player" style="width:100px;height:100px; Border-Radius:25px;"/>
            <img src="images/RCBasketball.png" alt="rclogo2" style="width:100px;height:100px; Border-Radius:25px;"/>
            <img src="images/basketball1.png" alt="bbtournament" style="width:100px;height:100px; Border-Radius:25px;"/>
            <img src="images/basketball2.png" alt="bbgame" style="width:100px;height:100px; Border-Radius:25px;"/>
			<img src="images/casino.png" alt="casino" style="width:100px;height:100px; Border-Radius:25px;"/>
            <img src="images/casino2.png" alt="casino" style="width:100px;height:100px; Border-Radius:25px"/>
            <img src="images/casino3.png" alt="casino" style="width:100px;height:100px; Border-Radius:25px;"/>

</div>
             </center>
  <div class="container">
    <p class="float-end mb-1">
      <a href="#">Back to top</a>
    </p>
    
  </div>

<script src="../assets/dist/js/bootstrap.bundle.min.js"></script>



<script src="../assets/dist/js/bootstrap.bundle.min.js"></script>

</asp:content>
