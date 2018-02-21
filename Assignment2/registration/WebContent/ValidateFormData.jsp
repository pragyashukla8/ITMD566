<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Data</title>
</head>
<style>
div.ex {
	text-align: right width:300px;
	padding: 10px;
	border: 5px solid grey;
	margin: 0px
}
</style>
<body>
	<h1>Validation Form</h1>
	<div class="ex">
		<form action="RegistrationController" method="post">
			<table style="with: 50%">
				<tr>
					<td>Customer Name</td>
					<td><input type="text" name="name"
						pattern="^[a-zA-Z0-9](\s?[a-zA-Z0-9]){4,50}$"
						oninvalid="this.setCustomValidity('Enter Valid Customer Name')"
						oninput="setCustomValidity('')" /></td>
				</tr>
				<tr>
					<td>Customer Social Security Number</td>
					<td><input type="text" pattern="\d{3}-?\d{2}-?\d{4}"
						name="ssn" placeholder="XXX-XX-XXXX"
						oninvalid="this.setCustomValidity('Enter Valid Social Security Number')"
						oninput="setCustomValidity('')" /></td>
				</tr>
				<tr>
					<td>Zip Code</td>
					<td><input type="text" name="zipcode" placeholder="XXXXX-XXXX" /></td>
				</tr>
				<tr>
					<td>Customer Email Address</td>
					<td><input type="text" name="email"/></td>
				</tr>
				<tr>
					<td>Street Address</td>
					<td><input type="text" name="address"
						pattern="^[a-zA-Z0-9](\s?[a-zA-Z0-9]){4,50}$"
						oninvalid="this.setCustomValidity('Enter Valid Street Address')"
						oninput="setCustomValidity('')" /></td>
				</tr>
				<tr>
					<td>City</td>
					<td><input type="text" name="city"
						pattern="^[a-zA-Z0-9](\s?[a-zA-Z0-9]){3,50}$"
						oninvalid="this.setCustomValidity('Enter Valid City Name')"
						oninput="setCustomValidity('')" /></td>
				</tr>
				<tr>
					<td>State</td>
					<td>
						<!-- <input type="text" name="state" /> --> <select name="state">
							<option value="AL">AL</option>
							<option value="AK">AK</option>
							<option value="AR">AR</option>
							<option value="AZ">AZ</option>
							<option value="CA">CA</option>
							<option value="CO">CO</option>
							<option value="CT">CT</option>
							<option value="DC">DC</option>
							<option value="DE">DE</option>
							<option value="FL">FL</option>
							<option value="GA">GA</option>
							<option value="HI">HI</option>
							<option value="IA">IA</option>
							<option value="ID">ID</option>
							<option value="IL">IL</option>
							<option value="IN">IN</option>
							<option value="KS">KS</option>
							<option value="KY">KY</option>
							<option value="LA">LA</option>
							<option value="MA">MA</option>
							<option value="MD">MD</option>
							<option value="ME">ME</option>
							<option value="MI">MI</option>
							<option value="MN">MN</option>
							<option value="MO">MO</option>
							<option value="MS">MS</option>
							<option value="MT">MT</option>
							<option value="NC">NC</option>
							<option value="NE">NE</option>
							<option value="NH">NH</option>
							<option value="NJ">NJ</option>
							<option value="NM">NM</option>
							<option value="NV">NV</option>
							<option value="NY">NY</option>
							<option value="ND">ND</option>
							<option value="OH">OH</option>
							<option value="OK">OK</option>
							<option value="OR">OR</option>
							<option value="PA">PA</option>
							<option value="RI">RI</option>
							<option value="SC">SC</option>
							<option value="SD">SD</option>
							<option value="TN">TN</option>
							<option value="TX">TX</option>
							<option value="UT">UT</option>
							<option value="VT">VT</option>
							<option value="VA">VA</option>
							<option value="WA">WA</option>
							<option value="WI">WI</option>
							<option value="WV">WV</option>
							<option value="WY">WY</option>
					</select>
					</td>
				</tr>
			</table>
			<input type="submit" value="register" />

		</form>
	</div>

</body>
</html>