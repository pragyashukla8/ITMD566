<!DOCTYPE html>
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
  <style>
    h1 {
      color: #6495ED;
    }

    #save {
      /*color: #3385ff;*/
      background-color: #87CEFA;
      /* Green */
      border: none;
      padding: 8px 20px;
      text-align: right;

      display: inline-block;
      font-size: 17px;
      margin: 4px 2px;
      cursor: pointer;
    }

    form {
      padding: 50px;
      border: 1px solid black;
      display: inline-block;
      text-align: center;
    }

    label {
      display: inline-block;
      width: 140px;
      text-align: right;
    }

    /* only the submit button is matched by this selector,
   but to be sure you could use an id or class for that button */
  </style>

</head>

<body>

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

    <!-- <div class="container tagline">
    <h1 class="headline">Our Mission</h1>
    <p>We support and encourage <em>active and healthy</em> lifestyles, by offering <em>ethically sourced</em> and <em>eco-friendly</em> nutritional products for the <em>performance-driven</em> athlete.</p>
  </div>container tagline -->
  </header>
  <!-- #home -->



  <section id="cardisplay" class="section">
    <div class="container tagline">
      <br />
      <h1>Car Post</h1>
      <p>Please add to cart to buy</p>
      <hr>
      <br/>
      
      <%
	      List<CarInventory> cardetail = new ArrayList<CarInventory>();	  
	  	  cardetail = (ArrayList)request.getAttribute("cardetail");
			Iterator<CarInventory> iterator = cardetail.iterator();
			while (iterator.hasNext()) {
				CarInventory carinventory = iterator.next();
	  %>
      
      <form action="cardisplay" method="post">
      	
      	<div class="form-control">
      		<img src="<%=carinventory.getImagepath()%>">
      	</div>	
      
        <div class="form-control">
          <label>Title:</label>
          <input type="text" class="form-control" id="carid" name="carid" value=<%=String.valueOf(carinventory.getCarid())%> READONLY>
        </div>

        <div class="form-control">
          <label>Description:</label>
          <textarea class="form-control" rows="5" id="description" name="description" READONLY><%=carinventory.getDescription()%></textarea>
        </div>

        <div class="form-control">
          <label>Year:</label>
          <input type="text" class="form-control" id="yearmake" name="yearmake" value=<%=carinventory.getYearmake()%> READONLY>
        </div>

        <div class="form-control">
          <label>Make:</label>
          <input type="text" class="form-control" id="make" name="make" value=<%=carinventory.getCarmake()%> READONLY>
        </div>

        <div class="form-control">
          <label>Model:</label>
          <input type="text" class="form-control" id="model" name="model" value=<%=carinventory.getCarmodel()%> READONLY>
        </div>
         
        <div class="form-control">
          <label>Color:</label>
          <input type="text" class="form-control" id="color" name="color" value=<%=carinventory.getColor()%> READONLY>
        </div>

        <div class="form-control">
          <label>Mileage:</label>
          <input type="text" class="form-control" id="mileage" name="mileage" value=<%=carinventory.getMileage()%> READONLY>
        </div>

        <div class="form-control">
          <label>Price:</label>
          <input type="text" class="form-control" id="price" name="price" value=<%=String.valueOf(carinventory.getCost())%> READONLY>
        </div>

        <div class="form-control">
          <label>KM Run:</label>
          <input type="text" class="form-control" id="kmrun" name="kmrun" value=<%=String.valueOf(carinventory.getKmrun())%> READONLY>
        </div>

        <div class="form-control">
          <br />
          <%
          	if(carinventory.getStatus().equals("New"))
          	{
          %>
          <div>
            <label>Car Part State:</label>
            <label><input type="radio" name="status" id="status" value="New" checked>New</label>
            <label><input type="radio" name="status" id="status" value="Used">Used</label>
          </div>
          <%
          	}else{
          %>
          
          <div>
            <label>Car Part State:</label>
            <label><input type="radio" name="status" id="status" value="New">New</label>
            <label><input type="radio" name="status" id="status" value="Used" checked>Used</label>
          </div>
          
          <%
          	}
          %>
          
          <hr />
        </div>

        <br />
        <div class="button">
          <input type="submit" value="addToCart" id="addToCart">
        </div>
      </form>
      <%
			}
      %>
      
    </div>
  </section>


  <br />

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
      <p class="legal">For questions about the Auto Part Buying Service please call 1-888-878-4227. © AutoPart, Inc. All rights reserved. Vehicle photos © Evox Images © 1986-2018 Chrome Data Solutions, LP</p>
    </div>
    <!-- container -->
  </footer>
  <!-- footer -->




</body>

</html>