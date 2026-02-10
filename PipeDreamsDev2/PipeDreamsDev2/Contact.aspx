<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="PipeDreamsDev2.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container my-5">
        <div class="row">
            <div class="col-lg-6">
                <center><img src="images/PDLogo.png" alt="company logo" style="width:250px;height:250px;" /></center>
                <h2>Contact Us</h2>
                <p class="lead">Have a question or need assistance? Fill out the form and we'll get back to you as soon as possible.</p>
                <br />

                <!-- Contact Form -->
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h4 class="card-title mb-4">Send us a message</h4>
                        
                        <asp:Panel ID="pnlSuccess" runat="server" Visible="false" CssClass="alert alert-success" role="alert">
                            <i class="fa fa-check-circle"></i> <strong>Success!</strong> Your message has been sent successfully. We'll get back to you soon.
                        </asp:Panel>
                        
                        <asp:Panel ID="pnlError" runat="server" Visible="false" CssClass="alert alert-danger" role="alert">
                            <i class="fa fa-exclamation-circle"></i> <strong>Error!</strong> 
                            <asp:Label ID="lblError" runat="server"></asp:Label>
                        </asp:Panel>

                        <div class="form-group mb-3">
                            <label for="txtName">Full Name <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter your full name" MaxLength="100"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" 
                                ErrorMessage="Name is required" CssClass="text-danger" Display="Dynamic" ValidationGroup="ContactForm"></asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group mb-3">
                            <label for="txtEmail">Email Address <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="your.email@example.com" MaxLength="100"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" 
                                ErrorMessage="Email is required" CssClass="text-danger" Display="Dynamic" ValidationGroup="ContactForm"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                                ErrorMessage="Please enter a valid email address" CssClass="text-danger" Display="Dynamic" 
                                ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$" ValidationGroup="ContactForm"></asp:RegularExpressionValidator>
                        </div>

                        <div class="form-group mb-3">
                            <label for="txtPhone">Phone Number</label>
                            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="(123) 456-7890" MaxLength="20"></asp:TextBox>
                        </div>

                        <div class="form-group mb-3">
                            <label for="ddlSubject">Subject <span class="text-danger">*</span></label>
                            <asp:DropDownList ID="ddlSubject" runat="server" CssClass="form-control">
                                <asp:ListItem Value="" Text="-- Select a subject --"></asp:ListItem>
                                <asp:ListItem Value="General Inquiry" Text="General Inquiry"></asp:ListItem>
                                <asp:ListItem Value="Technical Support" Text="Technical Support"></asp:ListItem>
                                <asp:ListItem Value="Sales" Text="Sales"></asp:ListItem>
                                <asp:ListItem Value="Billing" Text="Billing"></asp:ListItem>
                                <asp:ListItem Value="Feedback" Text="Feedback"></asp:ListItem>
                                <asp:ListItem Value="Other" Text="Other"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvSubject" runat="server" ControlToValidate="ddlSubject" 
                                InitialValue="" ErrorMessage="Please select a subject" CssClass="text-danger" Display="Dynamic" ValidationGroup="ContactForm"></asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group mb-3">
                            <label for="txtMessage">Message <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" TextMode="MultiLine" 
                                Rows="6" placeholder="Enter your message here..." MaxLength="2000"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvMessage" runat="server" ControlToValidate="txtMessage" 
                                ErrorMessage="Message is required" CssClass="text-danger" Display="Dynamic" ValidationGroup="ContactForm"></asp:RequiredFieldValidator>
                            <small class="form-text text-muted">Maximum 2000 characters</small>
                        </div>

                        <div class="form-group">
                            <asp:Button ID="btnSubmit" runat="server" Text="Send Message" CssClass="btn btn-primary btn-lg" 
                                OnClick="btnSubmit_Click" ValidationGroup="ContactForm" />
                            <asp:Button ID="btnClear" runat="server" Text="Clear Form" CssClass="btn btn-secondary btn-lg ms-2" 
                                OnClick="btnClear_Click" CausesValidation="false" />
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-6">
                <h3 class="mb-4">Contact Information</h3>
                
                <div class="card mb-4">
                    <div class="card-body">
                        <h5 class="card-title"><i class="fa fa-phone"></i> Phone</h5>
                        <p class="card-text">
                            <a href="tel:2678881234">267.888.1234</a>
                        </p>
                    </div>
                </div>

                <div class="card mb-4">
                    <div class="card-body">
                        <h5 class="card-title"><i class="fa fa-envelope"></i> Email</h5>
                        <p class="card-text">
                            <strong>Support:</strong> <a href="mailto:Support@example.com">Support@example.com</a><br />
                            <strong>Marketing:</strong> <a href="mailto:Marketing@example.com">Marketing@example.com</a><br />
                            <strong>Sales:</strong> <a href="mailto:Sales@example.com">Sales@example.com</a>
                        </p>
                    </div>
                </div>

                <div class="card mb-4">
                    <div class="card-body">
                        <h5 class="card-title"><i class="fa fa-map-marker"></i> Location</h5>
                        <p class="card-text">
                            We are located in the historical district of Royal City Pennsylvania.<br /><br />
                            <strong>Pipe Dreams Developers</strong><br />
                            1234 Dreams Way Suite 15<br />
                            Royal City, PA 19106
                        </p>
                        <a href="Directions.aspx" class="btn btn-outline-primary">Get Directions</a>
                    </div>
                </div>

                <div class="card">
                    <div class="card-body p-0">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m16!1m12!1m3!1d12234.543958929013!2d-75.16621169999999!3d39.94953124999999!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!2m1!1s39.57.09%2C75.10.14.8!5e0!3m2!1sen!2sus!4v1723056453703!5m2!1sen!2sus" 
                            width="100%" height="300" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                    </div>
                </div>

                <div class="card mt-4 bg-light">
                    <div class="card-body">
                        <h5 class="card-title"><i class="fa fa-clock-o"></i> Business Hours</h5>
                        <p class="card-text mb-0">
                            <strong>Monday - Friday:</strong> 9:00 AM - 6:00 PM<br />
                            <strong>Saturday:</strong> 10:00 AM - 4:00 PM<br />
                            <strong>Sunday:</strong> Closed
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>