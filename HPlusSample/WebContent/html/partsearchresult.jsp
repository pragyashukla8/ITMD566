<!doctype html>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.test.beans.PartInventory"%>
<%@page import="java.util.List"%>

<html lang="en">

<head>
  <meta charset="UTF-8">
  <title>Auto Part</title>
  <link rel="stylesheet" href="css/style.css">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.min.css" rel="stylesheet" type="text/css" />
  <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
  <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.min.js"></script>
  <style>
    h2 {
      color: #6495ED;
    }

    #submit {
      /*color: #3385ff;*/
      background-color: #87CEFA;
      /* Green */
      border: #3385ff;
      border-radius: 3px;
      padding: 5.3px 20px;
      text-align: right;
      border: 1px solid #008CBA;
      display: inline-block;
      font-size: 17px;
      margin: 4px 2px;
      cursor: pointer;
    }

    #search {
      padding-bottom: 240px;
    }



    /*Resize the wrap to see the search bar change!*/
  </style>
</head>

<body>

  <header id="home" class="header">
    <nav class="nav" role="navigation">
      <div class="container nav-elements">
        <div class="branding">
          <a href="#home"><img src="images/logo.png" alt="Logo "></a>
        </div>
        <!-- branding -->
        <ul class="navbar">
          <li><a href="home">Home</a></li>
          <li><a href="#history">About Us</a></li>
          <li><a href="#products">Cars For Sale</a></li>
          <li><a href="#parts">Car Parts For Sale</a></li>
          <li><a href="#search">Search</a></li>
          <li><a href="registerUser">New User?</a></li>
        </ul>
        <!-- navbar -->
      </div>


      <!-- container nav-elements -->
    </nav>
    <div class="container tagline">
      <h1 class="headline">Our Mission</h1>
      <p></p>
    </div>
    <!-- container tagline -->
  </header>
  <!-- #home -->

  <section id="search" class="section">
    <div class="container">
      <h2 class="headline">Search Car Parts</h2>
      <form action="partsearchresult" method="post">
        
        <!-- Type dropdow -->
        <select name="categoryoption" style="width:180px; height:33px; font-size:15px;">  
          <option selected="selected" value="">-Select Category-</option>
          <option value="Air Filter">Air-Filter</option>
          <option value="Brake">Brake</option>
          <option value="Exhaust">Exhaust</option>
          <option value="Transmission">Transmission</option>
        </select>
        
        <!-- Parts dropdow -->
        <select name="nameoption" style="width:180px; height:33px; font-size:15px;">  
          <option selected="selected" value="">-Select Part-</option>
          <option value="Series 33-2260">Series 33-2260</option>
          <option value="Series 33-2135">Series 33-2135</option>
          <option value="Brake Pad Sensor">Brake Pad Sensor</option>
          <option value="Speed Sensor">Speed Sensor</option>
          <option value="REPF382403 EGR Line">REPF382403 EGR Line</option>
          <option value="REPF382403 EGR Line">REPF382403 EGR Line</option>
          <option value="REPC320704 Automatic Transmission">REPC320704 Automatic Transmission</option>
          <option value="REPC320703 Automatic Transmission Solenoid">REPC320703 Automatic Transmission Solenoid</option>
        </select>
        
        <!-- Price range Dropdown -->
        <select name="pricerange" style="width:180px; height:33px; font-size:15px;">
          <option selected="selected" value="">-Price Sort-</option>
          <option value="1">High to Low</option>
          <option value="2">Low to High</option>
         </select>
        
        
        <!-- Search Button -->
        <input type="submit" value="Search" id="search" name="search">
        <input type="submit" value="Refresh" id="refresh" name="refresh">
      
            <h2 class="headline">Results</h2>
            
         <%
	  		     List<PartInventory> partdetail = new ArrayList<PartInventory>();	  
	  	 		 partdetail = (ArrayList)request.getAttribute("partdetail");
				 Iterator<PartInventory> iterator = partdetail.iterator();
				 while (iterator.hasNext()) {
					PartInventory partinventory = iterator.next();
	 	 %>
            

			<div class="form-control">
				
            <div class="form-control">
            	<img src="<%=partinventory.getImagepath()%>">
            </div>
	
			<div class="form-control">
           		 <input type="text" class="form-control" id="partid" name="partid" value=<%=partinventory.getPartid()%>>
       	    </div>
			
			<div class="form-control">
           		 <input type="text" class="form-control" id="name" name="name" value=<%=partinventory.getName()%>>
       	    </div>
       	    
       	    <div class="form-control">
           		 <input type="text" class="form-control" id="status" name="status" value=<%=partinventory.getStatus()%>>
       	    </div>
       	    
       	    <div class="form-control">
           		 <input type="text" class="form-control" id="price" name="price" value=<%=String.valueOf(partinventory.getCost())%>>
       	    </div>
			
			<input type="submit" value="viewdetail" id="viewdetail" name="viewdetail">
			        
          </form>
          
          <%
				 }
          %>
          
        </div>
      </div>
    </section>

  </section>

  <script>
    $(function() {
      var options = $("#product").html();
      $("#type").change(function(e) {
        var text = $("#type :selected").text();
        $("#product").html(options);
        if (text == "-Select-") return;
        $('#product :not([value^="' + text.substr(0, 3) + '"])').remove();
      });
    });
  </script>


  <!-- #history -->
  <!-- Top navigation -->




  <!-- #products -->


  <!-- guarantee -->


  <!-- people -->



  <!-- guarantee -->




  <footer class="footer">
    <div class="container">
      <nav class="nav" role="navigation">
        <div class="container nav-elements">
          <div class="branding">
            <a href="#home"><img src="images/logo.png" alt="Logo"></a>
            <p class="address">3241 S Wabash<br> Chicago, IL 60616
            </p>
          </div>
        </div>
      </nav>
      <p class="legal">For questions about the Auto Part Buying Service please call 1-888-878-4227. © and ™ AutoPart, Inc. All rights reserved. Vehicle photos © Evox Images © 1986-2018 Chrome Data Solutions, LP</p>

    </div>
    <!-- container -->
  </footer>
  <!-- footer -->



</body>

</html>