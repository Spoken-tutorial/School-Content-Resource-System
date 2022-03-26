<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<!-- if some error occur in the selection of filter box-->






<% 
String subnm=request.getParameter("subnm");
String gid=request.getParameter("gid");
%>


 
<head>
<title>Search Resource</title>  
      
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
      
     
<style>

select,option{
width:200px;
}


@media screen and (max-width:786px){
tr,td,select,option{
width:80px;
}
}

/* Start of button styling*/

.btn {
    background-color: DodgerBlue;
    border: none;
    color: white;
    padding: 12px 16px;
    font-size: 16px;
    cursor: pointer;
    float:right;
}

/* Darker background on mouse-over */
.btn:hover {
    background-color: RoyalBlue;
}

/* end of button styling */ 
 
 
 
/* HEADER*/
 
.header-text {
  background-color:#4CAF50;
  padding:20px;
  padding-top:6px;
  padding-bottom:6px;
  
  width:100%; /* The width is 20%, by default */
  color:#ffffff; 	
  text-shadow: 2px 2px 2px rgba(0,0,0,1.0);
  box-shadow: inset 0px -40px 60px 0px #145a32 ;
  border-bottom: solid 2px #145a32;
  box-sizing:border-box;
  text-align:center;
  font-family:courier;
}
/*end of header*/

</style>      
      
      
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
      <script>
      function validate(){
      var v1 =$('#gval').find('select[name="grade"]').val();
      var v2 =$('#subject').find('select[name="subject"]').val();
      var v3 =$('#topic').find('select[name="topic"]').val();
      var v4 =$('#resource').find('select[name="resource"]').val();
      if(v1=='-1' || v2=='-1' || v3=='-1' || v4=='-1'){
   	  alert("Please select all the fields");
      }
      else {
    	  window.location="filterbox_redirect_to_content.jsp?val="+ v4 +"";
      }	  
      
      
      }
      </script> 
      
      
 <script language="javascript" type="text/javascript">  
      var xmlHttp  
      var xmlHttp
      function showSubject(str){
      if (typeof XMLHttpRequest != "undefined"){
      xmlHttp= new XMLHttpRequest();
      }
      else if (window.ActiveXObject){
      xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
      }
      if (xmlHttp==null){
      alert("Browser does not support XMLHTTP Request")
      return;
      } 
      var url="filterbox-subject.jsp";
      url +="?count=" +str;
      xmlHttp.onreadystatechange = subjectChange;
      xmlHttp.open("GET", url, true);
      xmlHttp.send(null);
      }

      function subjectChange(){   
      if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
      document.getElementById('subject').innerHTML=xmlHttp.responseText   
      }   
      }

      function showTopic(str){
      if (typeof XMLHttpRequest != "undefined"){
        xmlHttp= new XMLHttpRequest();
        }
      else if (window.ActiveXObject){
        xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
        }
      if (xmlHttp==null){
      alert("Browser does not support XMLHTTP Request")
      return;
      } 
      var url="filterbox-topic.jsp";
      url +="?count=" +str;
      xmlHttp.onreadystatechange = topicChange;
      xmlHttp.open("GET", url, true);
      xmlHttp.send(null);
      }
      function topicChange(){   
      if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
      document.getElementById('topic').innerHTML=xmlHttp.responseText   
      }   
      }
      
      
      function showResource(str){
          if (typeof XMLHttpRequest != "undefined"){
            xmlHttp= new XMLHttpRequest();
            }
          else if (window.ActiveXObject){
            xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
            }
          if (xmlHttp==null){
          alert("Browser does not support XMLHTTP Request")
          return;
          } 
          var url="filterbox-resource.jsp";
          url +="?count=" +str;
          xmlHttp.onreadystatechange = resourceChange;
          xmlHttp.open("GET", url, true);
          xmlHttp.send(null);
          }
          function resourceChange(){   
          if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
          document.getElementById('resource').innerHTML=xmlHttp.responseText   
          }   
          }
          

      	
</script> 

 






<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<!-- MENU BAR -->
</head>
<body>



<!-- HEADER -->
		<div class="header-box" style="padding:0px">
			<div class="header-text" style="width:100%">
  				<h1 onclick='takeToUserHome()' style="font-size:5vw">School Resource System</h1>
  				<button class="btn" onclick="window.location.href='user-home.jsp'"><i class="fa fa-home"></i></button>
			</div>
		</div>
