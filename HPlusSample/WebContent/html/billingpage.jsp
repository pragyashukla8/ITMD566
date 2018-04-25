<!DOCTYPE html>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.test.beans.Cart"%>
<%@page import="com.test.beans.Users"%>
<%@page import="com.test.beans.BillingData"%>
<%@page import="java.util.List"%>

 <html lang="en">

 <head>
 <meta charset="UTF-8">
 <title>Auto Part</title>
 <link rel="stylesheet" href="css/style.css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
 <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.min.js"></script>

 <!-- Latest compiled and minified CSS -->
 <!-- Latest compiled and minified CSS -->
 <style>
   * {
        box-sizing: border-box;
     }

 .row {
        display: -ms-flexbox;
        /* IE10 */
        display: flex;
        -ms-flex-wrap: wrap;
        /* IE10 */
        flex-wrap: wrap;
        margin: 0 -16px;
      }

 .col-25 {
            -ms-flex: 25%;
            /* IE10 */
            flex: 25%;
         }

  .col-50 {
             -ms-flex: 50%;
                  /* IE10 */
                  flex: 50%;
                }

                .col-75 {
                  -ms-flex: 75%;
                  /* IE10 */
                  flex: 75%;
                }

                .col-25,
                .col-50,
                .col-75 {
                  padding: 0 16px;
                }



                input[type=text] {
                  width: 100%;
                  margin-bottom: 20px;
                  padding: 12px;
                  border: 1px solid #f8f8f8;
                  border-radius: 3px;
                }

                label {
                  margin-bottom: 10px;
                  display: block;
                }

                .icon-container {
                  margin-bottom: 20px;
                  padding: 7px 0;
                  font-size: 24px;
                }

                .btn {

                  background-color: #6495ED;
                  color: white;
                  padding: 12px;
                  margin: 10px 0;
                  border: none;
                  width: 100%;
                  border-radius: 3px;
                  cursor: pointer;
                  font-size: 17px;
                }

                .btn:hover {
                  background-color: #45a049;
                }

                a {
                  color: #2196F3;
                }

                hr {
                  border: 1px solid lightgrey;
                }


                /* Set height of body and the document to 100% */

                body,
                html {

                  font-family: Raleway, Helvetica, Arial, sans-serif;
                }

                h2 {
                  color: #6495ED;
                }

                h3 {
                  color: #6495ED;
                  margin-bottom: 10px;
                }

                /* Style tab links */

                .tablink {
                  background-color: white;
                  color: black;
                  float: left;
                  border: none;
                  outline: none;
                  cursor: pointer;
                  padding: 14px 16px;
                  font-size: 18px;
                  width: 100%;
                  font-weight: bold;
                }

                .tablink:hover {
                  background-color: #E8E8E8;
                }

                /* Style the tab content (and add height:100% for full page content) */

                .tabcontent {
                  color: black;
                  display: none;
                  padding: 100px 20px;
                  height: 100%;

                }

                #Cart {
                  background-color: #F8F8F8;

                }

                #Info {

                  background-color: #F8F8F8;
                  padding: 5px 20px 15px 20px;
                  border: 1px solid lightgrey;
                  border-radius: 3px;
                }

                #Review {
                  background-color: #F8F8F8;

                }

                #Summary {
                  background-color: #F8F8F8;

                }

                #infoheader {
                  margin-top: 93px;
                }


                #carttable {
                  border-collapse: collapse;
                  background-color: F8F8F8;
                  padding: 10px;
                  width: 100%;
                  text-align: center;
                  vertical-align: top;

                }

                .cartinput {
                  border: none;
                  background-color: #f8f8f8;
                  text-align: center;
                  outline: 0;
                }

                .rmv {
                  background-color: #f8f8f8;
                  border: none;
                  outline: 0;
                }

                input[type=number] {
                  margin-bottom: 19px;
                  height: 40px;
                  opacity: 4;
                  border: none;
                  background-color: #f8f8f8;
                  text-align: center;
                }

                #wrapper {
                  width: 100%;
                  height: 100px;
                }

                #btnn {
                  position: relative;
                  margin: -20px -50px;
                  width: 100px;
                  top: 45%;
                  left: 35%;
                }






                ​
                /* only the submit button is matched by this selector,
   but to be sure you could use an id or class for that button */
              </style>

            </head>

            <body>
              <!-- Header -->
              <header id="home" class="header">
                <nav class="nav" role="navigation">
                  <div class="container nav-elements">
                    <div class="branding">
                      <a href="#home"><img src="images/logo.png"
						alt="Logo - H Plus Sports"></a>
                    </div>
                    <!-- branding -->
                    <ul class="navbar">
                      <li><a href="home">Home</a></li>
                      <li><a href="login">Logout</a></li>
                    </ul>
                    <!-- navbar -->
                  </div>
                  <!-- container nav-elements -->
                </nav>


              </header>
              <!-- #home -->


              <section id="profile" class="section">
                <div class="container tagline">
                  <button class="tablink" onclick="openPage('Info', this, '#F8F8F8')" id="defaultOpen"></button>



                  <div id="Info" class="tabcontent">
                    <h2 id="infoheader" style="text-align:center;">Billing and Delivery Information</h2>
                    <p style="text-align:center;">
                      Please provide your information.
                    </p>
                    <br />

                    <form action="billing" method="post">


                      <div class="row">
                        <div class="col-75">
                          <div class="container" id="Info">

                            <div class="row">

                              <!-- Billing Address  -->
                              <div class="col-50">
                                <h3>Billing Address</h3>

                            <%
		  	    			 	List<Users> userdetail = new ArrayList<Users>();
 					 	    	userdetail = (ArrayList)request.getAttribute("userdetail");
  								Iterator<Users> iterator = userdetail.iterator();
  								while (iterator.hasNext()) {
 		 							Users users = iterator.next();

       						%>

                                  <label for="fname"><i class="fa fa-user"></i> Full Name</label>

                                  <!-- Retrieve Customer Name -->
                                  <input style="background-color:#f8f8f8" type="text" id="fname" name="firstname" placeholder="John M. Doe" value=<%=users.getFname()%> disabled>
                                  <label for="email"><i class="fa fa-envelope"></i> Email</label>

                                  <!-- Retrieve Customer Email -->
                                  <input style="background-color:#f8f8f8" type="text" id="email" name="email" placeholder="john@example.com" value=<%=users.getEmailid()%> disabled>
                                  <label for="adr"><i class="fa fa-address-card-o"></i> Address</label>

                                  <!-- Retrieve Customer Address -->
                                  <input style="background-color:#f8f8f8" type="text" id="adr" name="address" placeholder="542 W. 15th Street" value=<%=users.getAddress()%> disabled>

                              </div>
                            </div>




                            <!--  Payment Form -->
                            <div class="col-50">
                              <h3>Payment</h3>

                              <label for="fname">Accepted Cards</label>
                              <div class="icon-container">
                                <i class="fa fa-cc-visa" style="color:navy;"></i>
                                <i class="fa fa-cc-amex" style="color:blue;"></i>
                                <i class="fa fa-cc-mastercard" style="color:red;"></i>
                                <i class="fa fa-cc-discover" style="color:orange;"></i>
                              </div>


                              <label for="cname">Name on Card</label>

                              <!-- Retrieve Credit Card Name -->
                              <input style="background-color:#f8f8f8" type="text" id="cname" name="cardname" placeholder="John More Doe" value=<%=users.getFname()%> disabled>

                              <%
  									}
							  %>

                              <%
  	    					 	List<BillingData> billingdetail = new ArrayList<BillingData>();
		 			 	    	billingdetail = (ArrayList)request.getAttribute("billingdetail");
  								Iterator<BillingData> iterator1 = billingdetail.iterator();
  								while (iterator1.hasNext()) {
  									BillingData billingdata = iterator1.next();

     		   				%>


                                  <label for="ccnum">Credit card number</label>

                                  <!-- Retrieve Credit Card Number -->
                                  <input style="background-color:#f8f8f8" type="text" id="ccnum" name="cardnumber" placeholder="1111-2222-3333-4444" value=<%=billingdata.getCarddetails()%> disabled>
                                  <label for="expmonth">Expired Date</label>

                                  <!-- Retrieve Credit Card Expired Month -->
                                  <input style="background-color:#f8f8f8" type="text" id="expdate" name="expdate" placeholder="01/2020" value=<%=billingdata.getExpiry()%> disabled>

                                  <%
  										}
         				           %>
                                    <label><input type="checkbox" checked="checked" name="sameadr" > Shipping address same as billing</label>
                            </div>

                          </div>

                          <br />
                          <h3>Delivery Options</h3>
                          <hr />
                          <form>
                            <label><input type="radio"  name="delivery"> Normal (3-5 business days)</label>
                            <label><input type="radio"  name="delivery"> Express (1-3 business days)</label>
                          </form>
                          <br />
                          <h3>Review Order</h3>
                          <hr />
                          <table id="carttable">
                            <thead>
                              <tr>
                                <th width="80">Cart ID</th>
                                <th width="350">Item Name</th>
                                <th width="80">Quantity</th>
                                <th width="130">Unit Price</th>

                              </tr>
                            </thead>
                            <tbody id="help">

                              <%
  	    			 			List<Cart> cartdetail = new ArrayList<Cart>();
 					 	    	cartdetail = (ArrayList)request.getAttribute("cartdetail");
  								Iterator<Cart> iterator2 = cartdetail.iterator();
  								while (iterator2.hasNext()) {
  									Cart cart = iterator2.next();

       		      			 %>

                                <tr>
                                  <!-- Retrive Item1, Quantity1, Price1 and Row Total -->
                                  <td> <input style="background-color:#f8f8f8" type="text" class="cartid" id="cartid" value=<%=String.valueOf(cart.getCartid())%> disabled placeholder="CartID"></td>
                                  <td> <input style="background-color:#f8f8f8" type="text" class="cartinput" placeholder="Item1" value=<%=cart.getItemname()%> disabled> </td>
                                  <td> <input style="background-color:#f8f8f8" type="number" min="1" id="quantity" placeholder="Quantity1" value=<%=cart.getQuantity()%> disabled> </td>
                                  <td> <input style="background-color:#f8f8f8" type="number" class="cartinput" id="price" placeholder="UnitPrice1" value=<%=cart.getCost()%> disabled> </td>

                                  <!-- End -->
                                </tr>

                                <%
  									}
          				          %>

                            </tbody>

							<%
								String subtotal = (String)request.getAttribute("subtotal");
								String tax = (String)request.getAttribute("tax");
								String total = (String)request.getAttribute("total");
						 	%>

                            <tfoot style="border-top:1px solid black; ">
                              <tr>
                                <td></td>
                                <td> <label style="margin-top: 45px;text-align: right; font-weight:bold; font-size:16px; margin-bottom:16.5px;">SubTotal:</label></td>
                                <td><input style="text-align: left;" type="text" class="cartinput" id="subtotal" disabled value=<%=subtotal%>></td>
                                <td></td>


                              </tr>
                              <tr>
                                <td></td>
                                <td><label style="text-align: right; font-weight:bold; font-size:16px; margin-bottom:17.5px;">Tax (10%):</label></td>

                                <!-- Retrieve Tax (subtotal * 10%)-->
                                <td><input style="text-align: left;" type="text" class="cartinput" placeholder="Tax" id="tax" value=<%=tax%> disabled></td>
                                <td></td>


                              </tr>

                              <tr>
                                <td></td>
                                <td><label style="text-align: right; font-weight:bold; font-size:25px;margin-bottom:22px; ">Total:</label></td>

                                <!-- Retrieve Grand Total of the shopping cart (Final Value) -->
                                <td><input style="text-align: left;" type="text" class="cartinput" placeholder="Tax" id="tax" value=<%=total%> disabled></td>
                                <td></td>


                              </tr>
                            </tfoot>
                          </table>

                          <div id="wrapper">
                            <a href="summary.html">
                <input type="submit" value="Place Your Order" class="btn" id="btnn" style="text-align:center; width:40%;">
                </a>
                          </div>
                          <br />
                        </div>
                      </div>
                  </div>
                  </form>
                </div>


                </div>
                <br />
              </section>




              <!-- #products -->

              <footer class="footer">
                <div class="container">
                  <nav class="nav" role="navigation">
                    <div class="container nav-elements">
                      <div class="branding">
                        <a href="#home"><img src="images/logo.png"
							alt="Logo - H Plus Sports"></a>
                        <p class="address">
                          3241 S Wabash Ave<br> Chicago, IL 60616
                        </p>
                      </div>
                    </div>
                  </nav>
                  <p class="legal">For questions about the Auto Part Buying Service please call 1-888-878-4227. © and ™ AutoPart, Inc. All rights reserved. Vehicle photos © Evox Images © 1986-2018 Chrome Data Solutions, LP</p>
                </div>
                <!-- container -->
              </footer>
              <!-- footer -->

              <script>
                window.onload = rowTotal();
                window.onload = subTotal();
                window.onload = tax();
                window.onload = grandTotal();


                function rowTotal() {
                  var a = document.getElementById('#quantity').value;
                  var b = document.getElementById('#price').value;
                  var x = a * b;
                  document.getElementById("#total").value = x;
                }



                function subTotal() {

                  var sum = 0;
                  $(".total").each(function() {
                    if (!isNaN($(this).val()) && $(this).val().length != 0) {
                      sum += parseFloat(this.value);
                    }
                  });
                  $("#subtotal").val(sum.toFixed(2));
                }


                function tax() {
                  var tax = 0.10;
                  var s = document.getElementById('subtotal').value;
                  var at = s * tax;
                  document.getElementById('tax').value = at.toFixed(2);

                }

                function grandTotal() {

                  var a = document.getElementById('subtotal').value;
                  var b = document.getElementById('tax').value;
                  var x = parseFloat(a) + parseFloat(b);
                  document.getElementById("grandtotal").value = "$" + parseFloat(x);
                }
              </script>


              <script>
                // Page Tab scripts
                function openPage(pageName, elmnt, color) {
                  var i, tabcontent, tablinks;
                  tabcontent = document.getElementsByClassName("tabcontent");
                  for (i = 0; i < tabcontent.length; i++) {
                    tabcontent[i].style.display = "none";
                  }
                  tablinks = document.getElementsByClassName("tablink");
                  for (i = 0; i < tablinks.length; i++) {
                    tablinks[i].style.backgroundColor = "";
                  }
                  document.getElementById(pageName).style.display = "block";
                  elmnt.style.backgroundColor = color;

                }
                document.getElementById("defaultOpen").click();
              </script>




              <!-- <script>
    $('.delivery-checkbox').on('change', function() {
      if ($('.delivery-checkbox').length > 1) {
        this.checked = false;
      }
    });
  </script> -->









            </body>

            </html>