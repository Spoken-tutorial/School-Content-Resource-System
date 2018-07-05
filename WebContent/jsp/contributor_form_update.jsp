<%@ include file="connection.jsp"%>
<%
Integer uid= (Integer) session.getAttribute("uid");
String str=request.getParameter("phnm");
String qry="insert into contributor_request (userid,phone) values ("+ uid +",'" + str + "')";
stat.executeUpdate(qry);
%>
<head>
<meta http-equiv=refresh content="0;URL=user-home.jsp" />
</head>
