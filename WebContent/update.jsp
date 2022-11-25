<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.cj.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/assignment";%>
<%!String user = "root";%>
<%!String psw = "root";%>
<%
String id = request.getParameter("id");
String name=request.getParameter("Name");
String email=request.getParameter("Email");
String address=request.getParameter("Address");
String phone=request.getParameter("Phone");
String city=request.getParameter("City");
String country=request.getParameter("Country");
String education=request.getParameter("Education");
if(id != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(id);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="UPDATE users SET id=?,name=?,email=?,address=?,phone=?,city=?,country=?,education=? where id="+id;
ps = con.prepareStatement(sql);
ps.setString(1, id);
ps.setString(2, name);
ps.setString(3, email);
ps.setString(4, address);
ps.setString(5, phone);
ps.setString(6, city);
ps.setString(7, country);
ps.setString(8, education);
int i = ps.executeUpdate();
if(i > 0)
{
out.print("Record Updated Successfully");
}
else
{
out.print("There is a problem in updating Record.");
} 
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>