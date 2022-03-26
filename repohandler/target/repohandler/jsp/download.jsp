<%@ include file="connection.jsp"  %>  
    <%    
      String filename = request.getParameter("flnm");
	  String str=filename.substring(filename.length()-3);
      String filepath = "/home/dutta/workspace/spoken_school_resource_system/WebContent/static/resource/1/";   
      if(str.equalsIgnoreCase("pdf")){
      	response.setContentType("APPLICATION/PDF");
      }
      if(str.equalsIgnoreCase("txt")){
      	response.setContentType("text/plain");
      }
          
      response.setHeader(" Content-Disposition "," attachment; filename='" + filename +  "' ");   
      
      java.io.FileInputStream fileInputStream=new java.io.FileInputStream(filepath + filename);  
                
      int i;   
      while ((i=fileInputStream.read()) != -1) {  
        out.write(i);   
      }   
      fileInputStream.close();   
    %>   