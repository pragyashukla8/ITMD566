package com.test.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.beans.BookingData;
import com.test.beans.CarInventory;
import com.test.beans.Cart;
import com.test.dao.ApplicationDao;

@WebServlet("/shoppingcart")
public class ShoppingCart extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse   resp) throws ServletException, IOException {
		
		System.out.println("shopping cart doget.....");
		int customerid=0;
		ApplicationDao dao= new ApplicationDao();
		List<Cart> cartdetail= new ArrayList<Cart>();
		
		//set up the HTTP session
		HttpSession session = req.getSession();
							
		//get the username as an attribute
		String username = (String) session.getAttribute("username");
						
		//Calling ApplicationDao to get userid
		customerid=dao.getUserID(username);
						
		if(customerid ==0) {
							
			String html = "<html><h3>Cannot find user</h3></html>";
			resp.getWriter().write(html+" ");
							
		   	RequestDispatcher dispatcher = req.getRequestDispatcher("/html/login.jsp");
			dispatcher.include(req, resp);
		}
		
		cartdetail = dao.getCartUser(customerid);
		
		//write the cart data back to the client browser
		req.setAttribute("cartdetail", cartdetail);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/html/shoppingcart.jsp");
		dispatcher.include(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("In cart post method");
		int rowdeleted = 0;
		BookingData bookingdata= new BookingData();
		ApplicationDao dao= new ApplicationDao();
		String itemname = req.getParameter("itemname");
		int itemid = Integer.parseInt(req.getParameter("itemid"));
		int quantity = Integer.parseInt(req.getParameter("quantity"));
		float cost = Float.parseFloat(req.getParameter("price"));
		if(req.getParameter("remove")!= null) {
			System.out.print("in remove condition");
			dao.deleteCart(itemid);
			List<Cart> cartdetail= new ArrayList<Cart>();
			int customerid;
			
			//set up the HTTP session
			HttpSession session = req.getSession();
								
			//get the username as an attribute
			String username = (String) session.getAttribute("username");
							
			//Calling ApplicationDao to get userid
			customerid=dao.getUserID(username);
							
			if(customerid ==0) {
								
				String html = "<html><h3>Cannot find user</h3></html>";
				resp.getWriter().write(html+" ");
								
			   	RequestDispatcher dispatcher = req.getRequestDispatcher("/html/login.jsp");
				dispatcher.include(req, resp);
			}
			
			cartdetail = dao.getCartUser(customerid);
			
			//write the cart data back to the client browser
			req.setAttribute("cartdetail", cartdetail);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/html/shoppingcart.jsp");
			dispatcher.include(req, resp);
		}
		
		if(req.getParameter("checkout") != null) {
			System.out.println("In checkout condition");
			int rowupdated = 0;
			rowupdated = dao.updateCartQuantity(quantity, itemid);
			
			if (rowupdated == 1) {
				
				List<Cart> cartdetail= new ArrayList<Cart>();
				int customerid;
				
				//set up the HTTP session
				HttpSession session = req.getSession();
									
				//get the username as an attribute
				String username = (String) session.getAttribute("username");
								
				//Calling ApplicationDao to get userid
				customerid=dao.getUserID(username);
								
				if(customerid ==0) {
									
					String html = "<html><h3>Cannot find user</h3></html>";
					resp.getWriter().write(html+" ");
									
				   	RequestDispatcher dispatcher = req.getRequestDispatcher("/html/login.jsp");
					dispatcher.include(req, resp);
				}
				
				String html = "<html><h3>Some Error Occurred</h3></html>";
				resp.getWriter().write(html+" ");
				
				cartdetail = dao.getCartUser(customerid);
				
				
				//write the cart data back to the client browser
				req.setAttribute("cartdetail", cartdetail);
				RequestDispatcher dispatcher = req.getRequestDispatcher("/html/shoppingcart.jsp");
				dispatcher.include(req, resp);
				
			}
		}
	
	}
}
