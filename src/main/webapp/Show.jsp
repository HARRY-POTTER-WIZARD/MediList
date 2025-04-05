<%@page import="java.sql.*" %>
<%@page import="org.json.simple.*"  %>
<%@page import="org.json.simple.parser.*"%>
<%
JSONArray list=new JSONArray();
Connection conn = null;
java.sql.Statement stmt = null;
String query=null;
String Name=request.getParameter("Name");
query = "select Speciality from hospital.userinfo where Name='"+Name+"';";

	Class.forName("com.mysql.cj.jdbc.Driver");
	
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "2004");
		stmt =  conn.createStatement();
		ResultSet rs = stmt.executeQuery(query);
		
		if(rs.next()){
			String Speciality=rs.getString("Speciality");
			JSONObject obj= new JSONObject();
			obj.put("Speciality", Speciality); 
			list.add(obj);
			
		}
		out.print(list.toJSONString());
		out.flush();
		
%>