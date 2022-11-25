<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("userid");
String driver = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "assignment";
String userid = "root";
String password = "root";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<br>
<center><h1>All Records</h1></center>
<br>
<table class="table table table-dark table-striped" align="center">
    <tr>
    <th scope="col">#</th>
      <th scope="col">Name</th>
      <th scope="col">Email</th>
      <th scope="col">Address</th>
      <th scope="col">Phone</th>
      <th scope="col">City</th>
      <th scope="col">Country</th>
      <th scope="col">Education</th>
      <th scope="col">Actions</th>
    </tr>
    	<%
		try{
		connection = DriverManager.getConnection(connectionUrl+database, userid, password);
		statement=connection.createStatement();
		String sql = "select * from users";
		resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
		%>
	  <tr>
	  <td class="col-xs-1"><%=resultSet.getString("ID") %></td>
      <td class="col-xs-1"><%=resultSet.getString("Name") %></td>
      <td class="col-xs-1"><%=resultSet.getString("Email") %></td>
	  <td class="col-xs-1"><%=resultSet.getString("Address") %></td>
	  <td class="col-xs-1"><%=resultSet.getString("Phone") %></td>
	  <td class="col-xs-1"><%=resultSet.getString("City") %></td>
	  <td class="col-xs-1"><%=resultSet.getString("Country") %></td>
	  <td class="col-xs-1"><%=resultSet.getString("Education") %></td>
	  <td><a href="edit.jsp?id=<%=resultSet.getString("id")%>">EDIT</a> <a href="delete.jsp?id=<%=resultSet.getString("id") %>">DELETE</a></td>
	  </tr>
      	<%
		}
		connection.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
</table>
</body>
</html>