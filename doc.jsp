<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-HEALTHCARE SYSTEM</title>
		<link rel="stylesheet" href="m1.css" />
		<script type="text/javascript">
			<!--
				function validate()
				{
					doc=document.getElementById("doc").value;
					if(doc=="")
					{
						alert("Doctor's name Must Be Entered");
					}
				}
			// -->
		</script>
    </head>
    <body>
	<div id="MAIN">
		<h1>E-HEALTHCARE SYSTEM</h1>
		<nav id="MENU">
				<ul>
					<li><a href="home.html">HOME</a></li>
					<li><a href="pat.html">PATIENT</a></li>
					<li><a href="own.jsp">SCHEDULE APPOINTMENT</a></li>
					<li><a href="cancel.jsp">CANCEL APPOINTMENT</a></li>
				</ul>
		</nav>
		
		<img src="d.jpg" id="LOGO" />
		<BR />
		<form name="docform" action="http://localhost:8080/examples/jsp/jsp2/mine/doc.jsp" onsubmit="validate()" method="post">
			<p>Please Enter the name of the doctor to:</p> 
			<input name="doc" id="doc" type="textbox" maxlength="30"></input>
			<input type="submit" value="Search"></input>
		</form>
		<br />
		<P>DATE : <%= new java.util.Date() %><P>
		<br />
		<TABLE align="center" border="2">
		<TR>
			<TH><p>DOCTOR'S NAME</p></TH>
			<TH><p>DOCTOR'S SPECIALITY</p></TH>
			<TH><p>DOCTOR'S CONTACT NO.</p></TH>
			<TH><p>DOCTOR'S EXPERIENCE</p></TH>
		</TR>
		<%
			Class.forName("com.mysql.jdbc.Driver"); 
			java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/patient","root","passwd"); 
			Statement st= con.createStatement(); 
			String doc=request.getParameter("doc");
			ResultSet rs=st.executeQuery("SELECT * FROM DOCTOR WHERE D_NAME= '" + doc + "'");
			while(rs.next())
			{
		%>
		<TR>
			<TD><p><%=rs.getString(1)%></p></TD>
			<TD><p><%=rs.getString(2)%></p></TD>
			<TD><p><%=rs.getString(3)%></p></TD>
			<TD><p><%=rs.getString(4)%></p></TD>
		</TR>
		<TABLE/>
		<BR />
		<p>SCHEDULE: </p>
		<TABLE align="center" border="2">
		<TR>
			<TH><p>10-11 AM</p></TH>
			<TH><p>11-12 AM</p></TH>
			<TH><p>12-1 PM</p></TH>
			<TH><p>1-2 PM</p></TH>
			<TH><p>5-6 PM</p></TH>
			<TH><p>6-7 PM</p></TH>
			<TH><p>7-8 PM</p></TH>
			<TH><p>8-9 PM</p></TH>
		</TR>
		
		<TR>
		<% 
		int i=5;
		while(i<13)
		{
			if(rs.getString(i).equals("FREE"))
			{
			%>
			<TD><p>FREE</p></TD>
			<%
			}
			else
			{
			%>
			<TD><p>BOOKED</p></TD>
			<%
			}
			i=i+1;
		}
		%>
		</TR>
	    </TABLE>
		<br />
		<p><a href="http://localhost:8080/examples/jsp/jsp2/mine/alter.jsp">Click here to book your appointment</a></p>
		<%
			}
		%>
</div>
</body>
</html>

