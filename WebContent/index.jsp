<%@page import="java.sql.*"%>
<%@include file="jsp/connection.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<script type = "text/javascript" >
function disableBackButton()
{
window.history.forward();
}
setTimeout("disableBackButton()", 0);
</script>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
      <script>
      function validate(){
      var v1 =$("#sval").val();
      var v2 =$("#gval").val();
  
      if(v1=="select" || v2=='-1'){
    	  alert("Watch out");
      }
      else {
   	  window.location="jsp/grade-subject-filterbox-result.jsp?subnm="+ v1 +"&gid="+v2+" ";
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
      var url="jsp/grade-subject-filterbox-grade.jsp";
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
<title>Welcome page</title>

<!--  icons on the title -->
<link rel="shortcut icon" type="image/icon" href="static/img/untitled.png"/>

<style>

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

.topnav{z-index:3;}

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




</style>


<style>
/* ------------------------------------------------------------------------Modal style----------------*/
/*align modal to the center */

.modal{
    display: block;
    margin-left: auto;
    margin-right: auto;
    z-index:6;
}
/* end of modal alignment*/
/* Style all input fields */
input {
    width: 100%;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    margin-top: 6px;
    margin-bottom: 16px;
}


/* Style the container for inputs */
.container {
    background-color: #f1f1f1;
    padding: 20px;
}

/* The message box is shown when the user clicks on the password field */
#message {
    display:none;
    background: #f1f1f1;
    color: #000;
    position: relative;
    padding: 20px;
    margin-top: 10px;
}

#message p {
    padding: 10px 35px;
    font-size: 18px;
}

/* Add a green text color and a checkmark when the requirements are right */
.valid {
    color: green;
}

.valid:before {
    position: relative;
    left: -35px;
    content: "yes";
}

/* Add a red text color and an "x" when the requirements are wrong */
.invalid {
    color: red;
}

.invalid:before {
    position: relative;
    left: -35px;
    content: "no";
}
</style>




<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box}
/* Full-width input fields */
input[type=text], input[type=password] {
    width: 100%;
    padding: 15px;
    margin: 5px 0 22px 0;
    display: inline-block;
    border: none;
    background: #f1f1f1;
}

/* Add a background color when the inputs get focus */
input[type=text]:focus, input[type=password]:focus {
    background-color: #ddd;
    outline: none;
}

/* Set a style for all buttons */
.button {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
    opacity: 0.9;
}

.button:hover {
    opacity:1;
}

/* Extra styles for the cancel button */
.cancelbtn {
    padding: 14px 20px;
    background-color: #f44336;
}

/* Float cancel and signup buttons and add an equal width */
.cancelbtn, .signupbtn {
  float: left;
  width: 50%;
}

/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: #474e5d;
    padding-top: 50px;
}

/* Modal Content/Box */
.modal-content {
    background-color: #fefefe;
    margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
    border: 1px solid #888;
    width: 80%; /* Could be more or less, depending on screen size */
    padding-left:10px;
}

/* Style the horizontal ruler */
hr {
    border: 1px solid #f1f1f1;
    margin-bottom: 25px;
}
 
/* The Close Button (x) */
.close {
    position: relative;
    z-index: 6;
    font-size: 40px;
    font-weight: bold;
    color: black;
    padding-top: 5px;
    padding-right:10px;
}

.close:hover,
.close:focus {
    color: #f44336;
    cursor: pointer;
}

/* Clear floats */
.clearfix::after {
    content: "";
    clear: both;
    display: table;
}

select{
	height:200%;
}

/* Change styles for cancel button and signup button on extra small screens */
@media screen and (max-width: 300px) {
    .cancelbtn, .signupbtn {
       width: 100%;
    }
}

.navbar navbar-default{
bgcolor='#2c2c2c';
}


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


<%
String s1=request.getParameter("s1");
String s2=request.getParameter("s2");

if(s1==null){
	s1="";
}
if(s2==null){
	s2="";
}
%>
<!-- BODY---------------------BODY----------------------BODY------------------------------BODY -->

<body>

