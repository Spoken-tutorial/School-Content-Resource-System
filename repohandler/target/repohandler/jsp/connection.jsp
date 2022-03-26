<%@ page import="java.sql.*" %>
<%
Connection con;
Statement stat;
ResultSet rs;
ResultSetMetaData md;
%>
<%
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/school", "root", "mysql");
stat=con.createStatement();
%>
