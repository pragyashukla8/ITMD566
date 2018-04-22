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
import com.test.beans.Users;
import com.test.dao.ApplicationDao;

@WebServlet("/customer")
public class CustomerPage extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		System.out.println("In customerpage doget method");
		List<Users> userdetail= new ArrayList<Users>();
		//collect the carid from screen
		//int carid = Integer.parseInt(req.getParameter("carid"));
		
		//set up the HTTP session
		HttpSession session = req.getSession();
					
		//get the username as an attribute
		String username = (String) session.getAttribute("username");
			
		//Calling ApplicationDao to get userid
		int userid=0;
		ApplicationDao dao= new ApplicationDao();
		userid=dao.getUserID(username);
		System.out.println("userid" + userid);
				
		if(userid ==0) {
			
			String html = "<html><h3>Cannot find user</h3></html>";
			resp.getWriter().write(html+" ");
					
			RequestDispatcher dispatcher = req.getRequestDispatcher("/html/customerpage.jsp");
			dispatcher.include(req, resp);
		}
		
		//call DAO layer and get all products for search criteria
		userdetail = dao.getUserDetail(userid);
		
		//write the products data back to the client browser
		req.setAttribute("userdetail", userdetail);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/html/customerpage.jsp");
		dispatcher.include(req, resp);
		
	}
	

}
