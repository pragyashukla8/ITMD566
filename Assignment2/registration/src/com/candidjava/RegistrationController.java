package com.candidjava;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathFactory;

import org.w3c.dom.Document;

/**
 * Servlet which receives data from form via a session object and use google API to get longitude
 * and Latitude on the basis of address received
 */
public class RegistrationController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegistrationController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 * 
	 *      protected void doGet(HttpServletRequest request, HttpServletResponse
	 *      response) throws ServletException, IOException { // TODO Auto-generated
	 *      method stub }
	 * 
	 *      /**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		boolean flag = false;
		List<String> msgs = new ArrayList<String>();
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		// receives all the form data entered
		String name = request.getParameter("name");
		String ssn = request.getParameter("ssn");
		String zipcode = request.getParameter("zipcode");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String state = request.getParameter("state");

		// checks if data is received
		if (name.isEmpty() || ssn.isEmpty() || zipcode.isEmpty() || email.isEmpty() || address.isEmpty()
				|| city.isEmpty() || state.isEmpty()) {
			RequestDispatcher rd = request.getRequestDispatcher("ValidateFormData.jsp");
			out.println("<font color=red>Please fill all the fields</font>");
			rd.include(request, response);
		} else {
			// validate zip code format
			if (!zipcode.matches("\\d{5}-?\\d{4}")) { 
				String msg = "<font color=red>Zip Code is not in correct format.</font>"+'\n';
				msgs.add(msg);
				msgs.add("");
				flag = true;
			}
			// validate email ID format
			if (!(email.matches(
					"^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$"))) {
				String msg = "<font color=red>   Email Address is not valid.</font>";
				msgs.add(msg);
				flag = true;
			}

			if (flag) {
				errorScenario(request, response, msgs);
			} else {
				String zipcode1 = zipcode.substring(6, zipcode.length());
				String code = zipcode1.trim().toString() + " " + address.trim().toString() + " "
						+ city.trim().toString() + " " + state.trim().toUpperCase();
				String latLongs[];
				try {
					latLongs = getLatLongPositions(code);
					request.setAttribute("latitude", latLongs[0]);
					request.setAttribute("longitude", latLongs[1]);

				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				// Session to store values from registration form
				HttpSession session = request.getSession();
				session.setAttribute("name", name);
				session.setAttribute("ssn", ssn);
				session.setAttribute("zipcode", zipcode);
				session.setAttribute("email", email);
				session.setAttribute("address", address);
				session.setAttribute("city", city);
				session.setAttribute("state", state);
				session.setAttribute("latitude", request.getAttribute("latitude"));
				session.setAttribute("longitude", request.getAttribute("longitude"));

				RequestDispatcher rd = request.getRequestDispatcher("ProcessCustomerDataRequest.jsp");
				rd.forward(request, response);
			}

		}

	}

	public void errorScenario(HttpServletRequest request, HttpServletResponse response, List<String> msg)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		RequestDispatcher rd = request.getRequestDispatcher("ValidateFormData.jsp");
		for (String message:msg) {
			out.print(message);
			out.print("\r\n");
		}
		rd.include(request, response);
	}

	// method to use google API and get Longitude and Latitude for the revieved address
	private static String[] getLatLongPositions(String address) throws Exception {
		int responseCode = 0;
		String api = "http://maps.googleapis.com/maps/api/geocode/xml?address=" + URLEncoder.encode(address, "UTF-8")
				+ "&sensor=true";
		URL url = new URL(api);
		HttpURLConnection httpConnection = (HttpURLConnection) url.openConnection();
		httpConnection.connect();
		responseCode = httpConnection.getResponseCode();
		if (responseCode == 200) {
			DocumentBuilder builder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
			;
			Document document = builder.parse(httpConnection.getInputStream());
			XPathFactory xPathfactory = XPathFactory.newInstance();
			XPath xpath = xPathfactory.newXPath();
			XPathExpression expr = xpath.compile("/GeocodeResponse/status");
			String status = (String) expr.evaluate(document, XPathConstants.STRING);
			if (status.equals("OK")) {
				expr = xpath.compile("//geometry/location/lat");
				String latitude = (String) expr.evaluate(document, XPathConstants.STRING);
				expr = xpath.compile("//geometry/location/lng");
				String longitude = (String) expr.evaluate(document, XPathConstants.STRING);
				return new String[] { latitude, longitude };
			} else {
				throw new Exception("Error from the Google API - response status: " + status);
			}
		}
		return null;
	}

}
