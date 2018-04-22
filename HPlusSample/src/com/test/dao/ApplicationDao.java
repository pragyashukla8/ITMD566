package com.test.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.PreparedStatement;
import com.test.beans.Product;
import com.test.beans.*;

public class ApplicationDao {

	public List<Product> searchProducts(String searchString) {
		Product product = null;
		List<Product> products = new ArrayList<>();

		try {
			Connection connection = DBConnection.getConnectionToDatabase();

			String sql = "select * from products where product_name like '%" + searchString + "%'";

			Statement statement = connection.createStatement();

			ResultSet set = statement.executeQuery(sql);

			while (set.next()) {
				product = new Product();
				product.setProductId(set.getInt("product_id"));
				product.setProductImgPath(set.getString("image_path"));
				product.setProductName(set.getString("product_name"));
				products.add(product);

			}

		} catch (SQLException exception) {
			exception.printStackTrace();
		}
		return products;
	}
	
	public int createLogin(Login login) {
		int rowsAffected = 0;

		try {
			// get the connection for the database
			Connection connection = DBConnection.getConnectionToDatabase();

			// write the insert query
			String insertQuery = "insert into login values(?,?,?,?,?,?)";

			// set parameters with PreparedStatement
			java.sql.PreparedStatement statement = connection.prepareStatement(insertQuery);
			statement.setString(1, login.getUsername());
			statement.setString(2, login.getPassword());
			statement.setString(3, login.getEmailid());
			statement.setString(4, login.getSecretquestion());
			statement.setString(5, login.getSecretanswer());
			statement.setString(6, login.getUsertype());
			
			// execute the statement
			rowsAffected = statement.executeUpdate();

		} catch (SQLException exception) {
			exception.printStackTrace();
		}
		return rowsAffected;
	}


	public int registerUser(Users users, BillingData billingdata) {
		int rowsAffected = 0;

		try {
			// get the connection for the database
			Connection connection = DBConnection.getConnectionToDatabase();
			
			//Get last value of ID from Users Table 
			int incrementeduserid=0;
			java.sql.PreparedStatement pst1 = connection.prepareStatement("select max(userid) from users");
            ResultSet rs = pst1.executeQuery();
            while(rs.next())
            {            	
            	incrementeduserid = rs.getInt(1) + 1;
            }

            System.out.println("user from code :" + users.getDateofbirth());
			// write the insert query for Users table
			String insertQuery = "insert into users values(?,?,?,?,?,?,?,?,?,?,?)";

			// set parameters with PreparedStatement
			java.sql.PreparedStatement statement = connection.prepareStatement(insertQuery);
			statement.setInt(1, incrementeduserid);
			statement.setString(2, users.getFname());
			statement.setString(3, users.getMname());
			statement.setString(4, users.getLname());
			statement.setString(5, users.getContact());
			statement.setString(6, users.getAddress());
			statement.setString(7, users.getEmailid());
			statement.setString(8, users.getGender()); 	 
			statement.setString(9, users.getRole());
			statement.setInt(10, users.getServiceid());
			statement.setString(11, users.getDateofbirth());
			

			// execute the statement
			rowsAffected = statement.executeUpdate();
			
			if(rowsAffected!=0) {
				rowsAffected =0;
				// write the insert query for BillingData table
				String insertcardQuery = "insert into billingdata values(?,?,?,?)";
	
				// set parameters with PreparedStatement
				java.sql.PreparedStatement stmt = connection.prepareStatement(insertcardQuery);
				stmt.setInt(1, incrementeduserid);
				stmt.setString(2, billingdata.getCarddetails());
				stmt.setString(3, billingdata.getExpiry());
				stmt.setString(4, billingdata.getPassword());
				
				// execute the statement
				rowsAffected = stmt.executeUpdate();

			}

		} catch (SQLException exception) {
			exception.printStackTrace();
		}
		return rowsAffected;
	}
	
