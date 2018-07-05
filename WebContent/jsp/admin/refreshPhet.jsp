<%@page import="java.sql.*"%>
<%@ include file="./../connection.jsp"%>
<%

String spid=request.getParameter("count");
Integer pid=0,p=0;
if(spid!=null){
pid=Integer.parseInt(spid);
}
String sp=request.getParameter("opt");
if(sp!=null){
p=Integer.parseInt(sp);
}
if(p==-1){
rs=stat.executeQuery(" select phet_id,phet_name,phet_link,resources_id,user.user_name,phet.userid,user.email from phet,user where activity=0 and phet.userid=user.userid");
Integer k=0;

String buffer="<br><br><table border=1 style='border-collapse:collapse;width:80%'><tr style='background-color:#878383'><td>Name</td><td>link</td><td>user-name</td><td>user-id</td><td>email</td><td>review</td></tr>";

while(rs.next()){
if(k%2==0){

	buffer=buffer+" <tr><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(6)+"</td><td>"+rs.getString(7)+"</td><td><button type=button value='"+rs.getString(1)+"+"+rs.getString(3)+"' onclick='mdlbtn3(this.value)' class='btn btn-info btn-lg' data-toggle='modal' data-target='#myModal3'>Review</button></td></tr>";
 	
}
else{

	buffer=buffer+"<tr style='background-color:#59b300'><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(6)+"</td><td>"+rs.getString(7)+"</td><td><button type=button value='"+rs.getString(1)+"+"+rs.getString(3)+"' onclick='mdlbtn3(this.value)' class='btn btn-info btn-lg' data-toggle='modal' data-target='#myModal3'>Review</button></td></tr>";	 		
}
k++;
}
buffer=buffer+"</table>"; 
response.getWriter().println(buffer);
}
%>

<%
if(p!=-1){
rs=stat.executeQuery(" select phet_id,phet_name,phet_link,resources_id,user.user_name,phet.userid,user.email from phet,user where activity=0 and phet.userid=user.userid and user.userid="+ p +"");
Integer k=0;

String buffer="<br><br><table border=1 style='border-collapse:collapse;width:80%'><tr style='background-color:#878383'><td>Name</td><td>link</td><td>user-name</td><td>user-id</td><td>email</td><td>review</td></tr>";

while(rs.next()){
if(k%2==0){

	buffer=buffer+" <tr><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(6)+"</td><td>"+rs.getString(7)+"</td><td><button type=button value='"+rs.getString(1)+"+"+rs.getString(3)+"' onclick='mdlbtn3(this.value)' class='btn btn-info btn-lg' data-toggle='modal' data-target='#myModal3'>Review</button></td></tr>";
 	
}
else{

	buffer=buffer+"<tr style='background-color:#59b300'><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(6)+"</td><td>"+rs.getString(7)+"</td><td><button type=button value='"+rs.getString(1)+"+"+rs.getString(3)+"' onclick='mdlbtn3(this.value)' class='btn btn-info btn-lg' data-toggle='modal' data-target='#myModal3'>Review</button></td></tr>";	 		
}
k++;
}
buffer=buffer+"</table>"; 
response.getWriter().println(buffer);
}
%>
