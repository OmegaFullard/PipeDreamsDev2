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
        <p class="lead text-body-secondary">Examples of projects recently completed by our talented team of developers. Be sure to contact us for further questions.</p>
        <p>
          <a href="Contact.aspx" class="btn btn-info my-2">Contact</a>
          <a href="About.aspx" class="btn btn-info my-2">About</a>
        </p>
      </div>
    </div>
  </section>

  <div class="album py-5 bg-body-tertiary">
    <div class="container">

      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
        <div class="col">
          <div class="card shadow-sm">
            <div class="card-body">
              <p class="card-text">Project for a bakery <strong>"AJ's Sweets"</strong> with custom logo and color schemes. Mobile Ordering Application Design in Progress</p>
              <div class="d-flex justify-content-between align-items-center">
                  <br/>
 <img src="images/ajslogo.png" alt="logo" class="img-fluid mb-2 Border-Radius:25px;" />

 <img src="images/pies.png" alt="pie" style="width:75px;height:75px; Border-Radius:25px;" />

  <br />

                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                </div>
                <small class="text-body-secondary">Sweets and Treats</small>
              </div>
            </div>
          </div>
        </div>
          
        <div class="col">
          <div class="card shadow-sm">
           
            <div class="card-body">
              <p class="card-text">Web Design Project for newly opened <strong>LoStylz Hair Salon</strong> with custom logo, design and color schemes. Appointment Booker Mobile Application in development phase.</p>
              <div class="d-flex justify-content-between align-items-center">
                  <img src="images/LogoLoStylz.png" alt="LogoLoStylz" style="width:250px;height:250px; Border-Radius:25px;" />

 <img src="images/10offPromo.png" alt="promo flyer" style="width:250px;height:250px; Border-Radius:25px;" />
 
  <br />
 
  <br />

                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                </div>
               <small class="text-body-secondary">Back to School Promo</small>

              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
           <div class="card-body">
              <p class="card-text">Web Design Project devoloped for <strong>Royal City Basketball League</strong> with custom logo, design, and color schemes. Mobile Game App "Royal All-Stars" in progress</p>
              <div class="d-flex justify-content-between align-items-center">

                  <br/>
 <img src="images/player.png" alt="player" style="width:250px;height:250px; Border-Radius:25px;" />

 <img src="images/RCLogo.png" alt="rclogo" style="width:250px;height:250px; Border-Radius:25px;" />

 <img src="images/RCBasketball.png" alt="rclogo2" style="width:250px;height:250px; Border-Radius:25px;" />
 
 <img src="images/basketball1.png" alt="bbtournament" style="width:250px;height:250px; Border-Radius:25px;" />

 <img src="images/basketball2.png" alt="bbgame" style="width:250px;height:250px; Border-Radius:25px;" />

  <br />            

 
  <br />
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                </div>
             

              </div>
            </div>
          </div>
        </div>

        <div class="col">
          <div class="card shadow-sm">
           <div class="card-body">
              <p class="card-text">Mobile Game Design Project designed for <strong>Royal City Dreamers</strong> with custom logo and color schemes. Simulated dating game.</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                </div>
             <small class="text-body-secondary">more pics to come!</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
           <div class="card-body">
              <p class="card-text">Mobile Game content created for <strong>Lost Angels Corporation</strong>. First Person Shooter game with heads up display, in-game purchases, advertisements, free/paid option, and more. </p>
              <div class="d-flex justify-content-between align-items-center">
                  <br/>
<img src="images/fps1.png" alt="fpsgame" style="width:250px;height:250px; Border-Radius:25px;" />
 
 
  <br />
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                </div>
             
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
            <div class="card-body">
              <p class="card-text">Website Application Project for <strong>Lucky Rollers Casino and Games</strong>. Online gambling website with real time updates, virtual currency, and progression jackpots.</p>
              <div class="d-flex justify-content-between align-items-center">
                  <br/>
 <img src="images/casino.png" alt="casino" style="width:250px;height:250px; Border-Radius:25px;" />

 <img src="images/casino2.png" alt="casino" style="width:250px;height:250px; Border-Radius:25px;" />

 <img src="images/casino3.png" alt="casino" style="width:250px;height:250px; Border-Radius:25px;" />
 
  <br />
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                </div>
               <small class="text-body-secondary">Casino Game Screenshots</small>
              </div>
            </div>
          </div>
        </div>

        
    </div>
  </div>
      </div>


  <div class="container">
    <p class="float-end mb-1">
      <a href="#">Back to top</a>
    </p>
    
  </div>

<script src="../assets/dist/js/bootstrap.bundle.min.js"></script>



<script src="../assets/dist/js/bootstrap.bundle.min.js"></script>

</asp:content>