	public List<Users> getUserDetail(int userid) {
		Users users = null;
		List<Users> userdetail = new ArrayList<Users>();

		try {
			Connection connection = DBConnection.getConnectionToDatabase();

			String sql = "select * from users where userid =" + userid;

			Statement statement = connection.createStatement();

			ResultSet set = statement.executeQuery(sql);

			while (set.next()) {
				System.out.println("Recieved data from users");
				users = new Users();
				users.setUserID(set.getInt("userid"));
				users.setFname(set.getString("fname"));
				users.setMname(set.getString("mname"));
				users.setLname(set.getString("lname"));
				users.setContact(set.getString("contact"));
				users.setAddress(set.getString("address"));
				users.setEmailid(set.getString("emailid"));
				users.setGender(set.getString("gender"));
				users.setDateofbirth(set.getString("dateofbirth"));
				users.setRole(set.getString("role"));
				users.setServiceid(set.getInt("serviceid"));
				System.out.println("userid :" + users.getUserID());
				System.out.println("fname :" + users.getFname());
				System.out.println("mname :" + users.getMname());
				System.out.println("lname :" + users.getLname());
				System.out.println("contact :" + users.getContact());
				System.out.println("address :" + users.getAddress());
				System.out.println("emailid :" + users.getEmailid());
				System.out.println("gender :" + users.getGender());
				System.out.println("dateofbirth :" + users.getDateofbirth());
				System.out.println("role :" + users.getRole());
				System.out.println("serviceid :" + users.getServiceid());
				
				userdetail.add(users);
			}

		} catch (SQLException exception) {
			exception.printStackTrace();
		}
		return userdetail;
	}


	public int deleteLogin(Login login) {
		int rowsAffected = 0;

		try {
			// get the connection for the database
			Connection connection = DBConnection.getConnectionToDatabase();

			// write the insert query
			String deleteQuery = "Delete from login where username = ?";

			// set parameters with PreparedStatement
			java.sql.PreparedStatement statement = connection.prepareStatement(deleteQuery);
			statement.setString(1, login.getUsername());
			
			// execute the statement
			rowsAffected = statement.executeUpdate();

		} catch (SQLException exception) {
			exception.printStackTrace();
		}
		return rowsAffected;
	}

	public boolean authenticateLogin(Login login) {
		boolean isauthorised = false;

		try {
			// get the connection for the database
			Connection connection = DBConnection.getConnectionToDatabase();
			
			// getting username and password
			String username = login.getUsername();
			String password = login.getPassword();

			// write the insert query
			String selectQuery = "Select * from login where username = '" + username + "' and password= '" + password + "'";
						
			// execute the statement
			
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery(selectQuery);
			
			if(rs.next()) {
				isauthorised = true;				
			}

		} catch (SQLException exception) {
			exception.printStackTrace();
		}
		return isauthorised;
	}

	public boolean forgetPassword(Login login) {
		boolean isauthorised = false;

		try {
			// get the connection for the database
			Connection connection = DBConnection.getConnectionToDatabase();
			
			// getting username and password
			String username = login.getUsername();
			String emailid = login.getEmailid();
			String secretquestion = login.getSecretquestion();
			String secretanswer = login.getSecretanswer();

			// write the insert query
			String selectQuery = "Select * from login where username = '" + username +"' and emailid = '" + emailid + "' and secretquestion= '" + secretquestion + "' and secretanswer= '" + secretanswer +"'";
			System.out.println("select query :" + selectQuery);
			
			// execute the statement
			
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery(selectQuery);
			
			if(rs.next()) {
				isauthorised = true;
				System.out.println("select user authorised");
			}

		} catch (SQLException exception) {
			exception.printStackTrace();
		}
		return isauthorised;
	}

	public boolean updateLogin(Login login) {
		boolean isupdated = false;

		try {
			// get the connection for the database
			Connection connection = DBConnection.getConnectionToDatabase();
			
			// getting username and password
			String username = login.getUsername();
			String emailid = login.getEmailid();
			String newpassword = login.getPassword();
			
			System.out.println("dao username :" + username );
			System.out.println("dao emailid :" + emailid );
			System.out.println("dao newpassword :" + newpassword );
			
			// write the insert query
			String updateQuery = "Update login set password = '" + newpassword + "' where username = '" + username + "' and emailid = '" + emailid +"'";
			System.out.println("update query :" + updateQuery);
			
			// execute the statement
			
			Statement statement = connection.createStatement();
			int rs = statement.executeUpdate(updateQuery);
			
			if(rs > 0) {
				isupdated = true;
				System.out.println("password updated");
			}

		} catch (SQLException exception) {
			exception.printStackTrace();
		}
		return isupdated;
	}

