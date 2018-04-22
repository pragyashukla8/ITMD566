<!DOCTYPE html>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<html>
<head>
<link rel="stylesheet" href="css/style.css">
<meta charset="ISO-8859-1">
<title>H+ Sport</title>

</head>
<body>
	<header id="home" class="header">
		<nav class="nav" role="navigation">
			<div class="container nav-elements">
				<div class="branding">
					<a href="#home"><img src="images/hpluslogo.svg"
						alt="Logo - H Plus Sports"></a>
				</div>
				<!-- branding -->
				<ul class="navbar">
					<li><a href="home">home</a></li>
					<li><a href="redirect">linkedIn</a></li>

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
	

	<section id="forgetpassword" class="section">
		<div class="container tagline">

			<em>Forget Password</em>
			<form action="forgetpassword" method="post">
				<label>User Name</label> <input type="text" name="username"
					id="username"><br /> 				
				<label>Email ID</label> <input type="text" name="emailid"
					id="emailid"><br /> 
				<label>Secret Question </label>
					<input list="secretquestion" name="secretquestion">
					<datalist id="secretquestion">
    					<option value="What is your mother's maiden name?">
    					<option value="What was your first school?">
    					<option value="What was your birth city?">
    					<option value="What was your first pet name?"> 
    				</datalist><br/> 
    			<label>Secret Answer</label> <input type="text" name="secretanswer"
					id="secretanswer"><br />
				<label>New Password</label> <input type="password" name="newpassword"
					id="newpassword"><br />	
					<input
					type="submit" value="Submit">
			</form>
		</div>
		</section>
</body>
</html>