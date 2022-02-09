<%@page import="java.sql.*"%>
<%@include file="connection.jsp" %>
<!DOCTYPE html>
<html lang="en">
 
  <head>
<%
Integer uid=0;
uid = (Integer) session.getAttribute("uid");
//Clear the cache and disable the backbutton to come to this page.
response.setHeader("Pragma","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Expires","0");
response.setDateHeader("Expires",-1);
%>   
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
      <script>
      function validate(){
      var v1 =$("#sval").val();
      var v2 =$("#gval").val();
  
      if(v1=="select" || v2=='-1'){
    	  alert("Watch out");
      }
      else {
   	  window.location="grade-subject-filterbox-result.jsp?subnm="+ v1 +"&gid="+v2+" ";
      }	  
      
      
      }
      </script> 
      
      
 <script  type="text/javascript">  
      var xmlHttp  
      var xmlHttp
      function showGrade(subject_name){
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
      var url="grade-subject-filterbox-grade.jsp";
      url +="?sub_name=" +subject_name;
      xmlHttp.onreadystatechange = gradeChange;
      xmlHttp.open("GET", url, true);
      xmlHttp.send(null);
      }


      function gradeChange(){   
          if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
          document.getElementById("grade").innerHTML=xmlHttp.responseText   
          }   
          }
</script> 

 






<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
    $('.carousel').carousel({
        interval: 5000 //changes the speed
    })
</script>
<title>User Welcome page</title>
<style>


/* HEADER*/
 
.header-text {
  background-color:#4CAF50;  
  /* The width is 20%, by default */
  color:#ffffff; 	
 
 
  text-align:center;
  font-family:courier;
}
/*end of header*/

/*footer*/
.footer {
    position: fixed;
    left: 0px;
    bottom: 0;
    width: 100%;
    background-color:#123554;
    color: white;
    text-align: center;
    padding: 14px 16px;
    z-index:4;
}
/*end of footer*/


/*Menu bar*/


/*Menu bar*/

/*color of menu bar*/
.collapse,.container-fluid{
    background-color: #2e2e2e;
}
/*color of menu bar*/

/*background color of buttons such as about, login,register*/
#menubar-listid:hover{
background-color:#000000;
}

.topnav {
  overflow: hidden;
  background-color: #123554;
  height:34px;
}

.topnav a {
  float: right;
  color: #f2f2f2;
  text-align: center;
  padding: 7px 16px;
  text-decoration: none;
  font-size: 17px;
  height:30px;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}


.sticky {
  position: fixed;
  top: 0;
  width: 100%;
}

.sticky + .content {
  padding-top: 102px;
}
/* End of menu bar*/



/* Use a media query to add a break point at 800px: */
@media screen and (max-width:500px) {
  .header-box{
    width:100%;
    padding:0; /* The width is 100%, when the viewport is 800px or smaller */
  }
  .carousel-box{
  	width:100%;
  	top:1500px;
  }
}
@media screen and (max-width:200px) {
	.topnav a{
    width:100%;
    }
}

@media screen and (min-width:900px) {

/*PAGE STYLE*/
#outer {
	z-index: 3;
	width: 1180px;
	margin: -10 60px 10 60px;
	background: #ffffff;
	box-shadow: 0px 0px 60px 0px rgba(0,0,0,0.2);
	position:relative;
	top:10px;
	left:57px;
}

#homeouter {

	z-index: 3;
	width: 1180px;
	background: #ffffff;
    box-shadow: 0px 0px 60px 0px rgba(0,0,0,0.2);
    position:relative;
}	
/*END OF PAGE STYLE*/

.topnav{z-index:4;}

/*footer*/
.footer {
    position: fixed;
    left: 57px;
    bottom: 0;
    width: 1180px;
    background-color:#123554;
    color: white;
    text-align: center;
    padding: 14px 16px;
    z-index:4;
}
/*end of footer*/
.sticky{
	width:1180px;}

}
/*END OF MEDIA*/

/*CONTENT*/
.content {
  padding: 16px;
}
/*END OF CONTENT*/



/*Style for content elements this is for the first row in cntr................container styling........................*/

.cntr1 img{
width:750px;
height:500px;
box-shadow: 0 8px 16px 0 rgba(0,0,0,2);
border-radius:10px;
}

.cntr3 iframe{
width:480px;
height:300px;
}
.cntr3 video{
width:600px;
height:300px;
}

@media screen and (max-width: 786px){
.cntr1 img{
width:100%;
}
.cntr3 iframe{
width:100%;
}
.cntr3 video{
width:85%;
}
.cntr input,textarea{
width:200px;
}
}


/*end of container styling...........................................................container end styling*/



/*search bar modal style ..................................*/


body {font-family: Arial, Helvetica, sans-serif;}

/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    background-color: #fefefe;
    margin: auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
}

