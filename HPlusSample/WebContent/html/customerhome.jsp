<!DOCTYPE html>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.test.beans.Users"%>
<%@page import="java.util.List"%>
<%@page import="com.test.beans.PartInventory"%>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>Auto Part</title>
<link rel="stylesheet" href="css/style.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Latest compiled and minified CSS -->
<!-- Latest compiled and minified CSS -->
<style>
* {
	  box-sizing: border-box
  }

/* Set height of body and the document to 100% */

body,
html {
        height: 100%;
        margin: 0;
        font-family: Raleway, Helvetica, Arial, sans-serif;
     }

h2 {
   	   color: #6495ED;
    }

 /* Style tab links */

 .tablink {
               background-color: #white;
               color: black;
               float: left;
               border: none;
               outline: none;
               cursor: pointer;
               padding: 14px 16px;
               font-size: 17px;
               width: 25%;
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

 #Home {
            background-color: #F8F8F8;
       }

 #Purchases {
                background-color: #F8F8F8;
            }

 #Sales {
            background-color: #F8F8F8;
        }

 #Posts {
            background-color: #F8F8F8;
        }

 #purchases {
                margin: 35px;
            }

 form {}

.accordion {
                background-color: #white;
                color: #444;
                cursor: pointer;
                padding: 18px;
                width: 100%;
                border: none;
                text-align: left;
                outline: none;
                font-size: 15px;
                transition: 0.4s;
           }

.active,
.accordion:hover {
	                background-color: #ccc;
    	          }

