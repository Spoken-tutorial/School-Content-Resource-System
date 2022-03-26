<%@ include file="./../connection.jsp" %>
<%
String nm=request.getParameter("tutnm");
String lnk=request.getParameter("tutlnk");
String dscp=request.getParameter("tutdscp");
String srid=request.getParameter("rid");
Integer rid=Integer.parseInt(srid);
String adlnk=request.getParameter("adlnk");
Integer uid=(Integer) session.getAttribute("uid");
Integer actv=0;
String qry="insert into tutorial(tutorial_name,tutorial_link,tutorial_description,tutorial_additional_link,resources_id,activity,userid) values ('"+ nm +"','"+ lnk +"','"+ dscp +"','"+ adlnk +"','"+ rid +"',"+ actv +","+ uid +")";
stat.executeUpdate(qry);
%>
<br>
<b>Thank you!</b>
<meta http-equiv=refresh content="0;URL=./../user-home.jsp" />


