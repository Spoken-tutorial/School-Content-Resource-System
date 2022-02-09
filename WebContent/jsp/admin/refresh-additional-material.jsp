<%@page import="java.sql.*"%>
<%@ include file="./../connection.jsp"%>
<%
Integer amt=0;
String samt=request.getParameter("opt");
if(samt!=null){
amt=Integer.parseInt(samt);
}
if(amt==-1){
//again refill the table with updated values.
rs=stat.executeQuery(" select additional_material_id,additional_material_description,additional_material_link,additional_material.userid,user.user_name,user.email from additional_material,user where activity=0 and additional_material.userid=user.userid");
}
else{
rs=stat.executeQuery(" select additional_material_id,additional_material_description,additional_material_link,additional_material.userid,user.user_name,user.email from additional_material,user where activity=0 and additional_material.userid=user.userid and user.userid="+ amt +"");
}


String buffer="<br><br><table border=1 style='border-collapse:collapse;width:80%'><tr style='background-color:#878383'><td>description</td><td>link</td><td>user-name</td><td>user-id</td><td>email</td><td>preview</td></tr>";
Integer i=0;

while(rs.next()){
if(i%2==0){

	buffer=buffer+" <tr><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(6)+"</td><td><button value="+rs.getString(1)+"+"+rs.getString(3)+" onclick='mdlbtn1(this.value)' class='btn btn-info btn-lg' data-toggle='modal' data-target='#myModal1'>Review</button></td></tr>";
 	
}
else{

	buffer=buffer+"<tr style='background-color:#59b300'><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(6)+"</td><td><button value="+rs.getString(1)+"+"+rs.getString(3)+" onclick='mdlbtn1(this.value)' class='btn btn-info btn-lg' data-toggle='modal' data-target='#myModal1'>Review</button></td></tr>";
	 		
}
i++;
}
buffer=buffer+"</table>"; 
response.getWriter().println(buffer);
%>
