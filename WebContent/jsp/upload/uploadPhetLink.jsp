<%@ include file="./../connection.jsp" %>
<%
String nm=request.getParameter("phtnm");
String lnk=request.getParameter("phtlnk");
String srid=request.getParameter("rid");
Integer rid=Integer.parseInt(srid);
Integer uid=(Integer) session.getAttribute("uid");
Integer actv=0;
String qry="insert into phet(phet_name,phet_link,resources_id,activity,userid) values ('"+ nm +"','"+ lnk +"',"+ rid +","+ actv +","+ uid +")";
stat.executeUpdate(qry);
%>
<br>
<b>Thank you!</b>
<meta http-equiv=refresh content="0;URL=./../user-home.jsp" />


