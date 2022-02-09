<%@ include file="connection.jsp"%>

<%

String fnm=request.getParameter("fnm");
String lnm=request.getParameter("lnm");
String eml=request.getParameter("email");
String unm=request.getParameter("unm");
Integer uid=(Integer)session.getAttribute("uid");
Integer flag=0;

System.out.println("--------------------------");
System.out.println(fnm);
System.out.println(lnm);
System.out.println(eml);
System.out.println(unm);
System.out.println(uid);

rs=stat.executeQuery("select user_name from user where user_name='"+ unm +"' and userid != "+ uid +" ");
if(rs.next()){
	flag=1;
}
rs=stat.executeQuery("select email from user where email='"+ eml +"' and userid != "+ uid +" ");
if(rs.next()){
	flag=1;
}
if(flag==1){
out.println("username or email already taken...");
%>
<meta http-equiv=refresh content="2;URL=user-edit-profile-form.jsp " />	
<%
}
else{


String qry="UPDATE user set first_name='" + fnm + "' , last_name='" + lnm + "' , email= '"+ eml +"', user_name='"+ unm +"' where userid='"+ uid +"' ";

stat.executeUpdate(qry);
out.println("Updated successfully...");
//session.invalidate();

try {
	con.close();
} catch (SQLException e) {
	e.printStackTrace();
}
%>
<head><meta http-equiv=refresh content="2;URL=user-home.jsp " /></head>
<% 
}
%>


