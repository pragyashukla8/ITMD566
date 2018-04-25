<!DOCTYPE html>
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


    #Summary {
      background-color: #F8F8F8;

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
          <li><a href="login">Logout</a></li>
        </ul>
        <!-- navbar -->
      </div>
      <!-- container nav-elements -->
    </nav>


  </header>
  <!-- #home -->

  <!--Page tabs: My Cart, Customer Information, Order Review, Summary -->
  <section id="profile" class="section">
    <div class="container tagline">

      <button class="tablink" onclick="openPage('Summary', this, '#F8F8F8')" id="defaultOpen"></button>

	<form action="summary" method="post">
      <div id="Summary" class="tabcontent">
        <h2 style="text-align:center;"> Thank you for shopping with us! </h2>
        <p style="text-align:center;">
          You may view your Order Details under <input type="submit" value="Go to Home Page" id="homepage">
        </p>
      </div>
    </form>  
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


  <!-- <script>
    $('.delivery-checkbox').on('change', function() {
      if ($('.delivery-checkbox').length > 1) {
        this.checked = false;
      }
    });
  </script> -->









</body>

</html>