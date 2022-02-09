<%@page import="java.sql.*"%>
<%@ include file="./../connection.jsp"%>
<%

String suid=request.getParameter("count");  
Integer uid=Integer.parseInt(suid);

//delete the entry from temporary table
String delqry="delete from contributor_request where userid="+ uid +" ";
stat.executeUpdate(delqry);

//again refill the table with updated values.
rs=stat.executeQuery(" select user.userid,user_name,email,phone from user,contributor_request where contributor_request.userid=user.userid;");


String buffer="<br><br><table border=1 style='border-collapse:collapse;width:80%'><tr style='background-color:#878383'><td>user-id</td><td>user-name</td><td>email</td><td>phone</td><td>accept</td><td>reject</td></tr>";
Integer i=0;

while(rs.next()){
if(i%2==0){

	buffer=buffer+" <tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td><button value='"+rs.getInt(1)+"' onclick='addit(this.value)'>accept</button></td><td><button value='"+rs.getInt(1)+"' onclick='rejectit(this.value)'>reject</button></td></tr>";
 	
}
else{

	buffer=buffer+"<tr style='background-color:#59b300'><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td><button value='"+rs.getInt(1)+"' onclick='addit(this.value)'>accept</button></td><td><button value='"+rs.getInt(1)+"' onclick='rejectit(this.value)'>reject</button></td></tr>";
	 		
}
i++;
}
buffer=buffer+"</table>"; 
response.getWriter().println(buffer);
%>
