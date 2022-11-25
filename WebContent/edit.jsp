<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("id");
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
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from users where id="+id;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<!DOCTYPE html>
<html>
<body>
<h1>Update data from database in jsp</h1>
<form method="post" action="update.jsp">
<input type="hidden" name="id" value="<%=resultSet.getString("id") %>">
<br>
Name:<br>
<input type="text" name="name" value="<%=resultSet.getString("Name") %>">
<br>
Email:<br>
<input type="email" name="email" value="<%=resultSet.getString("Email") %>">
<br>
Address:<br>
<input type="text" name="address" value="<%=resultSet.getString("Address") %>">
<br>
Phone:<br>
<input type="number" name="phone" value="<%=resultSet.getString("Phone") %>">
<br><br>
City:<br>
<input type="text" name="city" value="<%=resultSet.getString("City") %>">
<br><br>
Country:<br>
<input type="text" name="country" value="<%=resultSet.getString("Country") %>">
<br><br>
Education:<br>
<input type="text" name="education" value="<%=resultSet.getString("Education") %>">
<br><br>
<input type="submit" value="submit">
</form>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>