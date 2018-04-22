package com.test.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.beans.CarInventory;
import com.test.beans.PartInventory;
import com.test.dao.ApplicationDao;

@WebServlet("/carpartform")
public class CarPartForm extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse   resp) throws ServletException, IOException {
		//dispatch the request to login.jsp resource
		System.out.println("In car form do get method");
		String html = "<html><h3>Car details</h3></html>";
		resp.getWriter().write(html+" ");
				
		RequestDispatcher dispatcher = req.getRequestDispatcher("/html/carpartform.jsp");
		dispatcher.include(req, resp);
}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		//get the input data from car form
		String partname = req.getParameter("partname");
		String description = req.getParameter("description");
		String category = req.getParameter("category");
		String status = req.getParameter("status");
		float price = Float.parseFloat(req.getParameter("price"));
		String imagepath = null;
		
		if(partname.equals("Series 33-2260")) {
			imagepath = "images/air1.JPG";
		}
		
		if(partname.equals("Series 33-2135")) {
			imagepath = "images/air2.JPG";
		}
		
		if(partname.equals("Brake Pad Sensor")) {
			imagepath = "images/brake1.JPG";
		}
		
		if(partname.equals("Speed Sensor")) {
			imagepath = "images/brake2.JPG";
		}

		if(partname.equals("REPF382403 EGR Line")) {
			imagepath = "images/exhaust1.JPG";
		}
		
		if(partname.equals("REPF382401 EGR Line")) {
			imagepath = "images/exhaust2.JPG";
		}

		if(partname.equals("REPC320704 Automatic Transmission")) {
			imagepath = "images/transmission1.JPG";
		}

		if(partname.equals("REPC320703 Automatic Transmission Solenoid")) {
			imagepath = "images/transmission2.JPG";
		}
		
		// moving variables for carinventory
		PartInventory partinventory= new PartInventory();
		partinventory.setName(partname);
		partinventory.setDescription(description);
		partinventory.setCategory(category);
		partinventory.setStatus(status);
		partinventory.setCost(price);
		partinventory.setImagepath(imagepath);
		int serviceid = 2;
		partinventory.setServiceid(serviceid);
		//set up the HTTP session
		HttpSession session = req.getSession();
			
		//get the username as an attribute
		String username = (String) session.getAttribute("username");
		
		//Calling ApplicationDao to get userid
		int providerid=0;
		ApplicationDao dao= new ApplicationDao();
		providerid=dao.getUserID(username);
		
		if(providerid ==0) {
			
			String html = "<html><h3>Cannot find user</h3></html>";
			resp.getWriter().write(html+" ");
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("/html/login.jsp");
			dispatcher.include(req, resp);
		}else {
			
			partinventory.setProviderid(providerid);
		}
		
		//Calling ApplicationDao to create a car ad
		int row= dao.addPartInventory(partinventory);
		
		if(row==0) {

			String html = "<html><h3>Some error in creating Car part ad</h3></html>";
			resp.getWriter().write(html+" ");
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("/html/carpartform.jsp");
			dispatcher.include(req, resp);			
		}else {
			
			String html = "<html><h3>Car Part ad created</h3></html>";
			resp.getWriter().write(html+" ");
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("/html/login.jsp");
			dispatcher.include(req, resp);
		}
	}		


}
