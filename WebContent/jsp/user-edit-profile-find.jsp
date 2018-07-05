<%@include file = "connection.jsp"%>
<%
Integer uid= (Integer) session.getAttribute("uid"); 
//Integer id=Integer.parseInt(uid);Not required......
rs=stat.executeQuery("Select * from user where userid = " + uid + " ");

if(rs.next())
{
	String s1=rs.getString("first_name");
	String s2=rs.getString("last_name");
	String s3=rs.getString("email");
	String s4=rs.getString("user_name");
	
	
	session.setAttribute("fnm", s1);
	session.setAttribute("lnm", s2);
	session.setAttribute("eml", s3);
	session.setAttribute("usr", s4);
	session.setAttribute("uid", uid);
	response.sendRedirect("user-edit-profile-form.jsp");
%>
<meta http-equiv=refresh content="4;URL=user-edit-profile-form.jsp" />

<!--  	
<meta http-equiv=refresh content="2;URL=user-edit-profile-form.jsp?fnm=<%=s1%>&lnm=<%=s2%>&eml=<%=s3%>&usr=<%=s4%>&uid=<%=uid%>" />
-->
<%
}
else{
	response.setHeader("Pragma","no-cache");
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Expires","0");
	response.setDateHeader("Expires",-1); 
	session.invalidate();
	out.println("<head><meta http-equiv=refresh content='0;URL=./../index.jsp'/><head/>");
}
%>

