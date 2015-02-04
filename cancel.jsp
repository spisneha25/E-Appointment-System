<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.lang.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-HEALTHCARE SYSTEM</title>
		<link rel="stylesheet" href="m1.css" />
    </head>
<body>
	<div id="MAIN">
		<h1>E-HEALTHCARE SYSTEM</h1>
		<<nav id="MENU">
				<ul>
					<li><a href="home.html">HOME</a></li>
					<li><a href="pat.html">PATIENT</a></li>
					<li><a href="own.jsp">SCHEDULE APPOINTMENT</a></li>
					<li><a href="cancel.jsp">CANCEL APPOINTMENT</a></li>
				</ul>
		</nav>
		
		<img src="d.jpg" id="LOGO" />
		<br/>
		<form name="patform" action="http://localhost:8080/examples/jsp/jsp2/mine/cancel.jsp" method="post">
			<p>Enter your e-mail id for confirmation:</p>
			<input name="pat" type="textbox" maxlength="30"></input>
			<br />
			<p>Please Enter the doctor's name whose appointment you wish to cancel:</p> 
			<input name="doc" type="textbox" maxlength="30"></input>
			<br />
			<p>Enter time:</p>
			<select  name="time">
				<option value="">PLEASE SELECT</option>
				<option value="1">10-11 AM</option>
				<option value="2">11-12 AM</option>
				<option value="3">12-1 PM</option>
				<option value="4">1-2 PM</option>
				<option value="5">5-6 PM</option>
				<option value="6">6-7 PM</option>
				<option value="7">7-8 PM</option>
				<option value="8">8-9 PM</option>
			</select>
			<input type="submit" value="CANCEL" />
		</form>
<%
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/patient","root","sneha2511"); 
PreparedStatement ps = null;
String t=request.getParameter("time");
String doc=request.getParameter("doc");
String pat=request.getParameter("pat");
int f=1;
Statement st= con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
ResultSet rsd=st.executeQuery("SELECT * FROM DOCTOR WHERE D_NAME= '" + doc + "'");
if(rsd.next())
{
	if(t.equals("1"))
	{
		if(rsd.getString(5).equals(pat))
		{
			ps = con.prepareStatement("update doctor set t10_11 = ? where D_name = ?");
			ps.setString(2, doc);
			ps.setString(1, "FREE");
			ps.executeUpdate();
			if(ps.executeUpdate()>=1)
			{
				Statement stmt=con.createStatement();
			}
		}
		else
			f=0;
	}
	if(t.equals("2"))
	{
		if(rsd.getString(6).equals(pat))
		{
			ps = con.prepareStatement("update doctor set t11_12 = ? where D_name = ?");
			ps.setString(2, doc);
			ps.setString(1, "FREE");
			ps.executeUpdate();
			if(ps.executeUpdate()>=1)
			{
				Statement stmt=con.createStatement();
			}
		}
		else
			f=0;
	}
	if(t.equals("3"))
	{
		if(rsd.getString(7).equals(pat))
		{
			ps = con.prepareStatement("update doctor set t12_13 = ? where D_name = ?");
			ps.setString(2, doc);
			ps.setString(1, "FREE");
			ps.executeUpdate();
			if(ps.executeUpdate()>=1)
			{
				Statement stmt=con.createStatement();
			}
		}
		else
			f=0;
		
	}
	if(t.equals("4"))
	{
		if(rsd.getString(8).equals(pat))
		{
			ps = con.prepareStatement("update doctor set t13_14 = ? where D_name = ?");
			ps.setString(2, doc);
			ps.setString(1, "FREE");
			ps.executeUpdate();
			if(ps.executeUpdate()>=1)
			{
				Statement stmt=con.createStatement();
			}
		}
		else
			f=0;
	}
	if(t.equals("5"))
	{
		if(rsd.getString(9).equals(pat))
		{
			ps = con.prepareStatement("update doctor set t17_18 = ? where D_name = ?");
			ps.setString(2, doc);
			ps.setString(1, "FREE");
			ps.executeUpdate();
			if(ps.executeUpdate()>=1)
			{
				Statement stmt=con.createStatement();
			}
		}
		else
			f=0;
	}
	if(t.equals("6"))
	{
		if(rsd.getString(10).equals(pat))
		{
			ps = con.prepareStatement("update doctor set t18_19 = ? where D_name = ?");
			ps.setString(2, doc);
			ps.setString(1, "FREE");
			ps.executeUpdate();
			if(ps.executeUpdate()>=1)
			{
				Statement stmt=con.createStatement();
			}
		}
		else
			f=0;
	}
	if(t.equals("7"))
	{
		if(rsd.getString(11).equals(pat))
		{
			ps = con.prepareStatement("update doctor set t19_20 = ? where D_name = ?");
			ps.setString(2, doc);
			ps.setString(1, "FREE");
			ps.executeUpdate();
			if(ps.executeUpdate()>=1)
			{
				Statement stmt=con.createStatement();
			}
		}
		else
			f=0;
	}
	if(t.equals("8"))
	{
		if(rsd.getString(12).equals(pat))
		{
			ps = con.prepareStatement("update doctor set t20_21 = ? where D_name = ?");
			ps.setString(2, doc);
			ps.setString(1, "FREE");
			ps.executeUpdate();
			if(ps.executeUpdate()>=1)
			{
				Statement stmt=con.createStatement();
			}
		}
		else
			f=0;
	}
}
Statement stm= con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
ResultSet rs=stm.executeQuery("SELECT * FROM DOCTOR WHERE D_NAME= '" + doc + "'");
if(f==1)
{
	while(rs.next())
	{
%>
	<TABLE align="center" border="2">
		<TR>
			<TH><p>DOCTOR'S NAME</p></TH>
			<TH><p>DOCTOR'S SPECIALITY</p></TH>
			<TH><p>DOCTOR'S CONTACT NO.</p></TH>
			<TH><p>DOCTOR'S EXPERIENCE</p></TH>
		</TR> 	
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
<p>You have successfully cancelled your appointment! Have a nice day !</p>
<%
	}
}
else
{
%>
<p>You are trying to cancel the wrong appointment. Please try again. <a href="cancel.jsp">Click here to try cancelling again</a></p>
<%
}
%>
</div>
</body>
 </html>