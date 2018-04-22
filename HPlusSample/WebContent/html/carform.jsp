<!DOCTYPE html>
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

    #submit {
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
      width: 150px;
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



  <section id="carform" class="section">
    <div class="container tagline">
      <br />
      <h1>New Car Post</h1>
      <p>Please provide the details of the vehicle!</p>
      <hr>
      <br/>
      <form action="carform" method="post">
        <div class="form-control">
          <label>Title:</label>
          <input type="text" class="form-control" id="carid" name="carid">
        </div>

        <div class="form-control">
          <label>Please describe your vehicle:</label>
          <textarea class="form-control" rows="5" id="description" name="description"></textarea>
        </div>

        <div class="form-control">
          <label>Year:</label>
          <input list="yearmake" name="yearmake" placeholder="Year">
		  <datalist id="yearmake">	
			  <option>Select a Year</option>
      		  <option>2018</option>
      		  <option>2017</option>
	          <option>2016</option>
	          <option>2015</option>
              <option>2014</option>
    	      <option>2013</option>
	          <option>2012</option>
    	      <option>2011</option>
	          <option>2010</option>
    	      <option>2009</option>
        	  <option>2008</option>
	          <option>2007</option>
    	      <option>2006</option>
        	  <option>2005</option>
	          <option>2004</option>
    	      <option>2003</option>
        	  <option>2002</option>
	          <option>2001</option>
    	      <option>2000</option>
        	  <option>1999</option>
              <option>1998</option>
	          <option>1997</option>
    	      <option>1996</option>
        	  <option>1995</option>
	          <option>1994</option>
    	      <option>1993</option>
        	  <option>1992</option>
	          <option>1991</option>
    	      <option>1990</option>
     	 </datalist>
      </div>


        <div class="form-control">
          <label>Make:</label>
          <input list="make" name="make" placeholder="Make">
          <datalist id="make">
		    <option>
               Select A Make
            </option>
            <option>Honda</option>
            <option>Kia</option>
            <option>Toyota</option>
            <option>Volvo</option>
      </datalist>
        </div>

        <div class="form-control">
          <label>Model:</label>
          <input list="model" name="model" placeholder="model">
          <datalist id="model">
		     <option>Select A Model</option>
             <option>Camry</option>
             <option>Civic</option>
             <option>Corolla</option>
             <option>CRV</option>
             <option>K900</option>
             <option>RIO</option>
             <option>V90</option>
             <option>XC60</option>
           </datalist>
         </div>

        <div class="form-control">
          <label>Color:</label>
          <input list="color" name="color" placeholder="Color">
          <datalist id="color">
		     <option>Select A Color</option>
             <option>Black</option>
             <option>Grey</option>
             <option>White</option>
           </datalist>
          </div>

        <div class="form-control">
          <label>Mileage:</label>
          <input type="text" class="form-control" id="mileage" name="mileage">
        </div>

        <div class="form-control">
          <label>Price:</label>
          <input type="text" class="form-control" id="price" name="price">
        </div>

        <div class="form-control">
          <label>KM Run:</label>
          <input type="text" class="form-control" id="kmrun" name="kmrun">
        </div>
        <br />

        <div>
          <label>State of the Car:</label>
          <label><input type="radio" name="status" id="status" value="New">New</label>
          <label><input type="radio" name="status" id="status" value="Used">Used</label>
        </div>
        <hr />

        <br />
        <div class="button">
          <input type="submit" value="Submit" id="submit">
        </div>
      </form>
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