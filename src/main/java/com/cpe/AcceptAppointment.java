package com.cpe;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@SuppressWarnings("serial")
public class AcceptAppointment extends HttpServlet {
    Connection conn = null;
	  Statement stmt = null;
	  String query;
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String PNmae=request.getParameter("PName");
		  HttpSession se=request.getSession(false);  
		  String name=(String)se.getAttribute("name");  
		query="UPDATE sectioncreation SET requeStatus='Accepted' WHERE DoctorName='"+name+"' && PatientName='"+PNmae+"' limit 1;";

		

 	  try {
 	  	Class.forName("com.mysql.cj.jdbc.Driver");

 	  	 conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "2004");
 	  	 stmt= conn.createStatement();
 	  	stmt.executeUpdate(query);
		se.setAttribute("PName",PNmae);
		response.sendRedirect("Chart.jsp");
 	  }catch (Exception e) {
 	  	log(e.getMessage());
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