<!-- HEADER -->

<div class="header-text" style="width:100%">
	
  <h2  style="font-size:5vw;">School Resource System</h2>
</div>

<!-- END OF HEADER -->


<%
	String regStatus=request.getParameter("reg-status");
	if(regStatus!=null){
		if(regStatus.equals("success")){
			%>
			<p style='background-color:#ffa200'>Successfully registered</p>
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
        <li id='menubar-listid'><a href=# id="myBtn" style="color:#ffffff" >Topic <span class="glyphicon glyphicon-search"></span></a></li>
        <li id='menubar-listid'><a href="#about_us" style="color:#ffffff">About <span class="glyphicon glyphicon-tag"></span></a></li>
        <li id='menubar-listid'><a href="#" id="rgst" style="color:#ffffff">Register <span class="glyphicon glyphicon-user"></span></a></li>
        <li id='menubar-listid'><a href='jsp/login.jsp' style="color:#ffffff" >Login <span class="glyphicon glyphicon-lock"></span></a></li>
       
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

</div>
<!--END OF MENU BAR-->




<!-- CONTAINER CAROUSEL -->
<div class="carousel-box" style="border: 2px solid black;
    box-sizing: border-box;z-index:-1;box-shadow:4px 4px 4px 4px rgba(0,0,0,1.5);height:420px ">	
<div class="container" style="width:100%;padding:0px">

  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
<!-- this is to remove the buttons that come at the bottom 
    <ol class="carousel-indicators" style="z-index:3">
      <li data-target="#myCarousel" data-slide-to="0" class="active" ></li>
      <li data-target="#myCarousel" data-slide-to="1" ></li>
      <li data-target="#myCarousel" data-slide-to="2" ></li>
    </ol>
   end of carousel indicators -->
    <!-- Wrapper for slides -->
    <div class="carousel-inner" >
      <div class="item active" >
        <img src="static/img/Abdul-Kalam.jpg" alt="1/3" style="width:100%;height:420px">
      </div>

      <div class="item"> 
        <img src="static/img/e-learning-banner.png" alt="2/3" style="width:100%;height:420px">
      </div>
    
      <div class="item">
        <img src="static/img/pen.png" alt="3/3" style="width:100%;height:420px">
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
		<jsp:include page="searchbar.jsp">
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
					<img src="static/img/elearning-graphic.png" alt=""/>
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
<h2 style='text-align:center;font-family:courier;font-weight:bold'>Sample</h2>
<br>
<div class="cntr3" style='width:100%;padding:20px 20px'>

			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-5 col-lg-5" style='border: 4px solid #6a91b7;border-radius:10px;background-color:#edeeef;top:10px;box-shadow: 0 8px 16px 0 rgba(0,0,0,1.5);padding-top:5px;text-align:center;'>
					<iframe src="https://phet.colorado.edu/sims/html/area-model-algebra/latest/area-model-algebra_en.html" width="480" height="300"></iframe>
			
				
				</div>
				<div class="col-xs-12 col-sm-12 col-md-7 col-lg-7" style='top:12px;background-color:#edeeef;box-shadow: 0 8px 16px 0 rgba(0,0,0,1.0);border: 4px solid #e05a0d;border-radius:10px;text-align:center'>
					<video controls><source src="http://spoken-tutorial.org/media/videos/36/341/What-is-Spoken-Tutorial-12min-English.ogv" type="video/mp4"><source src="mov_bbb.ogg" type="video/ogg"></video>
				</div>
			</div>
</div>	
<br>
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
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style='background-color:#777;top:10px'>
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







<!-- Modal------------------------------------------------------------------------ -->


<div id="regstr" class="modal container">
  <form class="modal-content" method=post name="rgstr" action=registration>
      <div onclick="document.getElementById('regstr').style.display='none'" class="close" title="Close Modal">&times;</div>
	
      <h1>Sign Up</h1>
      <p>Please fill in this form to create an account.</p>
      <hr>
     
      <label for="first-name"><b>First name</b></label>
      <input type="text" pattern='[A-Za-z\\s]*' placeholder="Enter first Name" name="frst-nm" required value=<%=s1%> >

      <label for="last-name"><b>Last name</b></label>
      <input type="text" pattern='[A-Za-z\\s]*' placeholder="Enter last Name" name="lst-nm" required value=<%=s2%> >

      <label for="email"><b>Email</b></label>
      <input type="text"  pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" placeholder="Enter Email" name="email" required>
      
      <label for="user-name"><b>User Name</b></label>
      <input type="text" placeholder="Enter User Name" name="usr-nm" required >      
      
      
      <label for="psw"><b>Password</b></label>
      <input type="password" id="psw" placeholder="Enter Password" name="psw" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required>
    
<div id="message">
  <h3>Password must contain the following:</h3>
  <p id="letter" class="invalid">A <b>lower case</b> letter</p>
  <p id="capital" class="invalid">A <b>capital (upper case)</b> letter</p>
  <p id="number" class="invalid">A <b>number</b></p>
  <p id="length" class="invalid">Minimum <b>8 characters</b></p>
</div>
         
<!--check box to T&C  
<p>By creating an account you agree to our <a href="https://en.wikipedia.org/wiki/Open-source_software" style="color:dodgerblue">Terms and Privacy</a>.</p>
 
	  
Accept conditions
<input type="checkbox" checked="checked" name="remember"  required>
-->       
    

      

      
      <div class="clearfix">
        <button class="button" type="button" style='width:48%;background-color:red' onclick="document.getElementById('regstr').style.display='none'" class="cancelbtn">Cancel</button>
        <button  class ="button" type="submit" style='width:48%' class="signupbtn">Sign Up</button>
      </div>
      
   </form>  
</div>

<!-- -----------------------End of modal -->
	
 <!--  foooooooooooooooooooooooooooooooooooooooooooooooooooooooter
<div class="footer">
  <p>Footer</p>
</div> 	
-->

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



<script>
// Get the modal
var mdl = document.getElementById('regstr');

//Get the button that opens the modal
var bttn = document.getElementById("rgst");

//Get the <span> element that closes the modal
var spn = document.getElementsByClassName("close")[0];

//When the user clicks the button, open the modal 
bttn.onclick = function() {
    mdl.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
spn.onclick = function() {
    mdl.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == mdl) {
        mdl.style.display = "none";
    }
}
</script>


				
<script>
var myInput = document.getElementById("psw");
var letter = document.getElementById("letter");
var capital = document.getElementById("capital");
var number = document.getElementById("number");
var length = document.getElementById("length");

// When the user clicks on the password field, show the message box
myInput.onfocus = function() {
    document.getElementById("message").style.display = "block";
}

// When the user clicks outside of the password field, hide the message box
myInput.onblur = function() {
    document.getElementById("message").style.display = "none";
}

// When the user starts to type something inside the password field
myInput.onkeyup = function() {
  // Validate lowercase letters
  var lowerCaseLetters = /[a-z]/g;
  if(myInput.value.match(lowerCaseLetters)) {  
    letter.classList.remove("invalid");
    letter.classList.add("valid");
  } else {
    letter.classList.remove("valid");
    letter.classList.add("invalid");
  }
  
  // Validate capital letters
  var upperCaseLetters = /[A-Z]/g;
  if(myInput.value.match(upperCaseLetters)) {  
    capital.classList.remove("invalid");
    capital.classList.add("valid");
  } else {
    capital.classList.remove("valid");
    capital.classList.add("invalid");
  }

  // Validate numbers
  var numbers = /[0-9]/g;
  if(myInput.value.match(numbers)) {  
    number.classList.remove("invalid");
    number.classList.add("valid");
  } else {
    number.classList.remove("valid");
    number.classList.add("invalid");
  }
  
  // Validate length
  if(myInput.value.length >= 8) {
    length.classList.remove("invalid");
    length.classList.add("valid");
  } else {
    length.classList.remove("valid");
    length.classList.add("invalid");
  }
}
</script>


<!-- script for searchbar modal -->
<script>
// Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
    modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>
<!-- end of script  -->

</html>
