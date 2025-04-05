package com.cpe;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.model.AjaxResponse;
import com.model.ChartIfroDto;

@SuppressWarnings("serial")
public class GetChart extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String OName=request.getParameter("OName");
		String name=request.getParameter("name");
		PrintWriter out = response.getWriter();
		ArrayList<String> l=new ArrayList<String>();
		ObjectMapper obj=new ObjectMapper();

		 Connection conn = null;
		 
		 Statement stmt = null;
		  String query="select * from chatinfo where from_1='"+name+"' OR from_1='"+OName+"'  ORDER BY Date_1 desc limit 5;";
		  
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "2004");
			
		
  		stmt =  conn.createStatement();
  		ResultSet rs = stmt.executeQuery(query);
  		
  	
  		while (rs.next()) {
  			ChartIfroDto c=new ChartIfroDto(rs.getString("from_1"),rs.getString("to_1"),rs.getString("message_1"),rs.getString("Date_1"));
  			String str=obj.writeValueAsString(c);
  			l.add(str);
	
		}} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			String str=obj.writeValueAsString(l);
			Collections.reverse(l);
			AjaxResponse aj=new AjaxResponse("listKey", l);
			String finalOutput=obj.writeValueAsString(aj);
			log(finalOutput);
			out.print(finalOutput);
			

			
		  }
		
	}


