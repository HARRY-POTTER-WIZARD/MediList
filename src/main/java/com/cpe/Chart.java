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

import org.json.simple.JSONArray;


@SuppressWarnings("serial")
public class Chart extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

JSONArray list=new JSONArray();
Connection conn = null;
String otherName=null;
Statement stmt = null;

//HttpSession se=request.getSession(false);
String Message=request.getParameter("Message");
HttpSession se=request.getSession(false);
String userType=(String)se.getAttribute("userType");
String name=(String)se.getAttribute("name");
log(name);
if(userType.equals("Doctor")){
	 otherName=(String)se.getAttribute("PName");
}else if(userType.equals("patient")){
	otherName=(String)se.getAttribute("DName");
}

String query="INSERT INTO chatinfo (`from_1`, `to_1`,  `message_1`,`Date_1`) VALUES ('"+name+"','"+otherName+"','"+Message+"',now());";
try {
	Class.forName("com.mysql.cj.jdbc.Driver");

	 conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "2004");
	 stmt=conn.createStatement();

	 
	stmt.executeUpdate(query);
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
