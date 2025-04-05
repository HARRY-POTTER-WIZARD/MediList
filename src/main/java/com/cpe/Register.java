package com.cpe;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class Register extends HttpServlet {
    
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName=request.getParameter("userId");
		String name=request.getParameter("Name");
		String eMail=request.getParameter("EMail");
		String phoneNo=request.getParameter("contact");
		String age=request.getParameter("age");
		String gender=request.getParameter("gender");
		String address=request.getParameter("address");
		String conformPassword=request.getParameter("conformPassword");
		String password=request.getParameter("password");
		String patientHistory =request.getParameter("patientHistory");
		Connection conn = null;
		Statement stmt = null;
		String query="INSERT INTO `hospital`.`userinfo` (`UserId`, `Name`, `Password`, `EmailId`, `Phone_no`, `Address`, `Age`, `Gender`,  `MedicalHistory`,`UserType`) VALUES ('"+userName+"','"+name+"','"+password+"','"+eMail+"','"+phoneNo+"','"+address+"','"+age+"','"+gender+"','"+patientHistory+"','patient');";



		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			 conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "2004");
			 stmt= conn.createStatement();
			stmt.executeUpdate(query);
			request.getRequestDispatcher("Login.html").forward(request, response);
		}catch (Exception e) {
			System.out.println(e);
			response.sendRedirect("Error.jsp");
		}finally {
			try {
			if (stmt != null) {
			stmt.close();
			}
			if (conn != null) {
			conn.close();
			}
			} catch (Exception e) {
			e.printStackTrace();
			}
			}
		doGet(request, response);
	}

}