<!-- END OF HEADER -->
<div class="cntr1" style='width:100%;padding:20px 20px 20px 20px'>

<div class="row">
<!-- First column............................... -->				
				<div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
					<p>&nbsp;</p>
				</div>	
				
<!-- Second column -->				
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" style='border: 4px solid #6a91b7;border-radius:10px;background-color:#edeeef;top:40px;box-shadow: 0 8px 16px 0 rgba(0,0,0,1.5);'>
<table style='margin-left:auto;margin-right:auto'>
<tr>
<td>
<table>
<tr>
<td style='padding-top:10px;padding-left:10px'>  
<select name='grade' id="gval" style="overflow:hidden" onchange="showSubject(this.value);">  
<option value='-1'>select</option>  
    <%
 Class.forName("com.mysql.jdbc.Driver").newInstance();  
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/SCHOOL","root","mysql");  
 Statement stmt = con.createStatement();  
 ResultSet rs = stmt.executeQuery("Select * from grade");
 while(rs.next()){
	 if(gid.equals(rs.getString(1))){
		 %>
		 <option value="<%=rs.getString(1)%>" selected><%=rs.getString(2)%></option>
	      <%  
	 }
	 else{
     %>
      <option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>  
      <%
	 }
 }
     %>
      </select>
    </td>  
    <td style='padding-top:10px;padding-left:10px'>   
      <div id='subject'>  
      <select name='subject' id="sval" style="overflow:hidden" onchange="showTopic(this.value);">  
      <%
      rs = stmt.executeQuery("Select subject_id,subject_name from subject where subject.grade_id='"+ gid +"' ");
      while(rs.next()){
    		 if(subnm.equals(rs.getString(2))){
    			 String s=rs.getString(1);
    			 System.out.println(s);
    			 %>
    			
    			 <option value="<%=rs.getString(1)%>" selected><%=rs.getString(2)%></option>
    		      <%  
    		 }
    		 else{
    	     %>
    	      <option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>  
    	      <%
    		 }
    	 }
    %>
      </select>  
      </div>  
</td>
</tr>
<tr>
<td style='padding-top:10px;padding-left:10px'>
      <div id='topic'>
      <select name='topic' id="tval" style="overflow:hidden" onchange="showResource(this.value);">  
      <option value='-1'>select</option> 
    <%
      rs = stmt.executeQuery("Select topic_id,topic_name from topics,subject where topics.subject_id=subject.subject_id and subject.subject_name='"+ subnm +"' and subject.grade_id='"+ gid +"' ");
      while(rs.next()){
    	     %>
    	      <option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>  
    	      <%
    		 }
    %> 
      </select>  
      </div>
  </td>
  <td style='padding-top:10px;padding-left:10px'>    
      <div id='resource'>  
      <select name='resource' id="rval" style="overflow:hidden">  
      <option value='-1' >select</option>  
      </select>  
      </div>
    </td>
 </tr >
 </table> 
</td>
</tr>
<tr>
   <th style='margin-left:auto;margin-right:auto;padding-top:10px;padding-bottom:10px'>
<center> 
   		<button onclick='validate()'>submit</button>  
</center>   
   </th>
</tr>
</table>

</div>

<!-- third column......................................... -->
	<div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
		<p>&nbsp;</p>
	</div>
</div>	


<br><br><br>

<div class="row">	
	<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2">
	<p>&nbsp;</p>
	</div>
	
	<div class="col-xs-12 col-sm-12 col-md-8 col-lg-8" style='border: 4px solid #d65f4a;border-radius:10px;background-color:#edeeef;top:35px;box-shadow: 0 8px 16px 0 rgba(0,0,0,1.5);text-align:center'>
	<h4>Instructions</h4>
	<p style='font-family:courier;font-size:16px'>Please select all the four options to make a unique slection from the list of available choices. Once, you change your option the select box following next will automatically change. In this way you can easily determine your choice from the list available</p>
	</div>
	
	<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2">
	<p>&nbsp;</p>
	</div>
</div>		

</div>




<!--END OF MENU BAR-->


</body>