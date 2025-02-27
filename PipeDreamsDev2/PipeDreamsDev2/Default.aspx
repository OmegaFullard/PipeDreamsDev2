<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master"   CodeBehind="Default.aspx.cs" Inherits="PipeDreamsDev2._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<script src="../assets/js/color-modes.js"></script>
    
        
               <div style="width:1000px;margin-left: auto;margin-right: auto;">
             
        <aside id="leftmenu">
          <center><img src="images/gamecontrollers.png" alt="controllers" style="width:250px;height:250px;" /></center>
            <br />
       
                <h4 style="text-align: center;">Browse Games</h4>
           
            <br />
            <center>

            <input type="text" id="searchInput" placeholder="Search...">
        <button type="button" onclick="performSearch()">Search</button>

                <div id="searchResults"></div>

                </center>
        </aside>

 
 </div>
  <br />
        <section class="about">
            <div class="container">
               
 <center><img src="images/gamergirl.png" alt="gamer" style="width:250px;height:250px;" /></center>

  <br />
                <center><h4>About Pipe Dreams Developers</h4></center>
<br />
                <p>Pipe Dreams Developers is committed to delivering high-quality products and services that enhance the gaming experience for players around the world.</p> 
                <br />
<p>Pipe Dreams Developers is a passionate team of game designers, developers, and storytellers dedicated to creating unique and engaging gaming experiences. 
Founded on the principles of innovation and creativity, we strive to push the boundaries of what’s possible in the gaming world. Our mission is to craft games that not only entertain but also inspire and connect players globally.

At Pipe Dreams Developers, we believe in the power of imagination and the magic of storytelling. 
Our diverse team brings together a wealth of experience and a shared love for gaming, ensuring that every project we undertake is infused with creativity and excellence. 
From concept to launch, we are committed to delivering high-quality games that leave a lasting impact on our audience.

Join us on our journey as we continue to dream big and create the next generation of unforgettable gaming experiences.
</p>
<center><h4>Mission</h4></center>

“At Pipe Dreams Developers, our mission is to craft immersive and innovative gaming experiences that captivate and inspire players around the world. 
We are dedicated to pushing the boundaries of creativity and technology, fostering a community where imagination thrives, and delivering games that leave a lasting impact on our audience.”

                
            </div>
        </section>
<br />
    <script src="search.js"></script>
</asp:Content>
