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
import com.test.beans.Login;
import com.test.beans.PartInventory;
import com.test.beans.Users;
import com.test.dao.ApplicationDao;

@WebServlet("/login")
public class LoginServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//dispatch the request to login.jsp resource
		
		String html = "<html><h3>Please login</h3></html>";
		resp.getWriter().write(html+" ");
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/html/login.jsp");
		dispatcher.include(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		boolean isauthorised= false;
		//get the username and password from the login form
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		
		// Authentication of user and password
		Login login= new Login();
		login.setUsername(username);
		login.setPassword(password);
		ApplicationDao dao= new ApplicationDao();
		isauthorised = dao.authenticateLogin(login);
		
		if(isauthorised) {
		
			//set up the HTTP session
			HttpSession session = req.getSession();
			
				
			//set the username as an attribute
			session.setAttribute("username", username);
			System.out.println("Login successfull");
			
			List<Users> userdetail= new ArrayList<Users>();
			List<CarInventory> cardetail= new ArrayList<CarInventory>();
			List<PartInventory> partdetail= new ArrayList<PartInventory>();
			//collect the carid from screen
			//int carid = Integer.parseInt(req.getParameter("carid"));
			
			//get the username as an attribute
			//String username = (String) session.getAttribute("username");
				
			//Calling ApplicationDao to get userid
			int userid=0;
			userid=dao.getUserID(username);
			//System.out.println("userid" + userid);
					
			if(userid ==0) {
				
				String html = "<html><h3>Cannot find user</h3></html>";
				resp.getWriter().write(html+" ");
						
				RequestDispatcher dispatcher = req.getRequestDispatcher("/html/customerpage.jsp");
				dispatcher.include(req, resp);
			}
			
			//call DAO layer and get all products for search criteria
			userdetail = dao.getUserDetail(userid);
			cardetail = dao.getCarInventory(userid);
			partdetail = dao.getPartAdUser(userid);
			
			//write the products data back to the client browser
			req.setAttribute("userdetail", userdetail);
			req.setAttribute("partdetail", partdetail);
			req.setAttribute("cardetail", cardetail);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/html/customerhome.jsp");
			dispatcher.include(req, resp);

			
			
			//forward to home jsp
			//RequestDispatcher dispatcher = req.getRequestDispatcher("/html/customerpage.jsp");
			//dispatcher.include(req, resp);
			}else {
			
			String html = "<html><h3>Invalid User name or password</h3></html>";
			resp.getWriter().write(html+" ");
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("/html/login.jsp");
			dispatcher.include(req, resp);
		}
	}

}
