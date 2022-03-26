<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="contributor_form_update.jsp" method="post">
<%
Integer uid= (Integer) session.getAttribute("uid");
%> 
<input type="text" name=phnm>
<input type=submit>
</form>
</body>
</html>