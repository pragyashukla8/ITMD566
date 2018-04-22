<!DOCTYPE html>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.test.beans.Users"%>
<%@page import="java.util.List"%>

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

    h2,
    p {}

    /* Style tab links */

    .tablink {
      background-color: #DAAD86;
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
      background-color: #BC986A;
    }

    /* Style the tab content (and add height:100% for full page content) */

    .tabcontent {
      color: black;
      display: none;
      padding: 100px 20px;
      height: 100%;

    }

    #Home {
      background-color: #DCDCDC;
    }

    #Purchases {
      background-color: #DCDCDC;
    }

    #Sales {
      background-color: #DCDCDC;
    }

    #Posts {
      background-color: #DCDCDC;
    }

    #purchases {
      margin: 35px;
    }

    form {
      display: inline-block;
      text-align: center;
    }





    .accordion {
      background-color: #eee;
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
      text-align: left;
    }

    label {
      display: inline-block;
      width: 140px;
      text-align: right;
    }

    #saveAccount {
      display: none;
    }

    #savePost1,
    #avePost2,
    #savePost3,
    #savePost4,
    #savePost5 {
      display: none;
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
          <li><a href="#history">About Us</a></li>
          <li><a href="#products">Cars For Sale</a></li>
          <li><a href="#parts">Car Parts For Sale</a></li>
          <li><a href="#search">Search</a></li>
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
      <button class="tablink" onclick="openPage('Home', this, '#DCDCDC')" name="account">Account</button>
      <button class="tablink" onclick="openPage('Purchases', this, '#DCDCDC')" id="defaultOpen" name="orderhistory">Order History</button>
      <button class="tablink" onclick="openPage('Sales', this, '#DCDCDC')" name="saleshistory">Sales History</button>
      <button class="tablink" onclick="openPage('Posts', this, '#DCDCDC')" name="currentposts">Current Posts</button>
	  
      <div id="Home" class="tabcontent">
        <h2>Account Information
        </h2>
        <p>
          Here is your personal information:
        </p>
        <button onclick="editAccount()" id="editAccount">Edit</button>
        <br />

		<%
			List<Users> userdetail = new ArrayList<Users>();	  
	    	userdetail = (ArrayList)request.getAttribute("userdetail");
			Iterator<Users> iterator = userdetail.iterator();
			while (iterator.hasNext()) {
				Users users = iterator.next();
		%>

        <!-- Please retrieve data for Account Information -->
        <form action="accountinfo" method="post">
          <div class="form-control">
            <label for="newfname">First Name:</label>
            <input type="text" class="form-control" id="newfname" name="newfname" value=<%=users.getFname()%> disabled>
          </div>
          <div class="form-control">
            <label for="newlname">Last Name:</label>
            <input type="text" class="form-control" id="newlname" name="newlname" value=<%=users.getLname()%> disabled>
          </div>
          <div class="form-control">
            <label for="newcontact">Contact:</label>
            <input type="number" class="form-control" id="newcontact" name="newcontact" value=<%=users.getContact()%> disabled>
          </div>
          <div class="form-control">
            <label for="newemail">Email:</label>
            <input type="email" class="form-control" id="newemail" name="newemail" value=<%=users.getEmailid()%> disabled>
          </div>
          <div class="form-control">
            <label for="newaddress">Address:</label>
            <input type="text" class="form-control" id="newaddress" name="newaddress" value=<%=users.getAddress()%> disabled>
          </div>
          <div class="form-control">
            <label for="newdob">Date of Birth:</label>
            <input type="text" class="form-control" id="newdob" name="newdob" value=<%=users.getDateofbirth()%> disabled>
          </div>
          <button onclick="saveAccount()" id="saveAccount">Save</button>
        </form>

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
            <form action="order1" method="post">
              <div class="form-control">
                <label for="ordernumber">Order Number:</label>
                <input type="number" class="form-control" id="ordernumber" disabled>
              </div>
              <div class="form-control">
                <label for="itemname">Item Name:</label>
                <input type="text" class="form-control" id="itemname" disabled>
              </div>
              <div class="form-control">
                <label for="category">Category:</label>
                <input type="text" class="form-control" id="category" disabled>
              </div>
              <div class="form-control">
                <label>Description:</label>
                <textarea class="form-control" rows="5" id="description" disabled name="description"></textarea>
              </div>
              <div class="form-control">
                <label for="price">Price:</label>
                <input type="number" class="form-control" id="price" disabled>
              </div>
              <div class="form-control">
                <label for="provider">Provider</label>
                <input type="text" class="form-control" id="provider" disabled>
              </div>
            </form>
            <!-- End of Customer Order 1 -->

          </div>

          <button class="accordion">Order 2</button>
          <div class="panel">

            <!-- Please retrive Customer Order 2 into this form -->
            <form action="order2" method="post">
              <div class="form-control">
                <label for="ordernumber">Order Number:</label>
                <input type="number" class="form-control" id="ordernumber" disabled>
              </div>
              <div class="form-control">
                <label for="itemname">Item Name:</label>
                <input type="text" class="form-control" id="itemname" disabled>
              </div>
              <div class="form-control">
                <label for="category">Category:</label>
                <input type="text" class="form-control" id="category" disabled>
              </div>
              <div class="form-control">
                <label>Description:</label>
                <textarea class="form-control" rows="5" id="description" disabled name="description"></textarea>
              </div>
              <div class="form-control">
                <label for="price">Price:</label>
                <input type="number" class="form-control" id="price" disabled>
              </div>
              <div class="form-control">
                <label for="provider">Provider</label>
                <input type="text" class="form-control" id="provider" disabled>
              </div>
            </form>
            <!-- End of Customer Order 2 -->

          </div>

          <button class="accordion">Order 3</button>
          <div class="panel">

            <!-- Please retrive Customer Order 3 into this form -->
            <form action="order3" method="post">
              <div class="form-control">
                <label for="ordernumber">Order Number:</label>
                <input type="number" class="form-control" id="ordernumber" disabled>
              </div>
              <div class="form-control">
                <label for="itemname">Item Name:</label>
                <input type="text" class="form-control" id="itemname" disabled>
              </div>
              <div class="form-control">
                <label for="category">Category:</label>
                <input type="text" class="form-control" id="category" disabled>
              </div>
              <div class="form-control">
                <label>Description:</label>
                <textarea class="form-control" rows="5" id="description" disabled name="description"></textarea>
              </div>
              <div class="form-control">
                <label for="price">Price:</label>
                <input type="number" class="form-control" id="price" disabled>
              </div>
              <div class="form-control">
                <label for="provider">Provider</label>
                <input type="text" class="form-control" id="provider" disabled>
              </div>
            </form>
            <!-- End of Customer Order 3 -->

          </div>
          <button class="accordion">Order 4</button>
          <div class="panel">


            <!-- Please retrive Customer order 4 into this form -->
            <form action="order4" method="post">
              <div class="form-control">
                <label for="ordernumber">Order Number:</label>
                <input type="number" class="form-control" id="ordernumber" disabled>
              </div>
              <div class="form-control">
                <label for="itemname">Item Name:</label>
                <input type="text" class="form-control" id="itemname" disabled>
              </div>
              <div class="form-control">
                <label for="category">Category:</label>
                <input type="text" class="form-control" id="category" disabled>
              </div>
              <div class="form-control">
                <label>Description:</label>
                <textarea class="form-control" rows="5" id="description" disabled name="description"></textarea>
              </div>
              <div class="form-control">
                <label for="price">Price:</label>
                <input type="number" class="form-control" id="price" disabled>
              </div>
              <div class="form-control">
                <label for="provider">Provider</label>
                <input type="text" class="form-control" id="provider" disabled>
              </div>
            </form>
            <!-- End of Customer Order 4 -->


          </div>
          <button class="accordion">Order 5</button>
          <div class="panel">



            <!-- Please retrive Customer Order 5 into this form -->
            <form action="order5" method="post">
              <div class="form-control">
                <label for="ordernumber">Order Number:</label>
                <input type="number" class="form-control" id="ordernumber" disabled>
              </div>
              <div class="form-control">
                <label for="itemname">Item Name:</label>
                <input type="text" class="form-control" id="itemname" disabled>
              </div>
              <div class="form-control">
                <label for="category">Category:</label>
                <input type="text" class="form-control" id="category" disabled>
              </div>
              <div class="form-control">
                <label>Description:</label>
                <textarea class="form-control" rows="5" id="description" disabled name="description"></textarea>
              </div>
              <div class="form-control">
                <label for="price">Price:</label>
                <input type="number" class="form-control" id="price" disabled>
              </div>
              <div class="form-control">
                <label for="provider">Provider</label>
                <input type="text" class="form-control" id="provider" disabled>
              </div>
            </form>
            <!-- End of Customer Order 5 -->


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
            <form action="sales1" method="post">
              <div class="form-control">
                <label for="salesnumber">Sales Number:</label>
                <input type="number" class="form-control" id="salesnumber" disabled>
              </div>
              <div class="form-control">
                <label for="itemname">Item Name:</label>
                <input type="text" class="form-control" id="itemname" disabled>
              </div>
              <div class="form-control">
                <label for="category">Category:</label>
                <input type="text" class="form-control" id="category" disabled>
              </div>
              <div class="form-control">
                <label>Description:</label>
                <textarea class="form-control" rows="5" id="description" disabled name="description"></textarea>
              </div>
              <div class="form-control">
                <label for="price">Price:</label>
                <input type="number" class="form-control" id="price" disabled>
              </div>
              <div class="form-control">
                <label for="provider">Provider</label>
                <input type="text" class="form-control" id="provider" disabled>
              </div>
            </form>
            <!-- End of Sales 1 -->

          </div>

          <button class="accordion">Sales 2</button>
          <div class="panel">

            <!-- Please retrive Sales 2 into this form -->
            <form action="sales2" method="post">
              <div class="form-control">
                <label for="salesnumber">Sales Number:</label>
                <input type="number" class="form-control" id="salesnumber" disabled>
              </div>
              <div class="form-control">
                <label for="itemname">Item Name:</label>
                <input type="text" class="form-control" id="itemname" disabled>
              </div>
              <div class="form-control">
                <label for="category">Category:</label>
                <input type="text" class="form-control" id="category" disabled>
              </div>
              <div class="form-control">
                <label>Description:</label>
                <textarea class="form-control" rows="5" id="description" disabled name="description"></textarea>
              </div>
              <div class="form-control">
                <label for="price">Price:</label>
                <input type="number" class="form-control" id="price" disabled>
              </div>
              <div class="form-control">
                <label for="provider">Provider</label>
                <input type="text" class="form-control" id="provider" disabled>
              </div>
            </form>
            <!-- End of Sales 2 -->

          </div>

          <button class="accordion">Sales 3</button>
          <div class="panel">

            <!-- Please retrive Sales 3 into this form -->
            <form action="sales3" method="post">
              <div class="form-control">
                <label for="salesnumber">Sales Number:</label>
                <input type="number" class="form-control" id="salesnumber" disabled>
              </div>
              <div class="form-control">
                <label for="itemname">Item Name:</label>
                <input type="text" class="form-control" id="itemname" disabled>
              </div>
              <div class="form-control">
                <label for="category">Category:</label>
                <input type="text" class="form-control" id="category" disabled>
              </div>
              <div class="form-control">
                <label>Description:</label>
                <textarea class="form-control" rows="5" id="description" disabled name="description"></textarea>
              </div>
              <div class="form-control">
                <label for="price">Price:</label>
                <input type="number" class="form-control" id="price" disabled>
              </div>
              <div class="form-control">
                <label for="provider">Provider</label>
                <input type="text" class="form-control" id="provider" disabled>
              </div>
            </form>
            <!-- End of Sales 3 -->

          </div>
          <button class="accordion">Sales 4</button>
          <div class="panel">


            <!-- Please retrive Sales 4 into this form -->
            <form action="sales4" method="post">
              <div class="form-control">
                <label for="salesnumber">Sales Number:</label>
                <input type="number" class="form-control" id="salesnumber" disabled>
              </div>
              <div class="form-control">
                <label for="itemname">Item Name:</label>
                <input type="text" class="form-control" id="itemname" disabled>
              </div>
              <div class="form-control">
                <label for="category">Category:</label>
                <input type="text" class="form-control" id="category" disabled>
              </div>
              <div class="form-control">
                <label>Description:</label>
                <textarea class="form-control" rows="5" id="description" disabled name="description"></textarea>
              </div>
              <div class="form-control">
                <label for="price">Price:</label>
                <input type="number" class="form-control" id="price" disabled>
              </div>
              <div class="form-control">
                <label for="provider">Provider</label>
                <input type="text" class="form-control" id="provider" disabled>
              </div>
            </form>
            <!-- End of Sales 4 -->


          </div>
          <button class="accordion">Sales 5</button>
          <div class="panel">



            <!-- Please retrive Sales 5 into this form -->
            <form action="sales5" method="post">
              <div class="form-control">
                <label for="salesnumber">Sales Number:</label>
                <input type="number" class="form-control" id="salesnumber" disabled>
              </div>
              <div class="form-control">
                <label for="itemname">Item Name:</label>
                <input type="text" class="form-control" id="itemname" disabled>
              </div>
              <div class="form-control">
                <label for="category">Category:</label>
                <input type="text" class="form-control" id="category" disabled>
              </div>
              <div class="form-control">
                <label>Description:</label>
                <textarea class="form-control" rows="5" id="description" disabled name="description"></textarea>
              </div>
              <div class="form-control">
                <label for="price">Price:</label>
                <input type="number" class="form-control" id="price" disabled>
              </div>
              <div class="form-control">
                <label for="provider">Provider</label>
                <input type="text" class="form-control" id="provider" disabled>
              </div>
            </form>
            <!-- End of Sales 5 -->


          </div>
        </div>
      </div>




      <div id="Posts" class="tabcontent">
        <h2>Current Posts</h2>
        <p>
          This is a list of your current posts on our website.
        </p>
        <div id="purchases">
          <button class="accordion">Current Post 1</button>

          <div class="panel">
            <!-- Edit button for Current Post 1 -->
            <button onclick="editPost1()" id="editPost1">Edit</button>
            <br />


            <!-- Please retrive Current Post 1 into this form -->
            <form action="currentpost1" method="post">

              <div class="form-control">
                <label for="posttitle">Post Title</label>
                <input type="number" class="form-control" id="pt1" disabled>
              </div>
              <div class="form-control">
                <label for="itemname">Item Name:</label>
                <input type="text" class="form-control" id="in1" disabled>
              </div>
              <div class="form-control">
                <label for="category">Category:</label>
                <input type="text" class="form-control" id="c1" disabled>
              </div>
              <div class="form-control">
                <label>Description:</label>
                <textarea class="form-control" rows="5" id="d1" disabled name="description"></textarea>
              </div>
              <div class="form-control">
                <label for="price">Price:</label>
                <input type="number" class="form-control" id="p1" disabled>
              </div>
              <div class="form-control">
                <label for="provider">Provider</label>
                <input type="text" class="form-control" id="pro1" disabled>
              </div>
              <button onclick="savePost1()" id="savePost1">Save</button>
            </form>
            <!-- End of Current Post 1 -->

          </div>

          <button class="accordion">Current Post 2</button>
          <div class="panel">

            <!-- Edit button for Current Post 2 -->
            <button onclick="editPost2()" id="editPost2">Edit</button>
            <br />

            <!-- Please retrive Customer Order 2 into this form -->
            <form action="currentpost2" method="post">
              <div class="form-control">
                <label for="posttitle">Post Title:</label>
                <input type="number" class="form-control" id="pt2" disabled>
              </div>
              <div class="form-control">
                <label for="itemname">Item Name:</label>
                <input type="text" class="form-control" id="in2" disabled>
              </div>
              <div class="form-control">
                <label for="category">Category:</label>
                <input type="text" class="form-control" id="c2" disabled>
              </div>
              <div class="form-control">
                <label>Description:</label>
                <textarea class="form-control" rows="5" id="d2" disabled name="description"></textarea>
              </div>
              <div class="form-control">
                <label for="price">Price:</label>
                <input type="number" class="form-control" id="p2" disabled>
              </div>
              <div class="form-control">
                <label for="provider">Provider</label>
                <input type="text" class="form-control" id="pro2" disabled>
              </div>
              <button onclick="savePost2()" id="savePost2">Save</button>
            </form>
            <!-- End of Current Post 2 -->

          </div>

          <button class="accordion">Current Post 3</button>
          <div class="panel">
            <!-- Edit button for Current Post 3 -->
            <button onclick="editPost3()" id="editPost3">Edit</button>
            <br />

            <!-- Please retrive Current Post 3 into this form -->
            <form action="currentpost3" method="post">
              <div class="form-control">
                <label for="posttitle">Post Title:</label>
                <input type="number" class="form-control" id="pt3" disabled>
              </div>
              <div class="form-control">
                <label for="itemname">Item Name:</label>
                <input type="text" class="form-control" id="in3" disabled>
              </div>
              <div class="form-control">
                <label for="category">Category:</label>
                <input type="text" class="form-control" id="c3" disabled>
              </div>
              <div class="form-control">
                <label>Description:</label>
                <textarea class="form-control" rows="5" id="d3" disabled name="description"></textarea>
              </div>
              <div class="form-control">
                <label for="price">Price:</label>
                <input type="number" class="form-control" id="p3" disabled>
              </div>
              <div class="form-control">
                <label for="provider">Provider</label>
                <input type="text" class="form-control" id="pro3" disabled>
              </div>
              <button onclick="savePost3()" id="savePost3">Save</button>
            </form>
            <!-- End of Current Post 3 -->

          </div>
          <button class="accordion">Current Post 4</button>
          <div class="panel">
            <button onclick="editPost4()" id="editPost4">Edit</button>
            <br />

            <!-- Please retrive Current Post 4 into this form -->
            <form action="currentpost4" method="post">
              <div class="form-control">
                <label for="posttitle">Post Title:</label>
                <input type="number" class="form-control" id="pt4" disabled>
              </div>
              <div class="form-control">
                <label for="itemname">Item Name:</label>
                <input type="text" class="form-control" id="in4" disabled>
              </div>
              <div class="form-control">
                <label for="category">Category:</label>
                <input type="text" class="form-control" id="c4" disabled>
              </div>
              <div class="form-control">
                <label>Description:</label>
                <textarea class="form-control" rows="5" id="d4" disabled name="description"></textarea>
              </div>
              <div class="form-control">
                <label for="price">Price:</label>
                <input type="number" class="form-control" id="p4" disabled>
              </div>
              <div class="form-control">
                <label for="provider">Provider</label>
                <input type="text" class="form-control" id="pro4" disabled>
              </div>
              <button onclick="savePost4()" id="savePost4">Save</button>
            </form>
            <!-- End of Current Post 4 -->


          </div>
          <button class="accordion">Current Post 5</button>
          <div class="panel">
            <button onclick="editPost5()" id="editPost5">Edit</button>
            <br />


            <!-- Please retrive Current Post 5 into this form -->
            <form action="currentpost5" method="post">
              <div class="form-control">
                <label for="posttitle">Post Title:</label>
                <input type="number" class="form-control" id="pt5" disabled>
              </div>
              <div class="form-control">
                <label for="itemname">Item Name:</label>
                <input type="text" class="form-control" id="in5" disabled>
              </div>
              <div class="form-control">
                <label for="category">Category:</label>
                <input type="text" class="form-control" id="c5" disabled>
              </div>
              <div class="form-control">
                <label>Description:</label>
                <textarea class="form-control" rows="5" id="d5" disabled name="description"></textarea>
              </div>
              <div class="form-control">
                <label for="price">Price:</label>
                <input type="number" class="form-control" id="p5" disabled>
              </div>
              <div class="form-control">
                <label for="provider">Provider</label>
                <input type="text" class="form-control" id="pro5" disabled>
              </div>
              <button onclick="savePost5()" id="savePost5">Save</button>
            </form>
            <!-- End of Current Post 5 -->


          </div>
        </div>
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
    // Edit Account Button and reveal Save button
    function editAccount() {
      var x = document.getElementById("saveAccount");
      if (true) {
        x.style.display = "block";
        document.getElementById("newName").disabled = false;
        document.getElementById("newUsername").disabled = false;
        document.getElementById("newAge").disabled = false;
        document.getElementById("newEmail").disabled = false;
        document.getElementById("newNumber").disabled = false;
        document.getElementById("newDOB").disabled = false;
      } else {
        x.style.display = "none";
      }
    }

    // function saveAccount() {
    //   alert("Your Account Details are saved!");
    //   document.getElementById("saveAccount").style.visibility = hidden;
    // }
    //
    function editPost1() {
      var x = document.getElementById("savePost1");
      if (true) {
        x.style.display = "block";
        document.getElementById("pt1").disabled = false;
        document.getElementById("in1").disabled = false;
        document.getElementById("c1").disabled = false;
        document.getElementById("d1").disabled = false;
        document.getElementById("p1").disabled = false;
        document.getElementById("pro1").disabled = false;
      } else {
        x.style.display = "none";
      }
    }

    function editPost2() {
      var x = document.getElementById("savePost2");
      if (true) {
        x.style.display = "block";
        document.getElementById("pt2").disabled = false;
        document.getElementById("in2").disabled = false;
        document.getElementById("c2").disabled = false;
        document.getElementById("d2").disabled = false;
        document.getElementById("p2").disabled = false;
        document.getElementById("pro2").disabled = false;
      } else {
        x.style.display = "none";
      }
    }

    function editPost3() {
      var x = document.getElementById("savePost3");
      if (true) {
        x.style.display = "block";
        document.getElementById("pt3").disabled = false;
        document.getElementById("in3").disabled = false;
        document.getElementById("c3").disabled = false;
        document.getElementById("d3").disabled = false;
        document.getElementById("p3").disabled = false;
        document.getElementById("pro3").disabled = false;
      } else {
        x.style.display = "none";
      }
    }

    function editPost4() {
      var x = document.getElementById("savePost4");
      if (true) {
        x.style.display = "block";
        document.getElementById("pt4").disabled = false;
        document.getElementById("in4").disabled = false;
        document.getElementById("c4").disabled = false;
        document.getElementById("d4").disabled = false;
        document.getElementById("p4").disabled = false;
        document.getElementById("pro4").disabled = false;
      } else {
        x.style.display = "none";
      }
    }

    function editPost5() {
      var x = document.getElementById("savePost5");
      if (true) {
        x.style.display = "block";
        document.getElementById("pt5").disabled = false;
        document.getElementById("in5").disabled = false;
        document.getElementById("c5").disabled = false;
        document.getElementById("d5").disabled = false;
        document.getElementById("p5").disabled = false;
        document.getElementById("pro5").disabled = false;
      } else {
        x.style.display = "none";
      }
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