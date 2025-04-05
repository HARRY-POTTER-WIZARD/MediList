
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.json.simple.parser.*"%>
    <%	
    Connection conn = null;
    java.sql.Statement stmt = null;
    String query=null;
    HttpSession se=request.getSession(false);  
	  String name=(String)se.getAttribute("name");  
	  String EmailId=null;
		String Addresss=null;
		String Speciality=null;
		String Phone_no=null;
    %> 
<html>
    <head>
        <title>patient</title>
        <style ><%@include file="patientcss.css" %></style>
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
       
       </head>
    <body onload="myfunction2()">
        <div class="container">
            <div class="head-logo"><!--logo-->
                <img src="https://bergen.edu/wp-content/uploads/Medical-Office-Assistant-header.jpg" alt="" style="height: 250px;width: 1535px;">
            </div><!--logo End-->

            <div class="head-menu"><!--head-menubar-->
                <ul>
                    <li><a href="#" onclick="myfunction1()">Profile</a></li>
                    <li><a href="#" onclick="myfunction2()">Appointment</a></li>
                    <li><a href="#" onclick="myfunction3()">Inbox</a></li>
                    <button class="logoutbtn"><a href="LogOut">logout>></a></button>
                </ul>
            </div><!--head-menu End-->
            <div class="content">
                <section id="demo1">
                 <%
     String UserId=(String) se.getAttribute("name") ;
query = "select * from hospital.userinfo where UserId='"+UserId+"';";
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "2004");
		stmt =  conn.createStatement();
		ResultSet rs = stmt.executeQuery(query);
		while(rs.next()){
			se.removeAttribute("name");
			
		 name=rs.getString("Name");
		se.setAttribute("name", name);
		 EmailId=rs.getString("EmailId");
		 Addresss=rs.getString("Address");
		 Phone_no=rs.getString("Phone_no");
		 
		 Speciality=rs.getString("MedicalHistory");
			
			
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
			<h1><%=UserId %></h1>
			<p><%=name %></p>
			<hr>
			<p><%=EmailId %></p>
			<p><%=Speciality %></p>
			<p><%=Phone_no %></p>
			
		</div>
	</div>
                </section>

                <section id="demo2">
                    <div class="wrapper">
                        <div class="inner">
                            <div class="image-holder">
                                <img src="https://img.freepik.com/free-photo/beautiful-young-female-doctor-looking-camera-office_1301-7807.jpg?w=2000" alt="" style="height: 400px;width: 300px;">
                            </div>
                            <form action="Appointment" method="post">
                                <h3>Make An Appointment</h3>
                              
                                <div class="form-row">
                                    
                                    <div class="form-holder">
                                        <select name="Name" id="Name" class="form-control" onchange="show()" required>
                                            <option value="">Choose Your Doctor</option>
                                            <%
                                            query = "select Name from hospital.userinfo where UserType='doctor';";
                                            try {
                                            	Class.forName("com.mysql.cj.jdbc.Driver");
                                            	
                                            		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "2004");
                                            		stmt =  conn.createStatement();
                                            		ResultSet rs = stmt.executeQuery(query);
                                            		while(rs.next()){
                                            			out.print("<option value='"+rs.getString("Name")+"'>"+rs.getString("Name")+"</option>");
                                            			
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
                                            
                                        </select>
                                        <i class="zmdi zmdi-chevron-down"></i>
                                    </div>
                                </div>
                                <div class="form-row">
                         		
                                    <input type='text' class='form-control' id="Speciality" name="Speciality" required="required" disabled>
                                    
                                </div>
                                
                                <button class="book" onclick="submit()">Book Now
                                    <i class="zmdi zmdi-long-arrow-right"></i>
                                </button>
                            </form>
                        </div>
                    </div>
                </section>

                <section id="demo3">
                 <table id=table>
                        <tr>
                            <th>Sr. No</th>
                            <th>Doctor Name</th>
                            <th>Appointment Status</th>
                        </tr>
                        <%
                        query = "select requeStatus,DoctorName from sectioncreation where PatientName='"+name+"';";
                        try {
                        	Class.forName("com.mysql.cj.jdbc.Driver");
                        	
                        		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "2004");
                        		stmt =  conn.createStatement();
                        		ResultSet rs = stmt.executeQuery(query);
                        		int SrNo=1;
                        		while(rs.next()){
                        			out.print("<tr>");
                        			out.print("<td>"+SrNo+"</td>");
                        			out.print("<td>"+rs.getString("DoctorName")+"</td>");
                        			if(rs.getString("requeStatus").equals("Pending")){
                        				out.print("<td>"+rs.getString("requeStatus")+"</td>");
                        			}else{
                        				se.setAttribute("DName", rs.getString("DoctorName"));
                        				out.print("<td><a href='Chart.jsp' style='text-decoration: none;'>Join in</a></td>");
                        			}
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

        </div>
        <script>
            function myfunction1() {
                document.getElementById("demo1").style.display="inline";
                document.getElementById("demo2").style.display="none";
                document.getElementById("demo3").style.display="none";
            }
            function myfunction2() {
                document.getElementById("demo1").style.display="none";
                document.getElementById("demo2").style.display="inline";
                document.getElementById("demo3").style.display="none";
            }
            function myfunction3() {
                document.getElementById("demo1").style.display="none";
                document.getElementById("demo2").style.display="none";
                document.getElementById("demo3").style.display="inline";
            }
          </script>
           <script src="jquery\dist\jquery.min.js"></script>
           <script>
        function show(){
        	
        	$.ajax({
        		type:"post",
        		url:"Show.jsp",
        		data:{"Name":$("#Name").val()},
        		 
        		success:function(msg){
        			var obj=JSON.parse(msg);
        			$("#Speciality").val(obj[0].Speciality);
        			
        		},
        		error:function(xhr){
        			alert("error");
        		}
        			
        		
        	});
        }
        </script>
        <script src="jquery\dist\jquery.min.js"></script>
    </body>
</html>