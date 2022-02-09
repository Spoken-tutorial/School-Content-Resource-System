<%@ include file="connection.jsp"%>

<%
String str=request.getParameter("str");

rs=stat.executeQuery("select resources.resources_id from topics,resources where topics.topic_name='"+ str +"' and resources.topic_id=topics.topic_id ");

if(rs.next()){
	Integer rid=rs.getInt(1);
%>
<head>
<meta http-equiv=refresh content="0;URL=filterbox_redirect_to_content.jsp?val=<%=rid%>" />
</head>
<%
}
else{
%>	
<p style='color:red'><b>Sorry ! No content!!!!</b></p>
<head>
<meta http-equiv=refresh content="3;URL=./../jsp/user-home.jsp" />
</head>	
<%
}
%>