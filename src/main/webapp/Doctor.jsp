

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<%@page import="java.sql.*"%>


    <%
    Connection conn = null;
	  Statement stmt = null;
	  String query;
	  HttpSession se=request.getSession(false);  
	  String name=(String)se.getAttribute("name");  
	  String emailId=null;
		String addresss=null;
		String speciality=null; 
    %>
<html>
    <head>
        <title>doctor</title>
        <link rel="stylesheet" href="doctorcss.css">
        <style >
           .containerPro {
	max-width: 800px;
	margin: 0 auto;
	padding: 20px;
}

.containerPro .profile {
	text-align: center;
    background-color: rgb(153, 153, 238);
    padding: 200px;
}
.containerPro h1 {
	margin: 0;
}

.containerPro p {
	margin: 10px 0;
}

.containerPro hr {
	border: none;
	border-top: 1px solid #ccc;
	margin: 20px 0;
}

        
        </style>
    </head>
    <body onload="myfunction1()">
        <div class="container">
            <div class="head-logo"><!--logo-->
                <img src="https://bergen.edu/wp-content/uploads/Medical-Office-Assistant-header.jpg" style="height: 250px;width: 1535px;">
            </div><!--logo End-->

            <div class="head-menu"><!--head-menubar-->
                <ul>
                    <li><a href="#" onclick="myfunction1()">Profile</a></li>
                    <li><a href="#" onclick="myfunction2()">Inbox</a></li>
                    
                    <button class="logoutbtn"><a href="LogOut">logout>></a></button>
                </ul>
            </div><!--head-menu End-->

            <div class="content">
                <section id="demo1"> 
                 <style>
   
      .tablepro{
        background-color: rgba(255, 255, 255, 0.475);
        border-radius: 24px;
        width:98%;
        height: auto;
        padding: 50px;
        margin: 50px 20px;
      }
    .tablepro td{
        padding: 20px;
        font-size: 40px;
        background-color:Gray;
      }
    </style>
                <head class="card">
      
      <%
     String UserId=(String) se.getAttribute("name") ;
query = "select Name,EmailId,Address,Speciality from hospital.userinfo where UserId='"+UserId+"';";
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "2004");
		stmt =  conn.createStatement();
		ResultSet rs = stmt.executeQuery(query);
		while(rs.next()){
			se.removeAttribute("name");
			
		 name=rs.getString("Name");
		se.setAttribute("name", name);
		 emailId=	rs.getString("EmailId");
		 se.setAttribute("EmailId", emailId);
		 addresss=	rs.getString("Address");
		 se.setAttribute("Addresss", addresss);
		 speciality=	rs.getString("Speciality");
		 se.setAttribute("Speciality", speciality);
			
			
		}
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
%>
 
     <div class="containerpro">
		<div class="profile">
		<%
		 String Name=(String) se.getAttribute("name") ;
		 String Speciality=(String) se.getAttribute("Speciality") ;
		 String Addresss=(String) se.getAttribute("Addresss") ;
		 String EmailId=(String) se.getAttribute("EmailId") ;
		 
		%>
			<h1><%=UserId %></h1>
			<p><%=Name %></p>
			<hr>
			<p><%=EmailId %></p>
			<p><%=Speciality %></p>
			
		</div>
	</div>

    </head>
  </section>
                <section id="demo2">
                    <table id="table">
                        <tr>
                        <th>Sr.No</th>
                          <th>Patient Name</th>
                          <th>Accept</th>
                        </tr>
                        <%
                        query = "select PatientName from sectioncreation where DoctorName='"+name+"';";
                        try {
                        	Class.forName("com.mysql.cj.jdbc.Driver");
                        	
                        		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "2004");
                        		stmt =  conn.createStatement();
                        		ResultSet rs = stmt.executeQuery(query);
                        		int SrNo=1;
                        		while(rs.next()){
                        			out.print("<tr>");
                        			out.print("<form method='post' action='AcceptAppointment'>");
                        			out.print("<td>"+SrNo+"</td>");
                        		
                        			out.print(" <td><input name='PName' value='"+rs.getString("PatientName")+"'Style='display:none'>"+rs.getString("PatientName")+"</td>");
                        			out.print("<td><button onclick='submit()'id='yesbtn'>yes</button></td>");
                        			out.print("<form>");
                        			out.print("</tr>");
                        			SrNo++;
                        		}
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
                        %>
                    </table>
                </section>
              
            </div>

        </div><!--Main-container End-->
        <script>
          function myfunction1() {
              document.getElementById("demo1").style.display="inline";
              document.getElementById("demo2").style.display="none";
          }
          function myfunction2() {
              document.getElementById("demo1").style.display="none";
              document.getElementById("demo2").style.display="inline";
          }
         
        	  <%
        	
        	  %>
        	  
        </script>
    </body>
</html>