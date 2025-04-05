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
public class AddDoctor extends HttpServlet {

    public AddDoctor() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName=request.getParameter("userName");
		String name=request.getParameter("name");
		String eMail=request.getParameter("email");
		String phoneNo=request.getParameter("phoneNumber");
		String gender=request.getParameter("gender");
		String address=request.getParameter("address");
		String password=request.getParameter("password");
		String spaciality=request.getParameter("spaciality");
		Connection conn = null;
		Statement stmt = null;
		String query="INSERT INTO `hospital`.`userinfo` (`UserId`, `Name`, `Password`, `EmailId`, `Phone_no`, `Address`,`Speciality`, `Gender`,`UserType`) VALUES ('"+userName+"','"+name+"','"+password+"','"+eMail+"','"+phoneNo+"','"+address+"','"+spaciality+"','"+gender+"','Doctor');";



		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			 conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "2004");
			 stmt= conn.createStatement();
			stmt.executeUpdate(query);
			response.sendRedirect("Admin.jsp");
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
