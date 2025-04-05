<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
    <%
    Connection conn = null;
    java.sql.Statement stmt = null;
    String query=null;
    %>
<html>
    <head> 
        <title>admin</title>
        <style>
        <%@include file="admincss.css" %>
        </style>
    </head>
    <body onload="myfunction1()">
        <div class="container">
            <div class="head-logo">
                <img src="https://bergen.edu/wp-content/uploads/Medical-Office-Assistant-header.jpg" alt="" style="height: 250px;width: 1535px;">
            </div>

            <div class="head-menu">
                <ul>
                    <li><a href="#" onclick="myfunction1()">Doctor List</a></li>
                    <li><a href="#" onclick="myfunction2()">Patient List</a></li>
                    <li><a href="#" onclick="myfunction3()">Add Doctor</a></li>
                    <li><a href="#" onclick="myfunction4()">Remove Doctor</a></li>
                    <button class="logoutbtn"><a href="LogOut">logout>></a></button>
                </ul>
            </div>

            <div class="content">
                <!--Doctor List section-->
                <section id="demo1">
                    <table id="table">
                        <tr>
                          <th>ID</th>
                          <th>Name</th>
                          <th>Email</th>
                          <th>Hospital Address</th>
                          <th>Speciality</th>
                        </tr>
<%

