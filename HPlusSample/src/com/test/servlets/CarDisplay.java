package com.test.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.beans.CarInventory;
import com.test.beans.Cart;
import com.test.dao.ApplicationDao;

@WebServlet("/cardisplay")
public class CarDisplay extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		System.out.println("In car display dopost method");
		int rowinserted =0;
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
		
		// moving variables for cart
		ApplicationDao dao= new ApplicationDao();
		Cart cart= new Cart();
		List<CarInventory> cardetail= new ArrayList<CarInventory>();
		
		cardetail= dao.getCarInventory(carid);
		
		Iterator<CarInventory> iterator = cardetail.iterator();
		while (iterator.hasNext()) {
			CarInventory carinventory = iterator.next();
			cart.setProviderid(carinventory.getProviderid());
			cart.setServiceid(carinventory.getServiceid());
			cart.setItemname(carinventory.getCarmodel());
			cart.setCost(carinventory.getCost());
		}
		
		cart.setQuantity(1);
		
		//set up the HTTP session
		HttpSession session = req.getSession();
					
		//get the username as an attribute
		String username = (String) session.getAttribute("username");
				
		//Calling ApplicationDao to get userid
		int customerid=0;
		customerid=dao.getUserID(username);
				
		if(customerid ==0) {
					
			String html = "<html><h3>Cannot find user</h3></html>";
			resp.getWriter().write(html+" ");
					
	    	RequestDispatcher dispatcher = req.getRequestDispatcher("/html/login.jsp");
			dispatcher.include(req, resp);
		}else {
					
			cart.setCustomerid(customerid);
		}
		
		// Updating car detail 
		rowinserted = dao.addCart(cart);
		
		if(rowinserted ==0) {
			String html = "<html><h3>Error: cart not updated</h3></html>";
			resp.getWriter().write(html+" ");
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("/html/login.jsp");
			dispatcher.include(req, resp);
		}
		
		//write the products data back to the client browser
		String criteria = "";
		String search1 = "";
		String search2 = "";
		String search3 = "";
		
		//dispatch the request to login.jsp resource
		List<CarInventory> cardetail1= new ArrayList<CarInventory>();
		cardetail1 = dao.searchCar(criteria, search1, search2, search3);
		
		//write the products data back to the client browser
		req.setAttribute("cardetail", cardetail1);
		
		String html = "<html><h3>Added to cart</h3></html>";
		resp.getWriter().write(html+" ");
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/html/carsearchresult.jsp");
		dispatcher.include(req, resp);
		
	}


}