	public int addCarInventory(CarInventory carinventory) {
		int rowinserted = 0;

		try {
			// get the connection for the database
			Connection connection = DBConnection.getConnectionToDatabase();
			
			//Get last value of CarID from CarInventory Table 
			int incrementcarid=0;
			java.sql.PreparedStatement pst1 = connection.prepareStatement("select max(carid) from carinventory");
            ResultSet rs = pst1.executeQuery();
            while(rs.next())
            {            	
            	incrementcarid = rs.getInt(1) + 1;
            }

			
			// write the insert query for Users table
			String insertQuery = "insert into carinventory values(?,?,?,?,?,?,?,?,?,?,?,?,?)";

			// set parameters with PreparedStatement
			java.sql.PreparedStatement statement = connection.prepareStatement(insertQuery);
			statement.setInt(1, incrementcarid);
			statement.setInt(2, carinventory.getProviderid());
			statement.setInt(3, carinventory.getServiceid());
			statement.setString(4, carinventory.getCarmodel());
			statement.setString(5, carinventory.getCarmake());
			statement.setString(6, carinventory.getMileage());
			statement.setString(7, carinventory.getYearmake());
			statement.setString(8, carinventory.getStatus()); 	 
			statement.setFloat(9, carinventory.getKmrun());
			statement.setFloat(10, carinventory.getCost());
			statement.setString(11, carinventory.getDescription());
			statement.setString(12, carinventory.getColor());
			statement.setString(13, carinventory.getImagepath());

			// execute the statement
			rowinserted = statement.executeUpdate();
			
			} catch (SQLException exception) {
			exception.printStackTrace();
		}
		return rowinserted;
	}

	public List<CarInventory> getCarInventory(int carid) {
		CarInventory carinventory = null;
		List<CarInventory> cardetails = new ArrayList<CarInventory>();

		try {
			Connection connection = DBConnection.getConnectionToDatabase();

			String sql = "select * from carinventory where carid =" + carid;

			Statement statement = connection.createStatement();

			ResultSet set = statement.executeQuery(sql);

			while (set.next()) {
				System.out.println("Recieved data from carinventory");
				carinventory = new CarInventory();
				carinventory.setCarid(set.getInt("carid"));
				carinventory.setProviderid(set.getInt("providerid"));
				carinventory.setServiceid(set.getInt("serviceid"));
				carinventory.setCarmodel(set.getString("carmodel"));
				carinventory.setCarmake(set.getString("carmake"));
				carinventory.setMileage(set.getString("mileage"));
				carinventory.setYearmake(set.getString("yearmake"));
				carinventory.setStatus(set.getString("status"));
				carinventory.setKmrun(set.getFloat("kmrun"));
				carinventory.setCost(set.getFloat("cost"));
				carinventory.setDescription(set.getString("description"));
				carinventory.setColor(set.getString("color"));
				carinventory.setImagepath(set.getString("imagepath"));
				cardetails.add(carinventory);
				
				System.out.println("Description :" + carinventory.getDescription());
			}

		} catch (SQLException exception) {
			exception.printStackTrace();
		}
		return cardetails;
	}

