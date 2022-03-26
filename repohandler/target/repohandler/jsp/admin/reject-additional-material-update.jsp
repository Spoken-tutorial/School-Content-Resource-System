<%@page import="java.sql.*"%>
<%@ include file="./../connection.jsp"%>
<%@page import="java.io.File"%>
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
String str="";
Integer rsid1=0;
Integer flag=0;
System.out.println(aid);
System.out.println(amt);
rs=stat.executeQuery("select additional_material_link,resources_id from additional_material where additional_material_id="+ aid +"");
if(rs.next()){
	str=rs.getString("additional_material_link");
	System.out.println(str);
	rsid1=rs.getInt(2);
	}

 	
    	try{
    		
    		File file = new File("/home/dutta/workspace/spoken_school_resource_system/WebContent/static/resource/1/"+str);
        	
    		if(file.delete()){
    			System.out.println(file.getName() + " is deleted!");
    		}else{
    			System.out.println("Delete operation is failed.");
    		}
    	   
    	}catch(Exception e){
    		
    		e.printStackTrace();
    		
    	}
    	
    


//delete the entry from temporary table
String delqry="delete from additional_material where additional_material_id="+ aid +" and activity=0 ";
stat.executeUpdate(delqry);
System.out.println("SUCCESS");

//delete from resource table.
rs=stat.executeQuery("select * from additional_material where resources_id="+ rsid1 +"");
if(!rs.next()){
flag=1;
}
if(flag==1){
	String rmv1 ="delete from resources where resources_id="+ rsid1 +" ";
	stat.executeUpdate(rmv1);
}
System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");

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
rs=stat.executeQuery("select additional_material_id,additional_material_description,additional_material_link,additional_material.userid,user.user_name,user.email from additional_material,user where activity=0 and additional_material.userid=user.userid and user.userid="+ amt +" ");
	

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
buffer=buffer+"</table>"; 
response.getWriter().println(buffer);
}
%>
	


