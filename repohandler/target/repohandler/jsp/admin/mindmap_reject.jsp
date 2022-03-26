<%@page import="java.sql.*"%>
<%@ include file="./../connection.jsp"%>
<%@page import="java.io.File"%>

<%@page import="java.io.IOException"%>
<%@page import="java.nio.file.FileVisitResult"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.nio.file.Path"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.SimpleFileVisitor"%>
<%@page import="java.nio.file.attribute.BasicFileAttributes"%>
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

System.out.println("mid");
String str="";
String directory_name="";
Integer rsid4=0;
Integer flag=0;
Integer len=0;

rs=stat.executeQuery("select mindmapcontent,resources_id from mindmap where mindmap_id="+ mid +" ");
if(rs.next()){
	str=rs.getString("mindmapcontent");
	rsid4=rs.getInt(2);
	}

 	
    	try{
    		
        	len=str.indexOf(".zip");
        	directory_name=str.substring(0,len);
        	System.out.println(len);
//deleting zip file
    		File zipfile = new File("/home/dutta/workspace/spoken_school_resource_system/WebContent/static/resource/4/"+str);
       		if(zipfile.delete()){
    			System.out.println(zipfile.getName() + " is deleted!");
    		}else{
    			System.out.println("zip Delete operation is failed.");
    		}
    		
//deleting directory       	 	
       		System.out.println(directory_name);
    		
    		Path directory = Paths.get("/home/dutta/workspace/spoken_school_resource_system/WebContent/static/resource/4/"+directory_name);
    		Files.walkFileTree(directory, new SimpleFileVisitor<Path>() {
    		   @Override
    		   public FileVisitResult visitFile(Path file, BasicFileAttributes attributes) throws IOException {
    		       Files.delete(file); // this will work because it's always a File
    		       return FileVisitResult.CONTINUE;
    		   }

    		   @Override
    		   public FileVisitResult postVisitDirectory(Path dir, IOException exc) throws IOException {
    		       Files.delete(dir); //this will work because Files in the directory are already deleted
    		       return FileVisitResult.CONTINUE;
    		   }
    		});
    	   
    	}catch(Exception e){
    		
    		e.printStackTrace();
    		
    	}
    	
    


//delete the entry from temporary table
String delqry="delete from mindmap where mindmap_id="+ mid +" and activity=0 ";
stat.executeUpdate(delqry);



//delete from resource table.
rs=stat.executeQuery("select * from mindmap where resources_id="+ rsid4 +"");
if(!rs.next()){
flag=1;
}
if(flag==1){
	String rmv4 ="delete from resources where resources_id="+ rsid4 +" ";
	stat.executeUpdate(rmv4);
}


//again refill the table with updated values.

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
