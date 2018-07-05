<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
 
  <head>
  
  
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">



<script>
function takeToUserHome(){
	window.location="./../user-home.jsp";
}
</script>     


<style>
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
select{
width:200px;
}

@media screen and (max-width:786px){
tr,td,select,option{
width:80px;
}
}

</style>       
  
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
      <script>
      function validate(){
      var v1 =$('#gval').find('select[name="grade"]').val();
      var v2 =$('#subject').find('select[name="subject"]').val();
      var v3 =$('#topic').find('select[name="topic"]').val();
      var v4 =$('#resource').find('select[name="resource"]').val();
      if(v1=='-1' || v2=='-1' || v3=='-1' || v4=='-1'){
   	  alert("Watch out");
      }
      else {
    	  window.location="uploadResource-form.jsp?val="+ v3 +"&res="+ v4 +"";
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
      var url="upload-filterbox-subject.jsp";
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
      var url="upload-filterbox-topic.jsp";
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
  				<button class="btn" onclick="window.location.href='./../user-home.jsp'"><i class="fa fa-home"></i></button>
			</div>
		</div>
<!-- END OF HEADER -->
<div class="cntr1" style='width:100%;padding:20px 20px 20px 20px'>

<!-- first row -->
<div class="row">

<!-- first column -->
<div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
<p>&nbsp;</p>
</div>

<!-- second column -->
<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" style='border: 4px solid #6a91b7;border-radius:10px;background-color:#edeeef;top:40px;box-shadow: 0 8px 16px 0 rgba(0,0,0,1.5);text-align:center'>

<br>
<table style="padding: 14px 16px;margin-left:auto;margin-right:auto">
	<tr>
 		<td>  
 		  <table><tr><td>
			<select name='grade' id="gval" style="overflow:hidden" onchange="showSubject(this.value);">  
				<option value='-1'>select</option>  
<%
 Class.forName("com.mysql.jdbc.Driver").newInstance();  
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/school_resource_system","root","1234");  
 Statement stmt = con.createStatement();  
 ResultSet rs = stmt.executeQuery("Select * from grade");
 while(rs.next()){
%>
      			<option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>  
<%
}
%>
      		</select>
    	</td>  
    
    	
    	<td>   
      		<div id='subject'>  
      			<select name='subject' id="sval" style="overflow:hidden" onchange="showTopic(this.value);">  
					<option value='-1'>select</option>      	
     	    	</select>  
      		</div>  
		</td>
	
		</tr>
		<tr>
		<td>
    		<div id='topic'>
     		 	<select name='topic' id="tval" style="overflow:hidden" onchange="showResource(this.value);">  
      				<option value='-1'>select</option>
				</select>  
      		</div>
		</td>

		
		<td>    
      		<div id='resource'>  
      			<select name='resource' id="rval" style=" overflow:hidden">  
      				<option value='-1' >select</option> 
      				<option value='additionalmaterial'>Additional resources</option>
      				<option value='tutorial'>Tutorial</option>
      				<option value='phet'>PhET</option> 
      				<option value='mindmap'>Mind map</option> 
      			</select>  
      		</div>
    	</td>
 	</tr>
</table> 	
 	
<tr>   
    <th> 
      	<center><button onclick="validate()">submit</button></center>  
  	</th>
  		
</tr>
</table>
<br>
</div>

<!-- third column -->
<div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
<p>&nbsp;</p>
</div>

</div>
<br><br><br><br>

<!-- second row -->
<div class="row">
	
<!-- first column -->	
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


<!--END OF filter box-->


</body>