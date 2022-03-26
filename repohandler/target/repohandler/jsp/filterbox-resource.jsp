<%@page import="java.sql.*"%>
<%@ include file="connection.jsp"%>
<%
String topic=request.getParameter("count"); 
Integer rsid=0;
String str="";
 String buffer="<select name='resource' style='overflow:hidden'><option value='-1'>select</option>";  
 try{
 Statement stmt = con.createStatement();  
 ResultSet reslt = stmt.executeQuery("select resources.resources_id,resources_type_name from resources INNER JOIN resources_type ON resources.resources_type_id=resources_type.resources_type_id where resources.topic_id='"+ topic +"' ");

   while(reslt.next()){
	   rsid=reslt.getInt(1);
	   str=reslt.getString(2);
	   if(str.equals("Additional Resources")){
		   		rs=stat.executeQuery("select * from additional_material where resources_id="+ rsid +" and activity=1");
		   		if(rs.next()){
   					buffer=buffer+"<option value='"+reslt.getString(1)+"'>"+reslt.getString(2)+"</option>";  
		   		}
	   }
	   if(str.equals("Tutorial")){
	   		rs=stat.executeQuery("select * from tutorial where resources_id="+ rsid +" and activity=1");
	   		if(rs.next()){
					buffer=buffer+"<option value='"+reslt.getString(1)+"'>"+reslt.getString(2)+"</option>";  
	   		}
       }
	   if(str.equals("Phet")){
	   		rs=stat.executeQuery("select * from phet where resources_id="+ rsid +" and activity=1");
	   		if(rs.next()){
					buffer=buffer+"<option value='"+reslt.getString(1)+"'>"+reslt.getString(2)+"</option>";  
	   		}
       }
	   if(str.equals("Mindmap")){
	   		rs=stat.executeQuery("select * from mindmap where resources_id="+ rsid +" and activity=1");
	   		if(rs.next()){
					buffer=buffer+"<option value='"+reslt.getString(1)+"'>"+reslt.getString(2)+"</option>";  
	   		}
      }  	   
	   
   }
 buffer=buffer+"</select>";  
 response.getWriter().println(buffer); 
 }
 catch(Exception e){
     System.out.println(e);
 }

 %>