query = "select UserId,Name,EmailId,Address,Age,Speciality from hospital.userinfo where UserType='doctor';";
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "2004");
		stmt =  conn.createStatement();
		ResultSet rs = stmt.executeQuery(query);
		while(rs.next()){
			out.print("<tr>");
			out.print("<td>"+rs.getString("Name")+"</td>");
			out.print("<td>"+rs.getString("UserId")+"</td>");
			out.print("<td>"+rs.getString("EmailId")+"</td>");
			out.print("<td>"+rs.getString("Address")+"</td>");
			out.print("<td>"+rs.getString("Speciality")+"</td>");
			
			out.print("</tr>");
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

                <!--Patient List section-->
                <section id="demo2">
                    <table id="table">
                        <tr>
                          <th>UserID</th>
                          <th>Name</th>
                          <th>Address</th>
                          <th>Email</th>
                          <th>Age</th>
                          <th>Contact</th>
                        </tr>
<%

query = "select UserId,Name,EmailId,Address,Age,Phone_no from hospital.userinfo where UserType='patient';";
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "2004");
		stmt =  conn.createStatement();
		ResultSet rs = stmt.executeQuery(query);
		while(rs.next()){
			out.print("<tr>");
			out.print("<td>"+rs.getString("Name")+"</td>");
			out.print("<td>"+rs.getString("UserId")+"</td>");
			out.print("<td>"+rs.getString("EmailId")+"</td>");
			out.print("<td>"+rs.getString("Address")+"</td>");
			out.print("<td>"+rs.getString("Age")+"</td>");
			out.print("<td>"+rs.getString("Phone_no")+"</td>");
			out.print("</tr>");
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

                <!--Add doctor section-->
                <section id="demo3">
                    <div class="adddoctor">
                        <div class="title">Add Doctor</div>
                        <div class="contentadddoc">
                            <form action="AddDoctor" method="post">
                                <div class="user-details">
                                    <div class="input-box">
                                        <span class="details">Full Name<span class="required"> *</span></span>
                                        <input type="text" placeholder="Enter  name" name="name" required>
                                    </div>
                                    <div class="input-box">
                                        <span class="details">UserID<span class="required"> *</span></span>
                                        <input type="text" placeholder="Enter  username" name="userName" required>
                                    </div>
                                    <div class="input-box">
                                        <span class="details">E-mail<span class="required"> *</span></span>
                                        <input type="text" placeholder="Enter  email" name="email" required>
                                    </div>
                                    <div class="input-box">
                                        <span class="details">Phone Number<span class="required"> *</span></span>
                                        <input type="text" placeholder="Enter  number" name="phoneNumber" required>
                                    </div>
                                </div>
                                <div class="gender-details">
                                    <input type="radio" name="gender" id="dot-1" checked>
                                    <input type="radio" name="gender" id="dot-2">
                                    <input type="radio" name="gender" id="dot-3">
                                    <span class="gender-title">Gender<span class="required"> *</span></span>
                                    <div class="category">
                                        <label for="dot-1">
                                            <span class="dot one"></span>
                                            <span class="gender">Male</span>
                                        </label>
                                        <label for="dot-2">
                                            <span class="dot two"></span>
                                            <span class="gender">Female</span>
                                        </label>
                                        <label for="dot-3">
                                            <span class="dot three"></span>
                                            <span class="gender">Prefer not to say</span>
                                        </label>
                                    </div>
                                </div>
                                <div class="user-details">
                                <div class="input-box">
                                    <span class="details">Password<span class="required"> *</span></span>
                                    <input type="text" placeholder="Enter  Password" name="password" required>
                                </div>
                                <div class="input-box">
                                 <span class="details">Hospital Address<span class="required"> *</span></span>
                                    <input type="text" placeholder="Enter  Hospital Address" name="address" required>
                                </div>
                            </div>
                                <div class="user-details">
                                    <div class="input-box">
                                        <span class="details">Spaciality:</span>
                                                <select name="spaciality">
                                                    <option disabled="disabled" selected="selected">Choose option</option>
                                                    <option value="Orthopedics">Orthopedics</option>
                                                    <option value="Dermatology">Dermatology</option>
                                                    <option value="Radiology">Radiology</option>
                                                    <option value="Ophthalmology">Ophthalmology</option>
                                                    <option value="Chest MEdicine">Chest MEdicine</option>
                                                    <option value="Anesthesia">Anesthesia</option>
                                                    <option value="Pathology">Pathology</option>
                                                    <option value="Cardiologist">Cardiologist</option>
                                                    <option value="Endocrinologists">Endocrinologists</option>
                                                    <option value="Neurologist">Neurologist</option>
                                                    <option value="Family Medicine">Family Medicine</option>
                                                </select>
                                    </div>
                                </div>
                                <div class="button">
                                    <input type="submit" value="ADD">
                                </div>
                            </form>
                        </div>
                    </div>
                </section>

                <!--Remove doctor section-->
                <section id="demo4">
                    <div class="removedoctor">
                        <div class="title">Remove Doctor</div>
                        <br>
                        <div class="contentremovedoc">
                            <form action="Remove" method="post">
                                <center><strong><span class="details2">Doctor ID</span></strong></center>
                                <div class="user-details2">
                                    <div class="input-box2">
                                        <input style="width: 450px;" type="text" placeholder="Enter userID" name="userId">
                                    </div>
                                </div>

                              
                                <div class="button2">
                                    <input type="submit" value="Submit">
                                </div>
                            </form>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        <script>
            function myfunction1() {
                document.getElementById("demo1").style.display="inline";
                document.getElementById("demo2").style.display="none";
                document.getElementById("demo3").style.display="none";
                document.getElementById("demo4").style.display="none";
            }
            function myfunction2() {
                document.getElementById("demo1").style.display="none";
                document.getElementById("demo2").style.display="inline";
                document.getElementById("demo3").style.display="none";
                document.getElementById("demo4").style.display="none";
            }
            function myfunction3() {
                document.getElementById("demo1").style.display="none";
                document.getElementById("demo2").style.display="none";
                document.getElementById("demo3").style.display="inline";
                document.getElementById("demo4").style.display="none";
            }
            function myfunction4() {
                document.getElementById("demo1").style.display="none";
                document.getElementById("demo2").style.display="none";
                document.getElementById("demo3").style.display="none";
                document.getElementById("demo4").style.display="inline";
          }
        </script>
    </body>
</html>