<%@include file="./../connection.jsp"%>
<%@page import="java.time.LocalDateTime" %>
<% 
String val=request.getParameter("val");
Integer tid=Integer.parseInt(val);
String resType=request.getParameter("res");
Integer uid=0;
uid = (Integer) session.getAttribute("uid");
System.out.println(uid);
Integer rid=0;

/*
Integer rid=Integer.parseInt(val);
rs=stat.executeQuery("select resources_type_id from resources where resources_id="+ rid +" ");
Integer resType=0;
if(rs.next()){
resType=rs.getInt("resources_type_id");
}
*/
%>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<style>
@media screen and (max-width:786px){
input,tr,td{
width:40%;
margin-left:auto;
margin-right:auto;
}
}
</style>
<script>
function takeToUserHome(){
	window.location="./../user-home.jsp";
}
</script>     

<style>

/*Additional material button modal buttons*/
#lnkbtn{
transition: transform 0.2s;
}
#lnkbtn:hover{
transform:scale(1.5);
}
#flbtn{
transition: transform 0.2s;
}
#flbtn:hover{
transform:scale(1.5);
}

/*end of additional material button*/
 
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


/* Start of home button styling*/

.homebtn {
    background-color: DodgerBlue;
    border: none;
    color: white;
    padding: 12px 16px;
    font-size: 16px;
    cursor: pointer;
    float:right;
    border-radius:5px;
}

/* Darker background on mouse-over */
.homebtn:hover {
    background-color: RoyalBlue;
}

/* end of button styling */ 


</style>     

</head>


<body>

<!-- HEADER -->
	<div class="header-box" style="padding:0px">
		<div class="header-text" style="width:100%">
  			<h1 onclick='takeToUserHome()' style="font-size:5vw">School Resource System</h1>
  			<button class="homebtn" onclick="window.location.href='./../user-home.jsp'"><i class="fa fa-home"></i></button>
		</div>
	</div>
<!-- END OF HEADER -->
<center><br><br><br>
<%
	if(resType.equals("additionalmaterial")){
	rs=stat.executeQuery("select resources_id from resources where resources_type_id=1 and topic_id='" + tid + "' ");
    if(rs.next()){
    	rid=rs.getInt(1);
    }
    else{
	LocalDateTime reqDate = LocalDateTime.now(); 	
	System.out.println(""+tid+" "+uid+" "+reqDate);
	String insrtqry="insert into resources(resources_type_id,topic_id,userid,creation_date,updation_date) values(1,"+ tid +","+ uid +",'"+ reqDate +"','"+ reqDate +"') ";
	stat.executeUpdate(insrtqry);
	rs=stat.executeQuery("select resources_id from resources where resources_type_id=1 and topic_id='" + tid + "' ");
	if(rs.next()){
    	rid=rs.getInt(1);
    }
    }
%>
<!-- button to trigger the modal for link upload -->
<div>
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
	<p>&nbsp;</p>
	</div>
	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" id='lnkbtn'>  
  <!-- Trigger the modal with a button -->
  <button style='width:100%;height:20%;' type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal1"><span class="glyphicon glyphicon-edit"></span> Upload link</button>
    </div>
    <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
	<p>&nbsp;</p>
	</div> 
	</div>
</div>
<!-- end of button to trigger the modal for link upload -->



  <!-- Modal -->
  <div class="modal fade" id="myModal1" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
		 <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Insert Link</h4>
        </div>
        <div class="modal-body">
      
          <h2 style='font-family:courier'>Add additional material link.</h2>
		  <form method=post action="uploadAdditionalMaterialLink.jsp?rid=<%=rid%>">	
		  <table><tr><td style='font-family:courier'>
		  Additional material link:<td><input type=text name="addmtlnk" placeholder="don't include https:// with the link">
		  <tr><td style='font-family:courier'>
		  Additional material description:<td><input type=text name="addmtdscp" placeholder="please add some description">
		  <tr><th>
		  <input type=submit>
		  </table>
		  <br>
		  </form>
         
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
<!-- end of modal for link upload of additional material -->

<br><br><br>
<b>-OR-</b>	
<br>
<br><br>
<br>

<!-- button to trigger the modal for file upload -->
<div>	
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
		<p>&nbsp;</p>
	</div>
	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" id='flbtn'>  
  		<!-- Trigger the modal with a button -->
  		<button style='width:100%;height:20%;' type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal2"><span class="glyphicon glyphicon-folder-close"></span> Upload file</button>
    </div>
    <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
		<p>&nbsp;</p>
	</div> 
	
</div>
</div>
<!-- end button to trigger the modal for file upload -->


  
  
<!-- Modal -->
  <div class="modal fade" id="myModal2" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Insert file</h4>
        </div>
        <div class="modal-body">
          	
	<h3 style='font-family:courier'>File Upload:</h3>
      <form action ="uploadAdditionalMaterialFile.jsp?rid=<%=rid%>" method = "post" enctype = "multipart/form-data">
           <table><tr><td style='font-family:courier'>
          Additional material description:<td><input type=text name="addmtdscp">
        <tr><td>
         <input type = "file" name = "addmtlnk" size = "50" />
         <tr><th>
         <input type = submit>
         </table>
         <br>
     </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
<!-- end of modal fro file upload of additional material -->  

<% 
	}


