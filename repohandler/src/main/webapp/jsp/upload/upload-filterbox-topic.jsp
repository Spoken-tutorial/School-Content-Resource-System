<%@page import="java.sql.*"%>
<%@ include file="./../connection.jsp"%>
<%
String subject=request.getParameter("count");  
 
 try{
 Statement stmt = con.createStatement();  
 ResultSet reslt = stmt.executeQuery("Select topic_id,topic_name from topics where subject_id='"+subject+"' ");
 
 String buffer="<select name='topic'><option value='-1'>select</option>";  
 while(reslt.next()){
   buffer=buffer+"<option value='"+reslt.getString(1)+"'>"+reslt.getString(2)+"</option>";  
   }  
 buffer=buffer+"</select>";  
 response.getWriter().println(buffer); 
 }
 catch(Exception e){
     System.out.println(e);
 }

 %>
