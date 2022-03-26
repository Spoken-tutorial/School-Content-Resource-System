<%@include file="./../connection.jsp" %>
<%@ page import="java.util.List" %>
   <%@ page import="java.util.Iterator" %>
   <%@ page import="java.io.File" %>
   <%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
   <%@ page import="org.apache.commons.fileupload.disk.*"%>
   <%@ page import="org.apache.commons.fileupload.*"%>
  <%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import = "javax.servlet.http.*" %>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "org.apache.commons.io.output.*" %>
<%@ page import="java.nio.file.Path"%>
<%@page import="java.nio.file.Paths"%>  
<%@page import="java.nio.file.Files"%>   
   <%@ page contentType="text/html;charset=UTF-8" language="java" %>

  
<%
Integer uid=0;
uid = (Integer) session.getAttribute("uid");
System.out.println(uid);
String dscp="";
String itemName="";
boolean isMultipart = ServletFileUpload.isMultipartContent(request);
     if (!isMultipart)
     {
     }
     else
     {
       FileItemFactory factory = new DiskFileItemFactory();
       ServletFileUpload upload = new ServletFileUpload(factory);
       List<FileItem> items = null;
       try
       {
               items = upload.parseRequest(request);
       }
       catch (FileUploadException e)
       {
               e.printStackTrace();
       }
       Iterator<FileItem> itr = items.iterator();     //this will create iterator object from list..used for traversing the data.
       
       while (itr.hasNext())
       {
           FileItem item = (FileItem) itr.next();
         
           if (item.isFormField())   //checking if its normal field then we read as normal. no need to store in disc
            {
                        String name = item.getFieldName();
                       String value = item.getString();
                                           
                       if(name.equals("mmdscp"))
                       {
                               dscp=value;
                              
                        }
                                                                   
                                
            }
            else                                      //this else part for process about PDF file
             {
                try
                {
       
                    itemName = item.getName();    //this will return the pdf file name
                    System.out.println(itemName);
                    Path path=Paths.get("/home/dutta/workspace/skool_resource_system/WebContent/static/resource/4/"+itemName);
                	if(!Files.exists(path)){
                	
                
                   //check whether it is .txt and .pdf or not.
                		Integer length=0;
						Integer startIndex=0;	   
						length=itemName.length();
						startIndex=length-4;
						String str=itemName.substring(startIndex);
						System.out.println(str);
						System.out.println(itemName);
						
						if(str.equalsIgnoreCase(".zip")){   
                		   
						       String srid=request.getParameter("rid");
						       Integer rid=Integer.parseInt(srid);
						       System.out.println(rid);
						       Integer actv=0;
						      %>
						      <%=rid %><br><%=dscp %><br><%=itemName %>
						      <%
						       String qry="insert into mindmap(mindmapcontent,description,resources_id,activity,userid) values ('"+ itemName +"','"+ dscp +"',"+ rid +","+ actv +","+ uid +")";
						       stat.executeUpdate(qry); 
						      
						       
						       
							
							
						ServletContext context = pageContext.getServletContext();
                  		String filename = context.getInitParameter("mindmap-upload");

                   		filename=filename+itemName;       //now concatenation the file name with upload  path.
                   		File savedFile=new File(filename);
                      
                       	item.write(savedFile);    //saving file into disc,item contain which you select the file.
                                                                //here item will copy into the savedFile and store into disk

                       	out.println("successfull");
                      		// response.sendRedirect("index.jsp");
                      		
                      		
                        %>
						<head>
						<meta http-equiv=refresh content="0;URL=./../../unzip?flnm=<%=itemName%>" />
						</head>
						<%
                		}
						else{
							%>
							<head>
							<meta http-equiv=refresh content="0;URL=./../user-home.jsp?abc=inv" />
							</head>
							<% 
						}
                	}
                	else{
                		out.println("<head><meta http-equiv=refresh content='0;URL=./../user-home.jsp?upload-status=fail' /></head>");
                		
                	}
                }			
                catch(Exception ste)
                {
                    out.println(ste);
                }
              }
          }
      

       }
%> 