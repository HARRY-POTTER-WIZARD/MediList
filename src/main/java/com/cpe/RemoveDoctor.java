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
public class RemoveDoctor extends HttpServlet {

    public RemoveDoctor() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId=request.getParameter("userId");
		
		Connection conn = null;
		Statement stmt = null;
		String query="DELETE FROM `hospital`.`userinfo` WHERE (`UserId` = '"+userId+"');";



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
