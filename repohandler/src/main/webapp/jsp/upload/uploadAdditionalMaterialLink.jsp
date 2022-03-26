<%@ include file="./../connection.jsp" %>
<%
String lnk=request.getParameter("addmtlnk");
String dscp=request.getParameter("addmtdscp");
String srid=request.getParameter("rid");
Integer rid=Integer.parseInt(srid);
Integer uid=(Integer) session.getAttribute("uid");
Integer actv=0;
String qry="insert into additional_material(additional_material_description,additional_material_link,resources_id,activity,userid) values ('"+ dscp +"','"+ lnk +"',"+ rid +","+ actv +","+ uid +")";
stat.executeUpdate(qry);
%>
<br>
<b>Thank you!</b>
<meta http-equiv=refresh content="0;URL=./../user-home.jsp" />


