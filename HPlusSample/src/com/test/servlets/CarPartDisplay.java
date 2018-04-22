package com.test.servlets;

import java.io.IOException;
import java.util.ArrayList;
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
import com.test.beans.PartInventory;
import com.test.dao.ApplicationDao;

@WebServlet("/carpartdisplay")
public class CarPartDisplay extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		System.out.println("In car display dopost method");
		int rowinserted =0;
		int partid = Integer.parseInt(req.getParameter("partid"));
		
		// moving variables for cart
		ApplicationDao dao= new ApplicationDao();
		Cart cart= new Cart();
		List<PartInventory> partdetail= new ArrayList<PartInventory>();
		
		partdetail= dao.getPartInventory(partid);
		
		Iterator<PartInventory> iterator = partdetail.iterator();
		while (iterator.hasNext()) {
			PartInventory partinventory = iterator.next();
			cart.setProviderid(partinventory.getProviderid());
			cart.setServiceid(partinventory.getServiceid());
			cart.setItemname(partinventory.getName());
			cart.setCost(partinventory.getCost());
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
		
		String criteria = "";
		String search1 = "";
		String search2 = "";
		
		//dispatch the request to login.jsp resource
		List<PartInventory> partdetail1= new ArrayList<PartInventory>();
		partdetail1 = dao.searchPart(criteria, search1, search2);
		
		//write the products data back to the client browser
		req.setAttribute("partdetail", partdetail1);
		//write the products data back to the client browser
		String html = "<html><h3>Added to cart</h3></html>";
		resp.getWriter().write(html+" ");
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/html/partsearchresult.jsp");
		dispatcher.include(req, resp);
		
	}
	

}