//tutorial..................................................

	if(resType.equals("tutorial")){
		rs=stat.executeQuery("select resources_id from resources where resources_type_id=2 and topic_id='" + tid + "' ");
	    if(rs.next()){
	    	rid=rs.getInt(1);
	    }
	    else{
		LocalDateTime reqDate = LocalDateTime.now(); 	
		String insrtqry="insert into resources(resources_type_id,topic_id,userid,creation_date,updation_date) values(2,"+ tid +","+ uid +",'"+ reqDate +"','"+ reqDate +"') ";
		stat.executeUpdate(insrtqry);
		rs=stat.executeQuery("select resources_id from resources where resources_type_id=2 and topic_id='" + tid + "' ");
		if(rs.next()){
	    	rid=rs.getInt(1);
	    }	
	    }
%>
<center>
	<h2 style='font-family:courier'>Tutorial link.</h2>
	<br>
	<form method=post action="uploadTutorialLink.jsp?rid=<%=rid%>">	
		<table><tr><td style='font-family:courier'>
		Tutorial Name:<td><input type=text name="tutnm" required><td><p style='color:red'>*Please give a name to the tutorial ...</p>
		<tr><td style='font-family:courier'>
		Tutorial link:<td><input type=text name="tutlnk" required><td><p style='color:red'>*Remember to start your link with https://...</p>
		
		<tr><td style='font-family:courier'>
		Tutorial description:<td><input type=text name="tutdscp" required>
		
		<tr><td style='font-family:courier'>
		Additional links:<td><input type=text name="adlnk" required><td><p style='color:red'>*Please provide some additional refrence link ...</p>
		
		<tr><td>
		<input type=submit style='width:150px'>
		</table>
	</form>
	<br>	

<% 	    
	}


//PhET...................................................................................
	if(resType.equals("phet")){
	rs=stat.executeQuery("select resources_id from resources where resources_type_id=3 and topic_id='" + tid + "' ");
	    if(rs.next()){
	    	rid=rs.getInt(1);
	    }
	    else{
		LocalDateTime reqDate = LocalDateTime.now(); 	
		String insrtqry="insert into resources(resources_type_id,topic_id,userid,creation_date,updation_date) values(3,"+ tid +","+ uid +",'"+ reqDate +"','"+ reqDate +"') ";
		stat.executeUpdate(insrtqry);
		rs=stat.executeQuery("select resources_id from resources where resources_type_id=3 and topic_id='" + tid + "' ");
		if(rs.next()){
	    	rid=rs.getInt(1);
	    }	
	    }
%>
<br>
<center>
	<h2 style='font-family:courier'>PhET Link</h2>
	<br>
	<form method=post action="uploadPhetLink.jsp?rid=<%=rid%>">	
		<table><tr><td style='font-family:courier'>
		PhET Name:<td><input type=text name="phtnm" required><td style='font-family:courier'><td><p style='color:red'>*Please give a name to the PhET ...</p>
		<tr><td style='font-family:courier'>
		PhET link:<td><input type=text name="phtlnk" required><td style='font-family:courier'><td><p style='color:red'>*Remember to start your link with https://...</p>
		<tr><td>		
		<input type=submit>
	    </table>
	    <br>
	</form>
	<br>
<%		
	}



//Mindmap............................................................................................
	if(resType.equals("mindmap")){
		rs=stat.executeQuery("select resources_id from resources where resources_type_id=4 and topic_id='" + tid + "' ");
	    if(rs.next()){
	    	rid=rs.getInt(1);
	    }
	    else{
		LocalDateTime reqDate = LocalDateTime.now(); 	
		String insrtqry="insert into resources(resources_type_id,topic_id,userid,creation_date,updation_date) values(4,"+ tid +","+ uid +",'"+ reqDate +"','"+ reqDate +"') ";
		stat.executeUpdate(insrtqry);
		rs=stat.executeQuery("select resources_id from resources where resources_type_id=4 and topic_id='" + tid + "' ");
		if(rs.next()){
	    	rid=rs.getInt(1);
	    }
	    }
%>
<br>
<center>	
<h3 style='font-family:courier'>File Upload</h3>
<br>
      Select a file to upload: <br />
      <form action ="uploadMindmapFile.jsp?rid=<%=rid%>" method = "post" enctype = "multipart/form-data">
          <table><tr><td style='font-family:courier'>
          Mind map description:<input type=text name="mmdscp" required><td><input type = "file" name = "mmlnk" size = "50" required/>
         <tr><td>
        
         <input type = submit>
         </table>
         <br>
     </form>
     <br>
<%
	}
%>
</body>

