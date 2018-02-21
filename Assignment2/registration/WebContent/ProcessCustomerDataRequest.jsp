<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Display</title>
<style>
table#nat {
	width: 50%;
	background-color: #c48ec5;
}
</style>
</head>
<body>
	<h1>Thank you for your registration.</h1>
	<%
		HttpSession sessionObj = request.getSession(false);
		String name = (String) sessionObj.getAttribute("name");
		String ssn = (String) sessionObj.getAttribute("ssn");
		String zipcode = (String) sessionObj.getAttribute("zipcode");
		String email = (String) sessionObj.getAttribute("email");
		String address = (String) sessionObj.getAttribute("address");
		String city = (String) sessionObj.getAttribute("city");
		String state = (String) sessionObj.getAttribute("state");
		String latitude = (String) sessionObj.getAttribute("latitude");
		String longitude = (String) sessionObj.getAttribute("longitude");
	%>
	<table id="nat">
		<tr>
			<td>Customer Name</td>
			<td><%=name%></td>
		</tr>
		<tr>
			<td>Customer Social Security Number</td>
			<td><%=ssn%></td>
		</tr>
		<tr>
			<td>Zip Code</td>
			<td><%=zipcode%></td>
		</tr>
		<tr>
			<td>Customer Email Address</td>
			<td><%=email%></td>
		</tr>
		<tr>
			<td>Street Address</td>
			<td><%=address%></td>
		</tr>
		<tr>
			<td>City</td>
			<td><%=city%></td>
		</tr>
		<tr>
			<td>State</td>
			<td><%=state%></td>
		</tr>
		<tr>
			<td>Longitude</td>
			<td><%=longitude%></td>
		</tr>
		<tr>
			<td>Latitude</td>
			<td><%=latitude%></td>
		</tr>
	</table>
</body>
</html>