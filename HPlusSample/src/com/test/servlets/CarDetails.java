package com.test.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.beans.CarInventory;
import com.test.dao.ApplicationDao;

@WebServlet("/cardetails")
public class CarDetails extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		System.out.println("In car Details dopost method");
		int rowupdated =0;
		int carid = Integer.parseInt(req.getParameter("carid"));
		String description = req.getParameter("description");
		String yearmake = req.getParameter("yearmake");
		String make = req.getParameter("make");
		String model = req.getParameter("model");
		String color = req.getParameter("color");
		String mileage = req.getParameter("mileage");
		String status = req.getParameter("status");
		float kmrun = Float.parseFloat(req.getParameter("kmrun"));
		float price = Float.parseFloat(req.getParameter("price"));
		String imagepath = null;
		if(model.equals("Camry"))
		{
			if(color.equals("Black")) {
				imagepath = "images/camry-black.jpeg";
			}else {
				if(color.equals("Grey")) {
					imagepath = "images/camry-grey.jpg";
				}else {
					imagepath = "images/camry-white.jpg";
				}
			}
			
		}
		if(model.equals("Civic"))
		{
			if(color.equals("Black")) {
				imagepath = "images/civic-black.jpg";
			}else {
				if(color.equals("Grey")) {
					imagepath = "images/civic-grey.jpg";
				}else {
					imagepath = "images/civic-white.jpg";
				}
			}
			
		}
		if(model.equals("Corolla"))
		{
			if(color.equals("Black")) {
				imagepath = "images/corolla-black.jpg";
			}else {
				if(color.equals("Grey")) {
					imagepath = "images/corolla-grey.jpg";
				}else {
					imagepath = "images/corolla-white.jpg";
				}
			}
			
		}
		if(model.equals("CRV"))
		{
			if(color.equals("Black")) {
				imagepath = "images/crv-black.jpg";
			}else {
				if(color.equals("Grey")) {
					imagepath = "images/crv-grey.jpg";
				}else {
					imagepath = "images/crv-white.jpg";
				}
			}
			
		}
		if(model.equals("K900"))
		{
			if(color.equals("Black")) {
				imagepath = "images/k900-black.jpg";
			}else {
				if(color.equals("Grey")) {
					imagepath = "images/k900-grey.jpg";
				}else {
					imagepath = "images/k900-white.jpg";
				}
			}
			
		}
		if(model.equals("Rio"))
		{
			if(color.equals("Black")) {
				imagepath = "images/rio-black.jpg";
			}else {
				if(color.equals("Grey")) {
					imagepath = "images/rio-grey.jpg";
				}else {
					imagepath = "images/rio-white.jpg";
				}
			}
			
		}
		if(model.equals("V90"))
		{
			if(color.equals("Black")) {
				imagepath = "images/v90-black.jpg";
			}else {
				if(color.equals("Grey")) {
					imagepath = "images/v90-grey.jpg";
				}else {
					imagepath = "images/v90-white.jpg";
				}
			}
			
		}
		if(model.equals("XC60"))
		{
			if(color.equals("Black")) {
				imagepath = "images/xc60-black.jpg";
			}else {
				if(color.equals("Grey")) {
					imagepath = "images/xc60-grey.jpg";
				}else {
					imagepath = "images/xc60-white.jpg";
				}
			}
			
		}

		// moving variables for carinventory
		CarInventory carinventory= new CarInventory();
		carinventory.setCarid(carid);
		carinventory.setDescription(description);
		carinventory.setYearmake(yearmake);
		carinventory.setCarmake(make);
		carinventory.setCarmodel(model);
		carinventory.setColor(color);
		carinventory.setMileage(mileage);
		carinventory.setStatus(status);
		carinventory.setKmrun(kmrun);
		carinventory.setCost(price);
		carinventory.setImagepath(imagepath);
		int serviceid = 1;
		carinventory.setServiceid(serviceid);
		
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
					
			carinventory.setProviderid(providerid);
		}
		
		// Updating car detail 
		rowupdated = dao.updateCarInventory(carinventory);
		
		if(rowupdated ==0) {
			String html = "<html><h3>Error: Car Ad not updated</h3></html>";
			resp.getWriter().write(html+" ");
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("/html/login.jsp");
			dispatcher.include(req, resp);
		}
		
		//write the products data back to the client browser
		String html = "<html><h3>Car details updated</h3></html>";
		resp.getWriter().write(html+" ");
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/html/login.jsp");
		dispatcher.include(req, resp);
		
	}
	
}
