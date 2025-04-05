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
public class MakeAppointment extends HttpServlet {
       
  
    public MakeAppointment() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String name= request.getParameter("Name");
			  HttpSession se=request.getSession(false);  
			  String Pname=(String)se.getAttribute("name");  
			Connection conn = null;
			Statement stmt = null;
			String query="INSERT INTO sectioncreation (`DoctorName`, `PatientName`,  `requeStatus`) VALUES ('"+name+"','"+Pname+"','Pending');";



			try {
				Class.forName("com.mysql.cj.jdbc.Driver");

				 conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "2004");
				 stmt= conn.createStatement();
				stmt.executeUpdate(query);
				response.sendRedirect("Patient.jsp");
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