	public List<CarInventory> searchCar(String criteria, String search1, String search2, String search3) {
		CarInventory carinventory = null;
		List<CarInventory> cardetails = new ArrayList<CarInventory>();
		System.out.println("In search car dao function");

		try {
			Connection connection = DBConnection.getConnectionToDatabase();
			String sql= null;
			if(criteria.equals("Asc")) {
				
				if((search1.equals("")) && (search2.equals("")) && (search3.equals(""))) {
					sql = "select * from carinventory order by cost ASC";
				}
				if((!search1.equals("")) && (!search2.equals("")) && (!search3.equals(""))) {
					sql = "select * from carinventory where carmodel ='" + search1 + "' and carmake ='" + search2 + "' and color ='" + search3 + "' order by cost ASC";
				}
				if((search1.equals("")) && (!search2.equals("")) && (!search3.equals(""))) {
					sql = "select * from carinventory where carmake ='" + search2 + "' and color ='" + search3 + "' order by cost ASC";
				}
				if((!search1.equals("")) && (search2.equals("")) && (!search3.equals(""))) {
					sql = "select * from carinventory where carmodel ='" + search1 + "' and color ='" + search3 + "' order by cost ASC";
				}
				if((!search1.equals("")) && (!search2.equals("")) && (search3.equals(""))) {
					sql = "select * from carinventory where carmodel ='" + search1 + "' and carmake ='" + search2 + "' order by cost ASC";
				}
				if((!search1.equals("")) && (search2.equals("")) && (search3.equals(""))) {
					sql = "select * from carinventory where carmodel ='" + search1 + "' order by cost ASC";
				}
				if((search1.equals("")) && (!search2.equals("")) && (search3.equals(""))) {
					sql = "select * from carinventory where carmake ='" + search2 + "' order by cost ASC";
				}
				if((search1.equals("")) && (search2.equals("")) && (!search3.equals(""))) {
					sql = "select * from carinventory where color ='" + search3 + "' order by cost ASC";
				}
			}else {
				if((search1.equals("")) && (search2.equals("")) && (search3.equals(""))) {
					sql = "select * from carinventory order by cost DESC";
				}
				if((!search1.equals("")) && (!search2.equals("")) && (!search3.equals(""))) {
					sql = "select * from carinventory where carmodel ='" + search1 + "' and carmake ='" + search2 + "' and color ='" + search3 + "' order by cost DESC";
				}
				if((search1.equals("")) && (!search2.equals("")) && (!search3.equals(""))) {
					sql = "select * from carinventory where carmake ='" + search2 + "' and color ='" + search3 + "' order by cost DESC";
				}
				if((!search1.equals("")) && (search2.equals("")) && (!search3.equals(""))) {
					sql = "select * from carinventory where carmodel ='" + search1 + "' and color ='" + search3 + "' order by cost DESC";
				}
				if((!search1.equals("")) && (!search2.equals("")) && (search3.equals(""))) {
					sql = "select * from carinventory where carmodel ='" + search1 + "' and carmake ='" + search2 + "' order by cost DESC";
				}
				if((!search1.equals("")) && (search2.equals("")) && (search3.equals(""))) {
					sql = "select * from carinventory where carmodel ='" + search1 + "' order by cost DESC";
				}
				if((search1.equals("")) && (!search2.equals("")) && (search3.equals(""))) {
					sql = "select * from carinventory where carmake ='" + search2 + "' order by cost DESC";
				}
				if((search1.equals("")) && (search2.equals("")) && (!search3.equals(""))) {
					sql = "select * from carinventory where color ='" + search3 + "' order by cost DESC";
				}
			}
			System.out.println("Sql query :" + sql);
			
			Statement statement = connection.createStatement();

			ResultSet set = statement.executeQuery(sql);

			while (set.next()) {
				System.out.println("Recieved data from carinventory");
				carinventory = new CarInventory();
				carinventory.setCarid(set.getInt("carid"));
				carinventory.setProviderid(set.getInt("providerid"));
				carinventory.setServiceid(set.getInt("serviceid"));
				carinventory.setCarmodel(set.getString("carmodel"));
				carinventory.setCarmake(set.getString("carmake"));
				carinventory.setMileage(set.getString("mileage"));
				carinventory.setYearmake(set.getString("yearmake"));
				carinventory.setStatus(set.getString("status"));
				carinventory.setKmrun(set.getFloat("kmrun"));
				carinventory.setCost(set.getFloat("cost"));
				carinventory.setDescription(set.getString("description"));
				carinventory.setColor(set.getString("color"));
				carinventory.setImagepath(set.getString("imagepath"));
				cardetails.add(carinventory);
				
				System.out.println("Description :" + carinventory.getDescription());
			}

		} catch (SQLException exception) {
			exception.printStackTrace();
		}
		return cardetails;
	}
	
	
	public int deleteCarInventory(int carid) {
		int rowsAffected = 0;

		try {
			// get the connection for the database
			Connection connection = DBConnection.getConnectionToDatabase();

			// write the insert query
			String deleteQuery = "Delete from carinventory where carid = ?";

			// set parameters with PreparedStatement
			java.sql.PreparedStatement statement = connection.prepareStatement(deleteQuery);
			statement.setInt(1, carid);
			
			// execute the statement
			rowsAffected = statement.executeUpdate();

		} catch (SQLException exception) {
			exception.printStackTrace();
		}
		return rowsAffected;
	}

