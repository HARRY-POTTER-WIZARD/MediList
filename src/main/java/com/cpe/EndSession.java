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
public class EndSession extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		 HttpSession se=request.getSession(false);
		 String DoctorName=null;
		 String PatientName=null;
		String userType=(String)se.getAttribute("userType");
		 
		if(userType.equals("Doctor")){
			PatientName=(String)se.getAttribute("PName");
			  DoctorName=(String)se.getAttribute("name"); 
		}else if(userType.equals("patient")){
			DoctorName=(String)se.getAttribute("DName");
			 PatientName=(String)se.getAttribute("name"); 
			
		}
		Connection conn = null;
		Statement stmt = null;
		log(PatientName+DoctorName);
		String query="DELETE FROM sectioncreation WHERE PatientName='"+PatientName+"' and DoctorName='"+DoctorName+"';";
		String query1="DELETE FROM chatinfo WHERE from_1='"+PatientName+"' or from_1='"+DoctorName+"';";


		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			 conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "2004");
			 stmt= conn.createStatement();
			stmt.executeUpdate(query);
			stmt.executeUpdate(query1);
			if(userType.equals("Doctor")){
				response.sendRedirect("Doctor.jsp");
			}else if(userType.equals("patient")){
				response.sendRedirect("Patient.jsp");
			}
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
