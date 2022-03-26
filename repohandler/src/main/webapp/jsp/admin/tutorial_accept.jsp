<%@page import="java.sql.*"%>
<%@ include file="./../connection.jsp"%>
<%


String stid=request.getParameter("count");
Integer tid=0,t=0;
if(stid!=null){
tid=Integer.parseInt(stid);
}
String st=request.getParameter("opt");
if(st!=null){
t=Integer.parseInt(st);
}

String updtqry="update tutorial set activity=1 where tutorial_id="+ tid +"";
stat.executeUpdate(updtqry);


if(t==-1){
rs=stat.executeQuery(" select tutorial_id,tutorial_name,tutorial_link,tutorial_description,tutorial_additional_link,resources_id,tutorial.userid,user.user_name,user.email from tutorial,user where activity=0 and tutorial.userid=user.userid");
Integer i=0;

String buffer="<br><br><table border=1 style='border-collapse:collapse;width:80%'><tr style='background-color:#878383'><td>name</td><td>description</td><td>link</td><td>additional link</td><td>username</td><td>userid</td><td>email</td><td>review</td></tr>";

while(rs.next()){
if(i%2==0){

	buffer=buffer+" <tr><td>"+rs.getString(2)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(8)+"</td><td>"+rs.getString(7)+"</td><td>"+rs.getString(9)+"</td><td><button type=button value='"+rs.getString(1)+"+"+rs.getString(3)+"' onclick='mdlbtn2(this.value)' class='btn btn-info btn-lg' data-toggle='modal' data-target='#myModal2'>Review</button></td></tr>";
 	
}
else{

	buffer=buffer+"<tr style='background-color:#59b300'><td>"+rs.getString(2)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(8)+"</td><td>"+rs.getString(7)+"</td><td>"+rs.getString(9)+"</td><td><button type=button value='"+rs.getString(1)+"+"+rs.getString(3)+"' onclick='mdlbtn2(this.value)' class='btn btn-info btn-lg' data-toggle='modal' data-target='#myModal2'>Review</button></td></tr>";
	 		
}
i++;
}
buffer=buffer+"</table>"; 
response.getWriter().println(buffer);
}
%>


<%
if(t!=-1){
rs=stat.executeQuery(" select tutorial_id,tutorial_name,tutorial_link,tutorial_description,tutorial_additional_link,resources_id,tutorial.userid,user.user_name,user.email from tutorial,user where activity=0 and tutorial.userid=user.userid and user.userid="+ t +"");
Integer i=0;

String buffer="<br><br><table border=1 style='border-collapse:collapse;width:80%'><tr style='background-color:#878383'><td>name</td><td>description</td><td>link</td><td>additional link</td><td>username</td><td>userid</td><td>email</td><td>review</td></tr>";

while(rs.next()){
if(i%2==0){

	buffer=buffer+" <tr><td>"+rs.getString(2)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(8)+"</td><td>"+rs.getString(7)+"</td><td>"+rs.getString(9)+"</td><td><button type=button value='"+rs.getString(1)+"+"+rs.getString(3)+"' onclick='mdlbtn2(this.value)' class='btn btn-info btn-lg' data-toggle='modal' data-target='#myModal2'>Review</button></td></tr>";
 	
}
else{

	buffer=buffer+"<tr style='background-color:#59b300'><td>"+rs.getString(2)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(8)+"</td><td>"+rs.getString(7)+"</td><td>"+rs.getString(9)+"</td><td><button type=button value='"+rs.getString(1)+"+"+rs.getString(3)+"' onclick='mdlbtn2(this.value)' class='btn btn-info btn-lg' data-toggle='modal' data-target='#myModal2'>Review</button></td></tr>";
	 		
}
i++;
}
buffer=buffer+"</table>"; 
response.getWriter().println(buffer);
}
%>