/* The Close Button */
.close {
    color: #aaaaaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}

/*end of search bar style....................................*/
</style>


</head>


<!-- Important parameters that validate the page otherwise will redirect to welcome page -->
<%
String nm="";
Integer id=0;
id = (Integer) session.getAttribute("uid");
rs=stat.executeQuery("Select user_name from user where userid="+ id +" ");
if(rs.next()){
	nm=rs.getString("user_name");
}
else{
	out.println(" <head><meta http-equiv=refresh content='0;URL=./../index.jsp' /></head> ");
}
%> 
<!-- end of fetching important parameters -->


<!-- Start of body -->
<body>

<!-- HEADER -->
<div class="container" style='width:100%'>
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-10 col-lg-10" style='margin:0;padding:0px 0px 0px 0px;'>
    		<div class="header-text">    
  		<p style="font-size:3vw">School Resource System</p>
  		</div>
  		</div>
  	<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2" style='text-align:center;background-color:#363d47;margin:0;padding:0'>	
  		<p style='font-family:courier;font-size:16px;font-weight:bold;color:#ffffff'><span class="glyphicon glyphicon-user"></span><br>Hello <%=nm%></p>
	</div>
</div>
</div>		


<%
Integer opt=0;
rs=stat.executeQuery("select role_id from user_roles where userid="+ id +" ");
if(rs.next()){
	opt=rs.getInt(1);
}
%>

<!--  
<%
if(opt==1){
%>	
<p style='font-family:courier;font-color:red'><marquee>Welcome user- <insert here nm variable> ! You can upgrade to contributor by hitting edit profile in drop down menu.</marquee></p>
<%
}
%>

<%
if(opt==2){
%>	
<p style='font-family:courier;font-color:red'><marquee>Welcome contributor- <insert here nm variable>  ! Your contribution to the community is of utmost importance.</marquee></p>
<%
}
%>
<%
if(opt==3){
%>	
<p style='font-family:courier;font-color:red'><marquee>Welcome administrator- <insert here nm variable> ! Never miss to check contributor requests of resources.</marquee></p>
<%
}
%>
-->
<!-- END OF HEADER -->


<%
String p=request.getParameter("abc");
if(p!=null){
if(p.equals("inv")){
	%>
	<p style='font-color:red'>Something went wrong! Please Refill</p>
	<%
}
if(p.equals("crt")){
	%>
	<p style='font-color:green'>Successful!!</p>
	<%
}
}
%>


<%
	String upldStatus=request.getParameter("upload-status");
	if(upldStatus!=null){
		if(upldStatus.equals("success")){
			%>
			<p style='background-color:#42f459;font-color:#ffffff'>Successfully uploaded</p>
			<% 
		}
		else{
			%>
			<p style='background-color:#b72f28;font-color:#ffffff'>Something went wrong.Please try again. may be same folder name exist in data base try adding some numbers as prefix or suffix(eg.abc1.zip)</p>
			<%
		}
	}
%>



<!-- MENU BAR -->
<div id="myMenuBar" style='width:100%;z-index:3;'>
<nav class="navbar navbar-default" >
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
  <div class="navbar-form navbar-left">
   	<select name='subject' id="sval" style="width:200px" onchange="showGrade(this.value) ">  
		<option value="select">subject</option>  
<%
 rs = stat.executeQuery("Select subject_name from subject group by subject_name");
 while(rs.next()){
%>
	     <option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>  
<%
 }
 %>
 	</select>
</div>	  
<div id="grade">  
     <!-- will get the AJAX response text here. -->
</div>  

     
      <ul class="nav navbar-nav navbar-right">
        <li id='menubar-listid'><a href=# id="myBttn" style="color:#ffffff" >Topic <span class="glyphicon glyphicon-search"></span></a></li>
       
        <li id='menubar-listid'><a href="#about_us" style="color:#ffffff">About <span class="glyphicon glyphicon-tag"></span></a></li>
        
        <li id='menubar-listid'><a href='logout.jsp' style="color:#ffffff" >Logout <span class="glyphicon glyphicon-lock"></span></a></li>
        
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" style='color:#ffffff'>Dropdown <span class="caret"></span></a>
          	<ul class="dropdown-menu">
            	<li><a href="user-reset-password-form.jsp" style="color:#000000"><span class="glyphicon glyphicon-refresh"></span> reset password </a></li>
            	<li><a href="user-edit-profile-form.jsp" style="color:#000000"><span class="glyphicon glyphicon-pencil"></span> edit profile </a></li>
           
           <%
           if(opt==3){
           %>
           		 	<li><a href="upload/upload-resource-select.jsp" style="color:#000000"><span class="glyphicon glyphicon-share"></span> contribute</a></li>
            	 	<li><a href="admin/admin.jsp?slct=1" style="color:#000000"><span class="glyphicon glyphicon-folder-open"> accept additional material </span></a></li>
            	 	<li><a href="admin/admin.jsp?slct=2" style="color:#000000"><span class="glyphicon glyphicon-folder-open"> accept tutorial </span></a></li>
            	 	<li><a href="admin/admin.jsp?slct=3" style="color:#000000"><span class="glyphicon glyphicon-folder-open"> accept PhET </span></a></li>
            	 	<li><a href="admin/admin.jsp?slct=4" style="color:#000000"><span class="glyphicon glyphicon-folder-open"> accept mind map</span></a></li>
           	    	<li><a href="admin/contributor_request.jsp" style="color:#000000"><span class="glyphicon glyphicon-thumbs-up"></span> accept contibutors </a></li>
           <%
           }
           %>
           <%
           if(opt==2){
           %>
                    <li><a href="upload/upload-resource-select.jsp" style="color:#000000"><span class="glyphicon glyphicon-tag"></span> contribute </a></li>
            	 	<li><a href="pendingResource.jsp" style="color:#000000"><span class="glyphicon glyphicon-remove"> pending </span></a></li>
           	    	<li><a href="acceptedResource.jsp" style="color:#000000"><span class="glyphicon glyphicon-ok"></span> accepted </a></li>   
           <%
           }
           %>
           </ul>
         </li>  
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

</div>
<!--END OF MENU BAR-->

<!-- CONTAINER CAROUSEL -->
<div class="carousel-box" style="border: 2px solid black;
    box-sizing: border-box;z-index:-1">	
<div class="container" style="width:100%;padding:0px">

  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
<!--  to remove buttons at the bottom    
    <ol class="carousel-indicators" style="z-index:3">
      <li data-target="#myCarousel" data-slide-to="0" class="active" ></li>
      <li data-target="#myCarousel" data-slide-to="1" ></li>
      <li data-target="#myCarousel" data-slide-to="2" ></li>
    </ol>
-->
    <!-- Wrapper for slides -->
    <div class="carousel-inner" >
      <div class="item active" >
        <img src="./../static/img/Abdul-Kalam.jpg" alt="1/3" style="width:100%;height:420px">
      </div>

      <div class="item"> 
        <img src="./../static/img/e-learning-banner.png" alt="2/3" style="width:100%;height:420px">
      </div>
    
      <div class="item">
        <img src="./../static/img/pen.png" alt="3/3" style="width:100%;height:420px">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
</div>
<!-- END OF CAROUSEL -->

<!-- searchbar Modal............................................................-->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
    <p>
		<jsp:include page="./../loggedin_searchbar.jsp">
    		<jsp:param name="" value=""/>
		</jsp:include>
	</p>
  </div>

</div>
<!-- end of searchbar bar........................................................-->


<!-- CONTENT-->
<div class="content">

<h2 style='text-align:center;font-family:courier;font-weight:bold'>Available resources </h2>
<br>


	<!--about wrapper left-->
		<div class="cntr1" style='width:100%;padding:20px 20px'>

			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					<img src="./../static/img/elearning-graphic.png" alt=""/>
				</div>
				
						
				<!--about wrapper right-->
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" style='border: 4px solid #6a91b7;border-radius:10px;background-color:#edeeef;top:40px;box-shadow: 0 8px 16px 0 rgba(0,0,0,1.5);'>
					<h3><span class="glyphicon glyphicon-film"></span> PhET(Interactive Simulations)</h3>
						<p style='font-family:courier'>PhET is a suite of research-based interactive computer simulations for teaching and learning physics, chemistry, math, and other sciences.</p>
					
					<h3><span class="glyphicon glyphicon-facetime-video"></span> Tutorials</h3>
						<p style='font-family:courier'> More interactive and specific than a book or a lecture, a tutorial seeks to teach by example and supply the information to complete a certain task.</p>
					
					<h3><span class="glyphicon glyphicon-list-alt"></span> Mind map</h3>
						<p style='font-family:courier'>A mind map is a diagram used to visually organize information. A mind map is hierarchical and shows relationships among pieces of the whole.</p>
			
					<h3><span class="glyphicon glyphicon-plus"></span> Additional materials</h3>
						<p style='font-family:courier'>These are some extra stuff for your refrence.</p>
				
			</div>

		</div>
	</div>

<br>
<!-- second content container -->
<h2 style='text-align:center;font-family:courier;font-weight:bold'>Notice Board</h2>
<br>
<div class="cntr2" style='width:100%;padding:20px 20px'>

			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4" style='border: 4px solid #e05a0d;border-radius:10px;background-color:#edeeef;top:10px;box-shadow: 0 8px 16px 0 rgba(0,0,0,1.5);'>
					<marquee direction="down" style='font-family:courier;font-size:18px;font-weight:bold;text-align:center'>Please write us<br>about the website<br>at www.spokentutorial.org</marquee>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-8 col-lg-8" style='border: 4px solid #6a91b7;border-radius:10px;background-color:#edeeef;top:12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,1.5);left:5px'>
					<h3><span class="glyphicon glyphicon-exclamation-sign"></span> Become Contributor</h3>
						<p style='font-family:courier;font-size:18px'>1. To become contributor and get paid you need to register as user.<br>2. Login and go to edit and click on become contributor and submit the form<br>3. On completion of user-authentication from admin you will recieve mail and automatically upgraded to contributor,thats it.</p>
				</div>
			</div>
</div>							
<!-- end of second content container -->
<!-- third container -->
<!--if you want speed please keep it close.
<h2 style='text-align:center;font-family:courier;font-weight:bold'>Sample</h2>
<br>

<div class="cntr3" style='width:100%;padding:20px 20px'>

			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-5 col-lg-5" style='border: 4px solid #6a91b7;border-radius:10px;background-color:#edeeef;top:10px;box-shadow: 0 8px 16px 0 rgba(0,0,0,1.5);padding-top:5px;text-align:center;'>
					<iframe src="https://PhET.colorado.edu/sims/html/area-model-algebra/latest/area-model-algebra_en.html" width="480" height="300"></iframe>
			     <a href='https://phet.colorado.edu/en/simulations/category/new'><span class="glyphicon glyphicon-film"></span></a>
				
				</div>
				<div class="col-xs-12 col-sm-12 col-md-7 col-lg-7" style='top:12px;background-color:#edeeef;box-shadow: 0 8px 16px 0 rgba(0,0,0,1.0);border: 4px solid #e05a0d;border-radius:10px;text-align:center'>
					video controls><source src="http://spoken-tutorial.org/media/videos/36/341/What-is-Spoken-Tutorial-12min-English.ogv" type="video/mp4"><source src="mov_bbb.ogg" type="video/ogg"></video>
				</div>
			</div>
</div>	
<br>
-->
<!-- end of third container -->

<!-- fourth container -->
<div id='about_us'>
<h2 style='text-align:center;font-family:courier;font-weight:bold'>About us</h2>
<br>
<div class="cntr4" style='width:100%;padding-top:10px;padding-left:20px;padding-right:20px'>

			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style='border-radius:10px;background-color:#e58704;top:10px;box-shadow: 0 8px 16px 0 rgba(0,0,0,1.5);padding-top:5px;text-align:center;'>
					<h3 style='font-family:courier'>A personalized learning resource for school students.</h3>	
						<p style='font-family:courier;font-size:16px'>School resource system(aka,SRS) offers practice exercises, instructional videos, and a personalized learning dashboard<br> that empower learners to study at their own pace in and outside of the classroom.<br> We tackle math, science, computer programming, history, art history, economics, and more.<br> Our mission guide learners from kindergarten to calculus using state-of-the-art,<br> adaptive technology that identifies strengths and learning gaps. <br>We've also partnered with leading institutions, to offer specialized content so that every students has equal opportunity to know and grow.</p>

				</div>
			</div>
</div>
</div>
<br>					
<!-- end of fourth container -->

<!-- fifth container -->
<br>
<div class="cntr5">

			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style='background-color:#777;top:10px;box-shadow: 8px 8px 8px 8px rgba(0,0,0,1.5);'>
					<table style='width:30%'>
						<tr>
							<td><p style='font-family:courier;font-color:white;font-size:16px;font-weight:bold'>Email: </p></td><td><input placeholder='email' type=email required ></td>
						</tr>	
						<tr>	
							<td><p style='font-family:courier;font-color:white;font-size:16px;font-weight:bold'>Response: </p></td><td><textarea placeholder='your response please' rows="4" cols="50" required></textarea></td>
						</tr>
						<tr>
						<td></td><th><button >submit</button></th>
						</tr>
					</table>
					<p style='text-align:center'>School Resource System-2018</p>
			</div>
</div>	
</div>
<br>
<!-- end of fifth container -->





</div>

<!-- END OF CONTETNT-->

			
</body>

<script>
window.onscroll = function() {myFunction()};

var header = document.getElementById("myMenuBar");
var sticky = header.offsetTop;

function myFunction() {
  if (window.pageYOffset >= sticky) {
    header.classList.add("sticky");
  } else {
    header.classList.remove("sticky");
  }
}
</script>



<!-- script for searchbar modal -->
<script>
// Get the modal
var mdl = document.getElementById('myModal');

// Get the button that opens the modal
var bttn = document.getElementById("myBttn");

// Get the <span> element that closes the modal
var spn = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
bttn.onclick = function() {
    mdl.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
spn.onclick = function() {
    mdl.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        mdl.style.display = "none";
    }
}
</script>
<!-- end of script  -->

</html>