	public int updateCarInventory(CarInventory carinventory) {
		int rowupdated = 0;

		try {
			// get the connection for the database
			Connection connection = DBConnection.getConnectionToDatabase();
			int carid= carinventory.getCarid();
			int providerid = carinventory.getProviderid();
			int serviceid = carinventory.getServiceid();
			String carmodel = carinventory.getCarmodel();
			String carmake = carinventory.getCarmake();
			String mileage = carinventory.getMileage();
			String yearmake = carinventory.getYearmake();
			String status = carinventory.getStatus();
			float kmrun = carinventory.getKmrun();
			float cost = carinventory.getCost();
			String description = carinventory.getDescription();
			String color = carinventory.getColor();
			String imagepath = carinventory.getImagepath();
			
			// write the insert query for Users table
			String updateQuery = "Update carinventory set carid = " + carid +", providerid = " + providerid + ", serviceid = " + serviceid + ", carmodel = '" + carmodel + "' , carmake ='" + carmake + "' , mileage ='" + mileage +"' , yearmake ='" + yearmake + "' , status ='" + status + "' , kmrun = " + kmrun + " , cost = " + cost + " , description = '" + description + "' , color = '" + color + "' , imagepath = '" + imagepath +"' where carid = " + carid ;
			
			// execute the statement
			
			Statement statement = connection.createStatement();
			rowupdated = statement.executeUpdate(updateQuery);
			
						
			} catch (SQLException exception) {
			exception.printStackTrace();
		}
		return rowupdated;
	}

	
	public int addPartInventory(PartInventory partinventory) {
		int rowinserted = 0;
		System.out.println("in add part inventory");
		try {
			// get the connection for the database
			Connection connection = DBConnection.getConnectionToDatabase();
			
			//Get last value of CarID from CarInventory Table 
			int incrementpartid=0;
			java.sql.PreparedStatement pst1 = connection.prepareStatement("select max(partid) from partinventory");
            ResultSet rs = pst1.executeQuery();
            while(rs.next())
            {            	
            	incrementpartid = rs.getInt(1) + 1;
            }

			
			// write the insert query for Users table
			String insertQuery = "insert into partinventory values(?,?,?,?,?,?,?,?,?)";

			// set parameters with PreparedStatement
			java.sql.PreparedStatement statement = connection.prepareStatement(insertQuery);
			statement.setInt(1, incrementpartid);
			statement.setInt(2, partinventory.getProviderid());
			statement.setInt(3, partinventory.getServiceid());
			statement.setString(4, partinventory.getName());
			statement.setString(5, partinventory.getDescription());
			statement.setFloat(6, partinventory.getCost());
			statement.setString(7, partinventory.getStatus());
			statement.setString(8, partinventory.getCategory());
			statement.setString(9, partinventory.getImagepath());
			
			// execute the statement
			rowinserted = statement.executeUpdate();
			
			} catch (SQLException exception) {
			exception.printStackTrace();
		}
		return rowinserted;
	}

