<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@page import="org.json.simple.parser.*"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="Chart.css">
</head>
<body>

<h2>Chat Messages</h2>
 <%
 HttpSession se=request.getSession(false);
 String otherName=null;
String userType=(String)se.getAttribute("userType");
String name=(String)se.getAttribute("name");   
if(userType.equals("Doctor")){
	 otherName=(String)se.getAttribute("PName");
}else if(userType.equals("patient")){
	otherName=(String)se.getAttribute("DName");
}
 %> 
 <div id="container">
 <div id="MessageBody"></div>
	<footer>
		<textarea id="Message" placeholder="Message"></textarea>
			<button onclick="ABC()">send</button> 
	
			
			<form action="EndSession" method="post"><input id="sessionend" type="submit" value="End Session"></form>
	</footer>

</div>
<script src="jquery\dist\jquery.min.js"></script>
<script type="text/javascript">
function abc(){
	while (MessageBody.hasChildNodes()){
		MessageBody.removeChild(MessageBody.firstChild);
        }
	    XYZ();
}
function ABC(){
	
	$.ajax({
		type:"post",
		url:"Chart",
		data:{"Message":$("#Message").val()},
		 
		success:function(){
			
			cls();
			console.log($("#Message").val());
		},
		error:function(xhr){
			alert("error");
			console.log($("#Message").val());
		}
			
		
	});
}
function Abc(){
	
	var fd = new FormData();
	fd.append( "File", $("#Report")[0].files[0]);
	
	
	$.ajax({
		
		 method: 'POST',
		url:"ChartFile",
	        cache: false,
	        processData: false,
	        contentType: false,
	       
	        data: fd,
	        dataType: 'json',

		success:function(){
			alert("File Send");
		},
		error:function(xhr){
			alert("error");
			
		}
			
		
	});
}
function cls(){
	document.getElementById("Message").value="";
	abc();
}
function XYZ(){
	
	$.ajax({
		type:"post",
		url:"GetChart",
		data:{"name":'<%=name%>',"OName":'<%= otherName%>'},
		 
		success:function(msg){
			console.log(msg);
			console.log(msg.list);
			
			var obj=msg.list;
			
			for (var i=0;i<obj.length;i++) {
				var result=JSON.parse(obj[i]);
				console.log('parse element',result);
				var from=result.from;
				console.log('<%=name%>');
				if(from.localeCompare('<%=name%>')==0){
					console.log(result.message);
					const para = document.createElement("div");
					
					para.innerText = result.message;
					para.className="container ";
					para.id="message";
					document.getElementById("MessageBody").appendChild(para);
				}else{
					console.log(result.message);
					const para = document.createElement("div");
					para.innerText = result.message;
					para.className="container darker";
					para.id="message";
					document.getElementById("MessageBody").appendChild(para);
				}
				}
			}
    		
			
		});
			
}

setInterval(abc, 2000);
</script>
<script src="jquery\dist\jquery.js"></script>
</body>
</html>
