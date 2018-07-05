<%@page import="java.sql.*"%>
<%@ include file="./../connection.jsp"%>
<%

String amid=request.getParameter("count");
Integer aid=0,amt=0;
if(amid!=null){
aid=Integer.parseInt(amid);
}
String samt=request.getParameter("opt");
if(samt!=null){
amt=Integer.parseInt(samt);
}
String updtqry="update additional_material set activity=1 where additional_material_id="+ aid +"";
stat.executeUpdate(updtqry);

/*
//first insert values from temporary to permanent table.
String adqry="insert into additional_material (additional_material_description,additional_material_link,resources_id) select additional_material_description,additional_material_link,resources_id from temp_additional_material where temp_additional_material.additional_material_id="+ aid +"";
stat.executeUpdate(adqry);

//delete the entry from temporary table
String delqry="delete from temp_additional_material where additional_material_id="+ aid +" ";
stat.executeUpdate(delqry);
*/

//select all the elements
if(amt==-1){
	//again refill the table with updated values.
	rs=stat.executeQuery(" select additional_material_id,additional_material_description,additional_material_link,additional_material.userid,user.user_name,user.email from additional_material,user where activity=0 and additional_material.userid=user.userid");
	

String buffer="<br><br><table border=1 style='border-collapse:collapse;width:80%'><tr style='background-color:#878383'><td>description</td><td>link</td><td>user-name</td><td>user-id</td><td>email</td><td>Review</td></tr>";
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
stat.close();
rs.close();
buffer=buffer+"</table>"; 
response.getWriter().println(buffer);
%>

<%
}

//select elements specific to user
if(amt!=-1){
rs=stat.executeQuery(" select additional_material_id,additional_material_description,additional_material_link,additional_material.userid,user.user_name,user.email from additional_material,user where activity=0 and additional_material.userid=user.userid and user.userid="+ amt +" ");
	

String buffer="<br><br><table border=1 style='border-collapse:collapse;width:80%'><tr style='background-color:#878383'><td>description</td><td>link</td><td>user-name</td><td>user-id</td><td>email</td><td>accept</td><td>reject</td></tr>";
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
}
%>
	

