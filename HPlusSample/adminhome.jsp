<!DOCTYPE html>
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

    h1,
    h2,
    h3,
    h4 {
      color: #6495ED;
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
      font-size: 17px;
      width: 16.66666%;
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

    #Ecommerce {
      background-color: #F8F8F8;
    }


    #Users {
      background-color: #F8F8F8;
    }

    #Posts {
      background-color: #F8F8F8;
    }

    #Orders {
      background-color: #F8F8F8;
    }

    #Settings {
      background-color: #F8F8F8;
    }

    #ecommerce {
      margin: 35px;
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
      text-align: center;
    }

    label {
      display: inline-block;
      width: 140px;
      text-align: right;
      min-width: 80px;
    }



    .column {
      float: left;
      width: 42%;
      padding: 15px;
      margin: 20px;
      margin-left: 52px;
      text-align: center;
      background-color: white;
      height: 360px;
      box-shadow: 1px 1px #F8F8F8;

      border-radius: 20px;
      vertical-align: middle;
    }

    .today {
      float: left;
      width: 42%;
      padding: 15px;
      margin: 20px;
      margin-left: 52px;
      text-align: center;
      background-color: white;
      height: 135px;
      box-shadow: 1px 1px #F8F8F8;

      border-radius: 20px;
      vertical-align: middle;
    }

    .row:after {
      content: "";
      display: table;
      clear: both;
      margin-bottom: 20px;
      align: center;
      vertical-align: middle;
    }




    @media screen and (max-width:600px) {
      .column {
        width: 100%;
      }
    }

    ​.wide {
      width: 50%;
    }

    table {
      border-collapse: collapse;
      width: 100%;
    }

    th,
    td {
      padding: 8px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }

    #span {
      display: inline-block;
      vertical-align: middle;
      line-height: normal;
    }

    .button {
      background-color: #4CAF50;
      /* Green */
      border: none;
      color: white;
      padding: 15px 32px;
      text-align: center;
      text-decoration: none;
      display: inline-block;
      font-size: 16px;
      margin: 4px 2px;
      cursor: pointer;
    }

    .button2 {
      background-color: #FF7F50;
    }



    .button3 {
      background-color: #f44336;
    }

    input[type=text] {
      width: 130px;
      box-sizing: border-box;
      border: 2px solid #ccc;
      border-radius: 4px;
      font-size: 16px;
      background-color: white;
      background-image: url('searchicon.png');
      background-position: 10px 10px;
      background-repeat: no-repeat;
      padding: 12px 20px 12px 40px;
      -webkit-transition: width 0.4s ease-in-out;
      transition: width 0.4s ease-in-out;
    }

    input[type=text]:focus {
      width: 100%;
    }


    .btn {
      background-color: #6495ED;
      color: white;
      padding: 12px;
      margin: 10px 0;
      margin-left: 35px;
      margin-right: 25px;
      border: none;
      width: 27%;
      border-radius: 3px;
      cursor: pointer;
      font-size: 17px;
      float: left;

    }

    .btn:hover {
      background-color: #45a049;
    }
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
          <li><a href="#search">Search Cars & Parts</a></li>
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


  <section id="profile" class="section">
    <div class="container tagline">
      <button class="tablink" onclick="openPage('Home', this, '#F8F8F8')">Dashboard</button>
      <button class="tablink" onclick="openPage('Ecommerce', this, '#F8F8F8')">Sales</button>
      <button class="tablink" onclick="openPage('Users', this, '#F8F8F8')">Users</button>
      <button class="tablink" onclick="openPage('Posts', this, '#F8F8F8')">Posts</button>
      <button class="tablink" onclick="openPage('Orders', this, '#F8F8F8')" id="defaultOpen">Orders</button>
      <button class="tablink" onclick="openPage('Settings', this, '#F8F8F8')">Settings</button>

      <div id="Home" class="tabcontent">
        <h2><br />Dashboard Information</h2><br />
        <input type="text" name="search" placeholder="Search ..">
        <p>

        </p>
        <img style="margin-left:200px;" src="https://www.socialbakers.com/www/archive/storage/articles/pictures/admin/usstats.jpg"><br />
        <h4><br />
          Check out Today's Statistics:
        </h4>


        <div class="row">
          <div class="today" align="center">
            <h2 style="color:#ff8000"><br />Today's Orders: 25</h2><br />

          </div>


          <div class="today" align="center">
            <h2 style="color:#0000ff"><br />Today's Posts: 42</h2>
          </div>

        </div>

        <div class="row">
          <div class="today" align="center">

            <h2 style="color:#06b200"><br />Active Users: 62</h2><br />
          </div>


          <div class="today" align="center">

            <h2 style="color:#ff6666"><br />Website Visitors: 1156</h2>
          </div>

        </div>

      </div>


      <div id="Ecommerce" class="tabcontent">
        <h2>Sales</h2>
        <p>
          Most Searched Car Make:
        </p>
        <img style="margin-left:20px;" src="https://i1.wp.com/ecomento.com/wp-content/uploads/2015/09/most-popular-Google-searches-car-brands-USA.jpg?ssl=1"><br />
        <p>

        </p>
        <p>
          Most Popular Car Make:
        </p>
        <img style="margin-left:20px;" src="http://images.mentalfloss.com/sites/default/files/styles/mf_image_16x9/public/top-vehicles.jpg?itok=0kdHZjhI&resize=1100x619"><br />
        <p>
          Search:
        </p>
        <input type="text" name="search" placeholder="Search Users..">
        <p>

        </p>
        <input type="submit" value="Add" class="btn" style="background-color:#1E90FF;">
        <input type="submit" value="Edit" class="btn" style="background-color:#32CD32;">
        <input type="submit" value="Delete" class="btn" style="background-color:#ff4c4c;">
        <br />

        <h1 style="margin-top:60px; ">
          <br />
          Sales Statistics
        </h1>
        <p>

        </p>
        <div class="row">
          <div class="column" align="center">

            <h2 style="color:#ff8000">Total Sales: $154,021</h2><br />
            <img src="http://www.inverselogic.com/img/reports/sales_total.png">
          </div>


          <div class="column" align="center">

            <h2 style="color:#0000ff">Monthly Sales: $2,874</h2>
            <img src="http://www.spinningplanet.co.nz/images/custom/blog/monthly-payment-fluctuations.png">
          </div>

        </div>

        <div class="row">
          <div class="column" align="center">

            <h2 style="color:#06b200">Most Popular Cars</h2><br />
            <img src="https://www.cstatic-images.com/stock/1170x1170/6/-411289449-1435176368806.jpg">
          </div>


          <div class="column" align="center">

            <h2 style="color:#ff6666">Top States </h2>
            <img src="https://upload.wikimedia.org/wikipedia/commons/f/fe/United_States_Map_of_Population_by_State_%282015%29.svg">
          </div>

        </div>



        <h1>Recent Sales</h1></br>
        <div class="wide">
          <table>
            <tr>
              <th>#</th>
              <th>Name</th>
              <th>Provider/Customer</th>
              <th>Car/Car Part</th>
              <th>Verified</th>
            </tr>
            <tr>
              <td>51464</td>
              <td>Peter Griffin</td>
              <td>Customer</td>
              <td>Car</td>
              <td><button class="button">Completed</button></td>
            </tr>
            <tr>
              <td>87912</td>
              <td>Adam Nelson</td>
              <td>Provider</td>
              <td>Car Part</td>
              <td><button class="button">Completed</button></td>
            </tr>
            <tr>
              <td>53649</td>
              <td>Michael Jackson</td>
              <td>Provider</td>
              <td>Car</td>
              <td><button class="button button2">In Progress</button></td>
            </tr>
            <tr>
              <td>24198</td>
              <td>Louis Litt</td>
              <td>Customer </td>
              <td>Car Part</td>
              <td><button class="button">Completed</button></td>
            </tr>
          </table>
        </div>



      </div>






      <div id="Users" class="tabcontent">
        <h2> Search Users</h2><br />

        <input type="text" name="search" placeholder="Search Users..">
        <p>

        </p>
        <input type="submit" value="Add" class="btn" style="background-color:#1E90FF;">
        <input type="submit" value="Edit" class="btn" style="background-color:#32CD32;">
        <input type="submit" value="Delete" class="btn" style="background-color:#ff4c4c;">
        <br />

        <h1 style="margin-top:60px; ">
          <br />
          User Statistics
        </h1>
        <p>

        </p>
        <div class="row">
          <div class="column" align="center">

            <h2 style="color:#ff8000">Total Users: 214987</h2><br />
            <img src="http://www.inverselogic.com/img/reports/sales_total.png">
          </div>


          <div class="column" align="center">

            <h2 style="color:#0000ff">Monthly Users: 3415</h2>
            <img src="http://www.spinningplanet.co.nz/images/custom/blog/monthly-payment-fluctuations.png">
          </div>

        </div>

        <div class="row">
          <div class="column" align="center">

            <h2 style="color:#06b200">Registered Users</h2><br />
            <img src="http://www.inverselogic.com/img/reports/average_order_amount.png">
          </div>


          <div class="column" align="center">

            <h2 style="color:#ff6666">Top States </h2>
            <img src="http://www.inverselogic.com/img/reports/top_states_by_amount.png">
          </div>

        </div>



        <h1>Recent Users</h1></br>
        <div class="wide">
          <table>
            <tr>
              <th>#</th>
              <th>Name</th>
              <th>Provider/Customer</th>
              <th>Age</th>
              <th>Verified</th>
            </tr>
            <tr>
              <td>5142364</td>
              <td>Peter Griffin</td>
              <td>Customer</td>
              <td>23</td>
              <td><button class="button">Verified</button></td>
            </tr>
            <tr>
              <td>8794512</td>
              <td>Adam Nelson</td>
              <td>Provider</td>
              <td>45</td>
              <td><button class="button">Verified</button></td>
            </tr>
            <tr>
              <td>1453649</td>
              <td>Michael Jackson</td>
              <td>Provider</td>
              <td>34</td>
              <td><button class="button button3">On Hold</button></td>
            </tr>
            <tr>
              <td>6324198</td>
              <td>Louis Litt</td>
              <td>Customer </td>
              <td>42</td>
              <td><button class="button">Verified</button></td>
            </tr>
          </table>
        </div>



      </div>

      <div id="Posts" class="tabcontent">
        <h2>Search Posts</h2>
        <br />

        <input type="text" name="search" placeholder="Search Posts..">
        <p>

        </p>
        <input type="submit" value="Add" class="btn" style="background-color:#1E90FF;">
        <input type="submit" value="Edit" class="btn" style="background-color:#32CD32;">
        <input type="submit" value="Delete" class="btn" style="background-color:#ff4c4c;">
        <br />

        <h1 style="margin-top:60px; ">
          <br />
          Post Statistics
        </h1>
        <p>

        </p>
        <div class="row">
          <div class="column" align="center">

            <h2 style="color:#ff8000">Total Posts: 324165</h2><br />
            <img src="http://www.inverselogic.com/img/reports/sales_total.png">
          </div>


          <div class="column" align="center">

            <h2 style="color:#0000ff">Monthly Posts: 3415</h2>
            <img src="http://www.spinningplanet.co.nz/images/custom/blog/monthly-payment-fluctuations.png">
          </div>

        </div>

        <div class="row">
          <div class="column" align="center">

            <h2 style="color:#06b200">Average Order Amount: 62</h2><br />
            <img src="http://www.inverselogic.com/img/reports/average_order_amount.png">
          </div>


          <div class="column" align="center">

            <h2 style="color:#ff6666">Top States </h2>
            <img src="http://www.inverselogic.com/img/reports/top_states_by_amount.png">
          </div>

        </div>



        <h1>Recent Posts</h1></br>
        <div class="wide">
          <table>
            <tr>
              <th>#</th>
              <th>Provider Name</th>
              <th>Product</th>
              <th>Price</th>
              <th>Status</th>
            </tr>
            <tr>
              <td>5142364</td>
              <td>Peter Griffin</td>
              <td>Tire</td>
              <td>$63</td>
              <td><button class="button">Completed</button></td>
            </tr>
            <tr>
              <td>8794512</td>
              <td>Adam Nelson</td>
              <td>Air Filter</td>
              <td>$75</td>
              <td><button class="button">Completed</button></td>
            </tr>
            <tr>
              <td>1453649</td>
              <td>Michael Jackson</td>
              <td>Brake</td>
              <td>$89</td>
              <td><button class="button button3">On Hold</button></td>
            </tr>
            <tr>
              <td>6324198</td>
              <td>Kevin Black</td>
              <td>AC </td>
              <td>$92</td>
              <td><button class="button">Completed</button></td>
            </tr>
          </table>
        </div>



      </div>


      <div id="Orders" class="tabcontent">
        <h2> Search Orders</h2><br />

        <input type="text" name="search" placeholder="Search..">
        <br />
        <p>

        </p>
        <input type="submit" value="Add" class="btn" style="background-color:#1E90FF;">
        <input type="submit" value="Edit" class="btn" style="background-color:#32CD32;">
        <input type="submit" value="Delete" class="btn" style="background-color:#ff4c4c;">
        <br />

        <h1 style="margin-top:60px; ">
          <br />
          Order Statistics
        </h1>
        <p>

        </p>

        <div class="row">
          <div class="column" align="center">

            <h2 style="color:#ff8000">Total Orders: 210196</h2><br />
            <img src="http://www.inverselogic.com/img/reports/sales_total.png">
          </div>


          <div class="column" align="center">

            <h2 style="color:#0000ff">Monthly Orders: 18449</h2>
            <img src="http://www.spinningplanet.co.nz/images/custom/blog/monthly-payment-fluctuations.png">
          </div>

        </div>

        <div class="row">
          <div class="column" align="center">

            <h2 style="color:#06b200">Average Order Amount: 62</h2><br />
            <img src="http://www.inverselogic.com/img/reports/average_order_amount.png">
          </div>


          <div class="column" align="center">

            <h2 style="color:#ff6666">Top States </h2>
            <img src="http://www.inverselogic.com/img/reports/top_states_by_amount.png">
          </div>

        </div>



        <h1>Recent Orders</h1></br>
        <div class="wide">
          <table>
            <tr>
              <th>Invoice</th>
              <th>Name</th>
              <th>Product</th>
              <th>Quantity</th>
              <th>Status</th>
            </tr>
            <tr>
              <td>5142364</td>
              <td>Peter Griffin</td>
              <td>Tire</td>
              <td>3</td>
              <td><button class="button">Completed</button></td>
            </tr>
            <tr>
              <td>8794512</td>
              <td>Adam Nelson</td>
              <td>Air Filter</td>
              <td>5</td>
              <td><button class="button button2">In Progress</button></td>
            </tr>
            <tr>
              <td>1453649</td>
              <td>Michael Jackson</td>
              <td>Brake</td>
              <td>9</td>
              <td><button class="button button3">On Hold</button></td>
            </tr>
            <tr>
              <td>6324198</td>
              <td>Kevin Black</td>
              <td>AC </td>
              <td>2</td>
              <td><button class="button">Completed</button></td>
            </tr>
          </table>
        </div>


      </div>

      <div id="Settings" class="tabcontent">
        <h2>Settings</h2>
        <p>
          Settings
        </p>
        <div id="ecommerce">
          <button class="accordion">  Post 1</button>
          <div class="panel">
            <br />

          </div>

          <button class="accordion">  Post 2</button>
          <div class="panel">
            <br />

          </div>

          <button class="accordion">  Post 3</button>
          <div class="panel">
            <br />

          </div>
          <button class="accordion">  Post 4</button>
          <div class="panel">
            <br />

          </div>
          <button class="accordion">  Post 5</button>
          <div class="panel">
            <br />

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
    // List of orders, Analytics, and Users scripts ---> Accordion HTML function
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