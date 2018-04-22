<!doctype html>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.test.beans.CarInventory"%>
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

  <section id="carsearchresult" class="section">
    <div class="container">
      <h2 class="headline">Search Cars</h2>
      
      
 	     <form action="carsearchresult" method="post">
        
        <!-- Make dropdow -->
        
        <select name="makeoption" style="width:180px; height:33px; font-size:15px;">  
          <option selected="selected" value="">-Select-</option>
          <option value="Toyota">Toyota</option>
          <option value="Honda">Honda</option>
          <option value="Kia">Kia</option>
          <option value="Volvo">Volvo</option>
        </select>

        <!-- Model dropdow -->
        <select name="modeloption" style="width:180px; height:33px; font-size:15px;">
          <option selected="selected" value="">-Select-</option>
          <option value="Camry">Camry</option>
          <option value="Corolla">Corolla</option>
          <option value="Civic">Civic</option>
          <option value="CRV">CR-V</option>
          <option value="Rio">Rio</option>
          <option value="K900">K900</option>
          <option value="XC60">XC60</option>
          <option value="V90">V90 </option>
        </select>

        <!-- Color Dropdown -->
        <select name="coloroption" style="width:180px; height:33px; font-size:15px;">
          <option selected="selected" value="">-Select-</option>
          <option value="Black">Black</option>
          <option value="White">White</option>
          <option value="Grey">Grey</option>
        </select>

        <!-- Price range Dropdown -->
        <select name="pricerange" style="width:180px; height:33px; font-size:15px;">
          <option selected="selected" value="">-Select-</option>
          <option value="1">High to Low</option>
          <option value="2">Low to High</option>
         </select>
		

        <!-- Search Button -->
        <input type="submit" value="search" id="submit" name="search">
        <input type="submit" value="refresh" id="refresh" name="refresh">
        
      <%
	      List<CarInventory> cardetail = new ArrayList<CarInventory>();	  
	  	  cardetail = (ArrayList)request.getAttribute("cardetail");
			Iterator<CarInventory> iterator = cardetail.iterator();
			while (iterator.hasNext()) {
				CarInventory carinventory = iterator.next();
	  %>
      
        
      
    	<div class="form-control">
    	
      	<div class="form-control">
      		<img src="<%=carinventory.getImagepath()%>">
      	</div>	

		<div class="form-control">
            <input type="text" class="form-control" id="carid" name="carid" value=<%=carinventory.getCarid()%>>
        </div>          


		<div class="form-control">
            <input type="text" class="form-control" id="make" name="make" value=<%=carinventory.getCarmake()%>>
        </div>          

		<div class="form-control">
            <input type="text" class="form-control" id="model" name="model" value=<%=carinventory.getCarmodel()%>>
        </div>          
		
		<div class="form-control">
            <input type="text" class="form-control" id="status" name="status" value=<%=carinventory.getStatus()%>>
        </div>          

        <div class="form-control">
          <input type="text" class="form-control" id="price" name="price" value=<%=String.valueOf(carinventory.getCost())%>>
        </div>
		
		<input type="submit" value="viewdetail" id="viewdetail" name="viewdetail">

        </form>
        
        <%
			}
        %>
     
     </div> 
        
    </div>


  </section>




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
  <script>
    $(function() {
      var options = $("#model").html();
      $("#make").change(function(e) {
        var text = $("#make :selected").text();
        $("#model").html(options);
        if (text == "-Select-") return;
        $('#model :not([value^="' + text.substr(0, 3) + '"])').remove();
      });
    });
  </script>


</body>

</html>