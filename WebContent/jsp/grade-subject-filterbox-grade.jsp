<%@page import="java.sql.*"%>
<%@include file="connection.jsp" %>
<%
String subjectnm=request.getParameter("sub_name"); 
System.out.println(subjectnm);
String buffer=" <div class='navbar-form navbar-left'><select name='grade'  id='gval' style='width:200px;overflow:hidden'><option value='-1'>grade</option> ";  
try{
   rs=stat.executeQuery(" select subject.grade_id,grade.grade_name from grade,subject where grade.grade_id=subject.grade_id and subject.subject_name='" + subjectnm + "' ");
   System.out.println("KKKKKKKKK");
   while(rs.next()){
	   System.out.println(rs.getString(1));   
   buffer=buffer+"<option value='"+rs.getString(1)+"'>"+rs.getString(2)+"</option>";  
   }  
   buffer=buffer+"</select></div><div class='navbar-form navbar-left'><button onclick='validate()' style='height:30px'><span class='glyphicon glyphicon-search'></span></button></div>";  
   response.getWriter().println(buffer); 
 }
catch(Exception e){
     System.out.println(e);
 }
try {
	con.close();
} catch (SQLException e) {
	e.printStackTrace();
}
 %>
