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
import com.test.beans.PartInventory;
import com.test.beans.Users;
import com.test.dao.ApplicationDao;

@WebServlet("/customerinfo")
public class CustomerHome extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("In customer home post method");
		int rowdeleted=0;
		List<PartInventory> partdetail= new ArrayList<PartInventory>();
		List<Users> userdetail= new ArrayList<Users>();
		ApplicationDao dao= new ApplicationDao();
		String email ="";
		//String email = req.getParameter("email");
		String partid1 = req.getParameter("postpartid");
		if(partid1.equals(null)) {
			partid1="0";
		}
		int postpartid = Integer.parseInt(req.getParameter("postpartid"));
		System.out.println("email :" + email);
		System.out.println("postpartid :" + postpartid);
		
		if(req.getParameter("editpostdetail") != null) {
			
			System.out.println("edit button");
			partdetail = dao.getPartInventory(postpartid);
			
			//write the products data back to the client browser
			req.setAttribute("partdetail", partdetail);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/html/carpartdetails.jsp");
			dispatcher.include(req, resp);
			
		}
		
		if(req.getParameter("delete") != null) {
			
			System.out.println("delete button");
			rowdeleted = dao.deletePartInventory(postpartid);
			
			//set up the HTTP session
			HttpSession session = req.getSession();
						
			//get the username as an attribute
			String username = (String) session.getAttribute("username");
					
			//Calling ApplicationDao to get userid
			int userid=0;
			userid=dao.getUserID(username);
					
			if(userid ==0) {
						
				String html = "<html><h3>Cannot find user</h3></html>";
				resp.getWriter().write(html+" ");
						
		    	RequestDispatcher dispatcher = req.getRequestDispatcher("/html/login.jsp");
				dispatcher.include(req, resp);
			}			
			userdetail = dao.getUserDetail(userid);
			partdetail = dao.getPartAdUser(userid);
			
			//write the products data back to the client browser
			req.setAttribute("userdetail", userdetail);
			req.setAttribute("partdetail", partdetail);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/html/customerhome.jsp");
			dispatcher.include(req, resp);

			
		}
		
			
	}
	

}