	public List<PartInventory> getPartInventory(int partid) {
		PartInventory partinventory = null;
		List<PartInventory> partdetail = new ArrayList<PartInventory>();

		try {
			Connection connection = DBConnection.getConnectionToDatabase();

			String sql = "select * from partinventory where partid =" + partid;

			Statement statement = connection.createStatement();

			ResultSet set = statement.executeQuery(sql);

			while (set.next()) {
				System.out.println("Recieved data from partinventory");
				partinventory = new PartInventory();
				partinventory.setPartid(set.getInt("partid"));
				partinventory.setProviderid(set.getInt("providerid"));
				partinventory.setServiceid(set.getInt("serviceid"));
				partinventory.setName(set.getString("name"));
				partinventory.setDescription(set.getString("description"));
				partinventory.setCost(set.getFloat("cost"));
				partinventory.setStatus(set.getString("status"));
				partinventory.setCategory(set.getString("category"));
				partinventory.setImagepath(set.getString("imagepath"));
				partdetail.add(partinventory);
			}

		} catch (SQLException exception) {
			exception.printStackTrace();
		}
		return partdetail;
	}

	public List<PartInventory> getPartAdUser(int userid) {
		PartInventory partinventory = null;
		List<PartInventory> partdetail = new ArrayList<PartInventory>();

		try {
			Connection connection = DBConnection.getConnectionToDatabase();

			String sql = "select * from partinventory where providerid =" + userid;

			Statement statement = connection.createStatement();

			ResultSet set = statement.executeQuery(sql);

			while (set.next()) {
				System.out.println("Recieved data from partinventory");
				partinventory = new PartInventory();
				partinventory.setPartid(set.getInt("partid"));
				partinventory.setProviderid(set.getInt("providerid"));
				partinventory.setServiceid(set.getInt("serviceid"));
				partinventory.setName(set.getString("name"));
				partinventory.setDescription(set.getString("description"));
				partinventory.setCost(set.getFloat("cost"));
				partinventory.setStatus(set.getString("status"));
				partinventory.setCategory(set.getString("category"));
				partinventory.setImagepath(set.getString("imagepath"));
				partdetail.add(partinventory);
			}

		} catch (SQLException exception) {
			exception.printStackTrace();
		}
		return partdetail;
	}

	
	public int updatePartInventory(PartInventory partinventory) {
		int rowupdated = 0;

		try {
			// get the connection for the database
			Connection connection = DBConnection.getConnectionToDatabase();
			int partid= partinventory.getPartid();
			int providerid = partinventory.getProviderid();
			int serviceid = partinventory.getServiceid();
			String name = partinventory.getName();
			String description = partinventory.getDescription();
			String category = partinventory.getCategory();
			String status = partinventory.getStatus();
			float cost = partinventory.getCost();
			String imagepath = partinventory.getImagepath();
			
			// write the insert query for Users table
			String updateQuery = "Update partinventory set partid = " + partid +", providerid = " + providerid + ", serviceid = " + serviceid + ", name = '" + name + "' , description ='" + description + "' , cost = " + cost + " , status = '" + status + "' , category = '" + category + "' , imagepath = '" + imagepath +"' where partid = " + partid ;
			System.out.println("updateQuery");
			// execute the statement
			
			Statement statement = connection.createStatement();
			rowupdated = statement.executeUpdate(updateQuery);
			
						
			} catch (SQLException exception) {
			exception.printStackTrace();
		}
		return rowupdated;
	}

