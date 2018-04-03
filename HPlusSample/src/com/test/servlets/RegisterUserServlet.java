package com.test.servlets;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.text.MessageFormat;
import java.text.SimpleDateFormat;
import java.sql.Date;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.beans.*;
import com.test.dao.ApplicationDao;

@WebServlet("/registerUser")
public class RegisterUserServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// collect all form data
		try {
			
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String secretquestion = req.getParameter("secretquestion");
		String secretanswer = req.getParameter("secretanswer");
		String fname = req.getParameter("fname");
		String mname = req.getParameter("mname");
		String lname = req.getParameter("lname");
		String emailid = req.getParameter("emailid");
		String contact = req.getParameter("contact");
		String address = req.getParameter("address");
		String gender = req.getParameter("gender");
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
		Date dateofbirth = (Date) formatter.parse(req.getParameter("dateofbirth"));
		String usertype = req.getParameter("usertypes");
		String carddetail = req.getParameter("carddetail");
		String expiry = req.getParameter("expiry");
		String cardpassword = req.getParameter("cardpassword");
		int serviceid=0;
		int age = Integer.parseInt(req.getParameter("age"));
		
		
		// fill it up in a Login
		Login login = new Login(username, password,emailid, secretquestion, secretanswer, usertype);
		
		// fill it up in a Users
		Users users = new Users(fname, mname, lname, contact, address, emailid, gender, dateofbirth, usertype, serviceid);

		// fill it up in a Users
		//Users users = new Users(fname, mname, lname, contact, address, emailid, gender, dateofbirth, usertype, serviceid);


		// call DAO layer and save the users object to DB
		ApplicationDao dao = new ApplicationDao();
		int rows = dao.registerUser(users);
		

		// prepare an information message for user about the success or failure of the operation
		String infoMessage = null;
		if(rows==0){
			infoMessage="Sorry, an error occurred!";
		}
		else{
			infoMessage="User registered successfully!";
		}

		// write the message back to the page in client browser\
		String page = getHTMLString(req.getServletContext().getRealPath("/html/register.html"), infoMessage);
		resp.getWriter().write(page);
		
		} catch (Exception exception) {
			exception.printStackTrace();
		}
					
				
	}
	
	public String getHTMLString(String filePath, String message) throws IOException{
		BufferedReader reader = new BufferedReader(new FileReader(filePath));
		String line="";
		StringBuffer buffer = new StringBuffer();
		while((line=reader.readLine())!=null){
			buffer.append(line);
		}
		
		reader.close();
		String page = buffer.toString();
		
		page = MessageFormat.format(page, message);
		
		return page;
		
		
	}
		
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String page = getHTMLString(req.getServletContext().getRealPath("/html/register.html"), "");
		resp.getWriter().write(page);
	}

	
}
