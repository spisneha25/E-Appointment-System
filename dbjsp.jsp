<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
		<link rel="stylesheet" href="m1.css" />
    </head>
    <body>
	<div id="MAIN">
		<h1>E-HEALTHCARE SYSTEM</h1>
		<nav id="MENU">
				<ul>
					<li><a href="home.html">HOME</a></li>
					<li><a href="pat.html">PATIENT</a></li>
					<li><a href="doc.html">DOCTOR</a></li>
					<li><a href="pha.html">PHARMACIST</a></li>
					<li><a href="lab.html">LABORATORY TECHNICIAN</a></li>
				</ul>
		</nav>
		
		<img src="d.jpg" id="LOGO" />
		<BR />
<%
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/patient","root","passwd"); 
Statement st= con.createStatement(); 
String id=request.getParameter("uid");
String pwd=request.getParameter("pwd");
ResultSet rs=st.executeQuery("SELECT AES_DECRYPT(P_PASSWORD,'mysalt') FROM patient WHERE P_UID= '" + id + "'");
if(rs.next())
{
	if(rs.getString(1).equals(pwd))
	{
%>
	<p>Successfully Logged in, <a href="own.jsp">Click here to enter in to your account</a></p>
<%
	}
	else
	{
%>
	<p style="position:relative left:400px top:400px">Sorry not successful! To re-enter <a href="pat.html">Click here</a> </p>
<%
	}
}
else 
{
%>
<p style="position:relative left:400px top:400px">Sorry not successful! To re-enter <a href="pat.html">Click here</a> </p>
<%
}
%>
</div>
</body>
</html>