	public List<PartInventory> searchPart(String criteria, String search1, String search2) {
		
		System.out.println("In search part method");
		PartInventory partinventory = null;
		List<PartInventory> partdetail = new ArrayList<PartInventory>();

		try {
			Connection connection = DBConnection.getConnectionToDatabase();
			String sql=null;

			if(criteria.equals("Asc")) {
				if((search1.equals("")) && (search2.equals(""))) {
					
					sql = "select * from partinventory order by cost ASC" ;
				}
				if((!search1.equals("")) && (!search2.equals(""))) {
					
					sql = "select * from partinventory where category = '" + search1 + "' and name = '" + search2 + "' order by cost ASC";
				}
				if((!search1.equals("")) && (search2.equals(""))) {
					
					sql = "select * from partinventory where category = '" + search1 + "' order by cost ASC";
				}
				if((search1.equals("")) && (!search2.equals(""))) {
					
					sql = "select * from partinventory where name = '" + search2 + "' order by cost ASC";
				}
			}else {
				if((search1.equals("")) && (search2.equals(""))) {
					
					sql = "select * from partinventory order by cost DESC" ;
				}
				if((!search1.equals("")) && (!search2.equals(""))) {
					
					sql = "select * from partinventory where category = '" + search1 + "' and name = '" + search2 + "' order by cost DESC";
				}
				if((!search1.equals("")) && (search2.equals(""))) {
					
					sql = "select * from partinventory where category = '" + search1 + "' order by cost DESC";
				}
				if((search1.equals("")) && (!search2.equals(""))) {
					
					sql = "select * from partinventory where name = '" + search2 + "' order by cost DESC";
				}
				
			}
			System.out.println("Sql query :" + sql);
			
			Statement statement = connection.createStatement();

			ResultSet set = statement.executeQuery(sql);

			while (set.next()) {
				System.out.println("Recieved data from partinventory");
				partinventory = new PartInventory();
				partinventory.setPartid(set.getInt("partid"));
				partinventory.setProviderid(set.getInt("providerid"));
				partinventory.setServiceid(set.getInt("serviceid"));
				partinventory.setName(set.getString("name"));
				partinventory.setDescription(set.getString("description"));
				partinventory.setCost(set.getFloat("cost"));
				partinventory.setStatus(set.getString("status"));
				partinventory.setCategory(set.getString("category"));
				partinventory.setImagepath(set.getString("imagepath"));
				partdetail.add(partinventory);
			}

		} catch (SQLException exception) {
			exception.printStackTrace();
		}
		return partdetail;
	}
	
	public int deletePartInventory(int partid) {
		int rowsAffected = 0;
		System.out.println("delete part data " + partid);
		try {
			// get the connection for the database
			Connection connection = DBConnection.getConnectionToDatabase();

			// write the insert query
			String deleteQuery = "Delete from partinventory where partid = ?";

			// set parameters with PreparedStatement
			java.sql.PreparedStatement statement = connection.prepareStatement(deleteQuery);
			statement.setInt(1, partid);
			
			// execute the statement
			rowsAffected = statement.executeUpdate();

		} catch (SQLException exception) {
			exception.printStackTrace();
		}
		return rowsAffected;
	}
	
	
	public int getUserID(String username) {
		
		int userid=0;
		try {
			// get the connection for the database
			Connection connection = DBConnection.getConnectionToDatabase();
			
			//Getting emailid from login using username 
			String emailid = null;
			java.sql.PreparedStatement pst1 = connection.prepareStatement("select emailid from login where username = '" + username +"'");
            ResultSet rs = pst1.executeQuery();
            while(rs.next())
            {            	
            	emailid = rs.getString(1);
            }
			
			// Getting select query for userid
			
			java.sql.PreparedStatement pst2 = connection.prepareStatement("select userid from users where emailid ='" + emailid +"'");
            ResultSet rs1 = pst2.executeQuery();
            while(rs1.next())
            {            	
            	userid = rs1.getInt(1);
            }
				
			} catch (SQLException exception) {
			exception.printStackTrace();
		}
		return userid;
	}

	public int addCart(Cart cart) {
		int rowinserted = 0;
		System.out.println("in add cart");
		try {
			// get the connection for the database
			Connection connection = DBConnection.getConnectionToDatabase();
			
			//Get last value of CarID from CarInventory Table 
			int incrementcartid=0;
			java.sql.PreparedStatement pst1 = connection.prepareStatement("select max(cartid) from cart");
            ResultSet rs = pst1.executeQuery();
            while(rs.next())
            {            	
            	incrementcartid = rs.getInt(1) + 1;
            }

			
			// write the insert query for Users table
			String insertQuery = "insert into cart values(?,?,?,?,?,?,?)";

			// set parameters with PreparedStatement
			java.sql.PreparedStatement statement = connection.prepareStatement(insertQuery);
			statement.setInt(1, incrementcartid);
			statement.setInt(2, cart.getCustomerid());
			statement.setInt(3, cart.getProviderid());
			statement.setInt(4, cart.getServiceid());
			statement.setString(5, cart.getItemname());
			statement.setFloat(6, cart.getCost());
			statement.setInt(7, cart.getQuantity());
			
			// execute the statement
			rowinserted = statement.executeUpdate();
			
			} catch (SQLException exception) {
			exception.printStackTrace();
		}
		return rowinserted;
	}
	
}