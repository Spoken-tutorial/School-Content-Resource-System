<%@page import="java.sql.*"%>
<%@ include file="./../connection.jsp"%>
<%


String smid=request.getParameter("count");
Integer mid=0,m=0;
if(smid!=null){
mid=Integer.parseInt(smid);
}
String sm=request.getParameter("opt");
if(sm!=null){
m=Integer.parseInt(sm);
}




String updtqry="update mindmap set activity=1 where mindmap_id="+ mid +"";
stat.executeUpdate(updtqry);


if(m==-1){
rs=stat.executeQuery(" select mindmap_id,mindmapcontent,description,resources_id,user.user_name,mindmap.userid,user.email from mindmap,user where activity=0 and mindmap.userid=user.userid");
Integer l=0;

String buffer="<br><br><table border=1 style='border-collapse:collapse;width:80%'><tr style='background-color:#878383'><td>Description</td><td>link</td><td>user-name</td><td>user-id</td><td>email</td><td>review</td></tr>";

while(rs.next()){
if(l%2==0){

	buffer=buffer+" <tr><td>"+rs.getString(3)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(6)+"</td><td>"+rs.getString(7)+"</td><td><button value="+rs.getString(1)+"+"+rs.getString(2)+" onclick='mdlbtn4(this.value)' class='btn btn-info btn-lg' data-toggle='modal' data-target='#myModal4'>Review</button></td></tr>";
 	
}
else{

	buffer=buffer+"<tr style='background-color:#59b300'><td>"+rs.getString(3)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(6)+"</td><td>"+rs.getString(7)+"</td><td><button type=button value="+rs.getString(1)+"+"+rs.getString(2)+" onclick='mdlbtn4(this.value)' class='btn btn-info btn-lg' data-toggle='modal' data-target='#myModal4'>Review</button></td></tr>";
	 		
}
l++;
}
buffer=buffer+"</table>"; 
response.getWriter().println(buffer);
}
%>

<%
if(m!=-1){
rs=stat.executeQuery(" select mindmap_id,mindmapcontent,description,resources_id,user.user_name,mindmap.userid,user.email from mindmap,user where activity=0 and mindmap.userid=user.userid and user.userid="+ m +"");
Integer l=0;

String buffer="<br><br><table border=1 style='border-collapse:collapse;width:80%'><tr style='background-color:#878383'><td>Description</td><td>link</td><td>user-name</td><td>user-id</td><td>email</td><td>review</td></tr>";

while(rs.next()){
if(l%2==0){

	buffer=buffer+" <tr><td>"+rs.getString(3)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(6)+"</td><td>"+rs.getString(7)+"</td><td><button value="+rs.getString(1)+"+"+rs.getString(2)+" onclick='mdlbtn4(this.value)' class='btn btn-info btn-lg' data-toggle='modal' data-target='#myModal4'>Review</button></td></tr>";
 	
}
else{

	buffer=buffer+"<tr style='background-color:#59b300'><td>"+rs.getString(3)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(6)+"</td><td>"+rs.getString(7)+"</td><td><button type=button value="+rs.getString(1)+"+"+rs.getString(2)+" onclick='mdlbtn4(this.value)' class='btn btn-info btn-lg' data-toggle='modal' data-target='#myModal4'>Review</button></td></tr>";
	 		
}
l++;
}
buffer=buffer+"</table>"; 
response.getWriter().println(buffer);
}
%>
