package com.cpe;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;







@SuppressWarnings("serial")

public class LoginServlet extends HttpServlet {
       

    public LoginServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		Connection conn = null;
		java.sql.Statement stmt = null;
		
		String userType;
		String name=request.getParameter("name");
		String pass=request.getParameter("password");
		String query = "select UserId,Password,UserType from hospital.userinfo where UserId='"+name+"';";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "2004");
				stmt =  conn.createStatement();
				ResultSet rs = stmt.executeQuery(query);
				PrintWriter out = response.getWriter();
				if (rs.next()) {
					 String Password=rs.getString("Password");
					userType=rs.getString("UserType");
				if (pass.equals(Password)){
					 HttpSession se=request.getSession(true);  
					se.setMaxInactiveInterval(-1);
				      se.setAttribute("name",name);
				      se.setAttribute("userType", userType);
					if(userType.equals("Admin")) {
				            response.sendRedirect("Admin.jsp");
					}else if(userType.equals("Doctor")) {
						response.sendRedirect("Doctor.jsp");
					}else if(userType.equals("patient")){
						response.sendRedirect("Patient.jsp");
					}
				}else{
					out.println("<script>alert('Incorrect Password');</script>");
					 RequestDispatcher rd = request.getRequestDispatcher("Login.html");
			            rd.include(request, response);
				
				}}else{
					out.println("<script>alert('Incorrect UserId');</script>");
					 RequestDispatcher rd = request.getRequestDispatcher("Login.html");
			            rd.include(request, response);
				
				}
				out.close();
			} catch (Exception e) {
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
	}
	}