.accordion:after {
	                content: '\002B';
    	            color: #777;
        	        font-weight: bold;
            	    float: right;
                	margin-left: 5px;
             	 }

 .active:after {
                content: "\2212";
              }

 .panel {
             padding: 0 18px;
             background-color: white;
             max-height: 0;
             overflow: hidden;
             transition: max-height 0.2s ease-out;
        }

 form {
            padding: 30px;
            border: 1px solid black;
            display: inline-block;
            text-align: center;
      }

 label {
           display: inline-block;
           width: 140px;
           text-align: right;
           min-width: 80px;
       }

 #edit {
            /*color: #3385ff;*/
            background-color: #f8f8f8;
            /* Green */
            border: none;
            color: #6495ED;
            padding: 6px 12px;
            text-align: right;

            display: inline-block;
            font-size: 13px;
            margin: 4px 2px;
            cursor: pointer;
            margin-left: 150px;
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
        <li><a href="home#history">About Us</a></li>
        <li><a href="carsearchresult">Search Cars</a></li>
        <li><a href="partsearchresult">Search Parts</a></li>
        <li><a href="login">Login</a></li>
        <li><a href="registerUser">Register</a></li>
        <li><a href="profile.html">Profile</a></li>
     </ul>
     <!-- navbar -->
     </div>
     <!-- container nav-elements -->
     </nav>

     </header>
     <!-- #home -->

     <!--Page tabs: Account, Order History, Sales History -->
     <section id="profile" class="section">
     <div class="container tagline">
        <button class="tablink" onclick="openPage('Home', this, '#f8f8f8')" id="defaultOpen">Account</button>
        <button class="tablink" onclick="openPage('Purchases', this, '#f8f8f8')">Order History</button>
        <button class="tablink" onclick="openPage('Sales', this, '#f8f8f8')">Sales History</button>
        <button class="tablink" onclick="openPage('Posts', this, '#f8f8f8')">Current Posts</button>

     <div id="Home" class="tabcontent">
       <h2>Account Information</h2>
       <p>
         Here is your personal information:
       </p>
       <button id="edit"><a href="editaccount.html">Edit</a></button>
       <br />
       <!-- Please retrieve data for Account Information -->
       <form action="customerinfo" method="post">
       <%
  	     	List<Users> userdetail = new ArrayList<Users>();
  	    	userdetail = (ArrayList)request.getAttribute("userdetail");
  			Iterator<Users> iterator = userdetail.iterator();
  			while (iterator.hasNext()) {
  				Users users = iterator.next();

       	%>

      <div class="form-control">
      		<label for="newfname">First Name:</label>
            <input type="text" class="form-control" id="fname" name="fname" value=<%=users.getFname()%> READONLY >
      </div>
      
      <div class="form-control">
             <label for="newlname">Last Name:</label>
             <input type="text" class="form-control" id="lname" name="lname" value=<%=users.getLname()%> READONLY>
      </div>
      
      <div class="form-control">
              <label for="newcontact">Contact:</label>
              <input type="number" class="form-control" id="contact" name="contact" value=<%=users.getContact()%> READONLY>
      </div>
      
      <div class="form-control">
             <label for="newemail">Email:</label>
             <input type="email" class="form-control" id="email" name="email" value=<%=users.getEmailid()%> READONLY>
      </div>
      
      <div class="form-control">
              <label for="newaddress">Address:</label>
              <input type="tel" class="form-control" id="address" name="address" value=<%=users.getAddress()%> READONLY>
      </div>
      
      <div class="form-control">
             <label for="newdob">Date of Birth:</label>
             <input type="date" class="form-control" id="dob" name="dob" value=<%=users.getDateofbirth()%> READONLY>
      </div>


      <%
			 }
       %>

       <!-- End of Account Information -->
       </div>

       <div id="Purchases" class="tabcontent">
       <h2>Purchases</h2>
       <p>
           This is a list of your purchases on our website.
       </p>
       
       <div id="purchases">
            <button class="accordion">Order 1</button>
        <div class="panel">

        <!-- Please retrive Customer Order 1 into this form -->

        <div class="form-control">
             <label for="ordernumber">Order Number:</label>
             <input type="number" class="form-control" id="ordernumber" READONLY>
         </div>
         
         <div class="form-control">
               <label for="itemname">Item Name:</label>
               <input type="text" class="form-control" id="itemname" READONLY>
          </div>
          
          <div class="form-control">
               <label for="category">Category:</label>
               <input type="text" class="form-control" id="category" READONLY>
          </div>
          
          <div class="form-control">
               <label>Description:</label>
               <textarea class="form-control" rows="5" id="description" disabled name="description"></textarea>
          </div>
          
          <div class="form-control">
               <label for="price">Price:</label>
               <input type="number" class="form-control" id="price" READONLY>
          </div>
          
          <div class="form-control">
               <label for="provider">Provider</label>
               <input type="text" class="form-control" id="provider" READONLY>
           </div>

           <!-- End of Customer Order 1 -->

           
          </div>
          </div>
          </div>

          <div id="Sales" class="tabcontent">
          <h2>Sales History</h2>
          <p>
              This is a list of Car Parts you have sold on our website.
          </p>
          <div id="purchases">
          <button class="accordion">Sales 1</button>
          <div class="panel">

          <!-- Please retrive Sales 1 into this form -->

          <div class="form-control">
               <label for="salesnumber">Sales Number:</label>
               <input type="number" class="form-control" id="salesnumber" READONLY>
          </div>
          
          <div class="form-control">
               <label for="itemname">Item Name:</label>
               <input type="text" class="form-control" id="itemname" READONLY>
          </div>
          
          <div class="form-control">
               <label for="category">Category:</label>
               <input type="text" class="form-control" id="category" READONLY>
          </div>
          
          <div class="form-control">
               <label>Description:</label>
               <textarea class="form-control" rows="5" id="description" READONLY name="description"></textarea>
          </div>
          
          <div class="form-control">
               <label for="price">Price:</label>
               <input type="number" class="form-control" id="price" READONLY>
          </div>
          
          <div class="form-control">
               <label for="provider">Provider</label>
               <input type="text" class="form-control" id="provider" READONLY>
          </div>

          <!-- End of Sales 1 -->

          </div>
          </div>
          </div>

          <div id="Posts" class="tabcontent">
          <h2>Current Posts</h2>
          <p>
             This is a list of your current Car Parts posts on our website.
          </p>
          
	       <div id="purchases">

            <%
  	        	List<PartInventory> partdetail = new ArrayList<PartInventory>();
  				partdetail = (ArrayList)request.getAttribute("partdetail");
              	Iterator<PartInventory> iterator1 = partdetail.iterator();
  				while (iterator1.hasNext()) {
  					PartInventory partinventory = iterator1.next();

          	 %>

                          
             <!-- Please retrive Current Post 1 into this form -->

             <div class="form-control">
                  <label for="posttitle">Post Title</label>
                  <input type="text" class="form-control" id="postpartid" name="postpartid" value=<%=String.valueOf(partinventory.getPartid())%> READONLY>
             </div>
             
             <div class="form-control">
                  <label for="itemname">Item Name:</label>
                  <input type="text" class="form-control" id="postpartname" name="postpartname" value=<%=partinventory.getName()%> READONLY>
             </div>
             
             <div class="form-control">
                  <label for="category">Category:</label>
                  <input type="text" class="form-control" id="postcategory" name="postcategory" value=<%=partinventory.getCategory()%> READONLY>
             </div>
             
             <div class="form-control">
                  <label for="price">Price:</label>
                  <input type="number" class="form-control" id="postprice" name="postprice" value=<%=String.valueOf(partinventory.getCost())%> READONLY>
             </div>
             
             <input type="submit" value="editdetail" id="editpostdetail" name="editpostdetail">
             <input type="submit" value="delete" id="delete" name="delete">
             
             <%
					}
             %>



             <!-- End of Current Post 1 -->

             </div>
             </div>
             </div>
             </form>
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


            <script>
              // List of orders, sales, and posts scripts ---> Accordion HTML function
              var acc = document.getElementsByClassName("accordion");
              var i;

              for (i = 0; i < acc.length; i++) {
                acc[i].addEventListener("click", function() {
                  this.classList.toggle("active");
                  var panel = this.nextElementSibling;
                  if (panel.style.maxHeight) {
                    panel.style.maxHeight = null;
                  } else {
                    panel.style.maxHeight = panel.scrollHeight + "px";
                  }
                });
              }
            </script>


          </body>

          </html>