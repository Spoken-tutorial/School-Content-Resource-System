<%@include file = "./../connection.jsp"%>
<head>
<title>display request</title>

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

td{
font-family:courier;
font-size:16px;
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

<!-- Script for accept reject additional material............................................. -->
<script language="javascript" type="text/javascript">  
var xmlHttp  
var xmlHttp
function addit(val){
	//alert(val);		
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

//alert(val);
var drpdwnval =document.getElementById("additional_material_dropdown");
var optn=drpdwnval.options[drpdwnval.selectedIndex].value;
//alert(optn);
var url="accept-additional-material-update.jsp";
url +="?count="+val+"&opt="+optn;
xmlHttp.onreadystatechange = addAdditionalMaterial;
xmlHttp.open("GET", url, true);
xmlHttp.send(null); 
}

function addAdditionalMaterial(){ 
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
document.getElementById("additional-material-table").innerHTML=xmlHttp.responseText   
}   
}
</script>

<script language="javascript" type="text/javascript">  
var xmlHttp  
var xmlHttp
function rejectit(val){
	//alert(val);	
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

//alert(val);
var drpdwnval =document.getElementById("additional_material_dropdown");
var optn=drpdwnval.options[drpdwnval.selectedIndex].value;
//alert(optn);
var url="reject-additional-material-update.jsp";
url +="?count="+val+"&opt="+optn;
xmlHttp.onreadystatechange = subAdditionalMaterial;
xmlHttp.open("GET", url, true);
xmlHttp.send(null);
}

function subAdditionalMaterial(){ 
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
document.getElementById("additional-material-table").innerHTML=xmlHttp.responseText   
}   
}


</script>
<!-- End of accept reject of additional material....................................... -->



<!-- Accept reject tutorial......................................................... -->

<script language="javascript" type="text/javascript">  
var xmlHttp  
var xmlHttp
function tutorialAccept(val){
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
//alert(val);
var drpdwnval=document.getElementById("tutorial_dropdown");
var optn=drpdwnval.options[drpdwnval.selectedIndex].value;
//alert(optn);
var url="tutorial_accept.jsp";
url +="?count="+val+"&opt="+optn;
xmlHttp.onreadystatechange = addTutorial;
xmlHttp.open("GET", url, true);
xmlHttp.send(null);
}

function addTutorial(){ 
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
document.getElementById("tutorial-table").innerHTML=xmlHttp.responseText   
}   
}


</script>


<script language="javascript" type="text/javascript">  
var xmlHttp  
var xmlHttp
function tutorialReject(val){
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
//alert(val);
var drpdwnval =document.getElementById("tutorial_dropdown");
var optn=drpdwnval.options[drpdwnval.selectedIndex].value;
//alert(optn);
var url="tutorial_reject.jsp";
url +="?count="+val+"&opt="+optn;
xmlHttp.onreadystatechange = subTutorial;
xmlHttp.open("GET", url, true);
xmlHttp.send(null);
}

function subTutorial(){ 
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
document.getElementById("tutorial-table").innerHTML=xmlHttp.responseText   
}   
}


</script>


<!-- end of accept reject tutorial.............................................................. -->




<!-- Accept reject PhET.................................................................... -->

<script language="javascript" type="text/javascript">  
var xmlHttp  
var xmlHttp
function phetAccept(val){
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
//alert(val);
var drpdwnval =document.getElementById("phet_dropdown");
var optn=drpdwnval.options[drpdwnval.selectedIndex].value;
//alert(optn);
var url="phet_accept.jsp";
url +="?count="+val+"&opt="+optn;
xmlHttp.onreadystatechange = addPhet;
xmlHttp.open("GET", url, true);
xmlHttp.send(null);
}

function addPhet(){ 
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
document.getElementById("phet-table").innerHTML=xmlHttp.responseText   
}   
}


</script>


<script language="javascript" type="text/javascript">  
var xmlHttp  
var xmlHttp
function phetReject(val){
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
//alert(val);
var drpdwnval =document.getElementById("phet_dropdown");
var optn=drpdwnval.options[drpdwnval.selectedIndex].value;
//alert(optn);
var url="phet_reject.jsp";
url +="?count="+val+"&opt="+optn;
xmlHttp.onreadystatechange = subPhet;
xmlHttp.open("GET", url, true);
xmlHttp.send(null);
}

function subPhet(){ 
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
document.getElementById("phet-table").innerHTML=xmlHttp.responseText   
}   
}


</script>

<!-- end of accept reject PHET.................................................................... -->




<!-- Accept reject mind map........................................................................  -->

<script language="javascript" type="text/javascript">  
var xmlHttp  
var xmlHttp
function mmAccept(val){
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
//alert(val);
var drpdwnval =document.getElementById("mindmap_dropdown");
var optn=drpdwnval.options[drpdwnval.selectedIndex].value;
//alert(optn);
var url="mindmap_accept.jsp";
url +="?count="+val+"&opt="+optn;
xmlHttp.onreadystatechange = addMindmap;
xmlHttp.open("GET", url, true);
xmlHttp.send(null);
}

function addMindmap(){ 
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
document.getElementById("mm-table").innerHTML=xmlHttp.responseText   
}   
}

</script>

<script language="javascript" type="text/javascript">  
var xmlHttp  
var xmlHttp
function mmReject(val){
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
//alert(val);
var drpdwnval =document.getElementById("mindmap_dropdown");
var optn=drpdwnval.options[drpdwnval.selectedIndex].value;
//alert(optn);
var url="mindmap_reject.jsp";
url +="?count="+val+"&opt="+optn;
xmlHttp.onreadystatechange = subMindmap;
xmlHttp.open("GET", url, true);
xmlHttp.send(null);
}

function subMindmap(){ 
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
document.getElementById("mm-table").innerHTML=xmlHttp.responseText   
}   
}
</script>
<!-- end of accept reject mindmap................................................................... -->



<!-- refresh additional material -->
<script>
var xmlHttp  
var xmlHttp
function func1(){
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
	var val =document.getElementById("additional_material_dropdown");
	var optn=val.options[val.selectedIndex].value;
	var url="refresh-additional-material.jsp";
	url+="?opt="+optn;
	xmlHttp.onreadystatechange = refreshAdditionalMaterial;
	xmlHttp.open("GET", url, true);
	xmlHttp.send(null);
}
function refreshAdditionalMaterial(){ 
	if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
	document.getElementById("additional-material-table").innerHTML=xmlHttp.responseText   
	}  	
}
</script>
<!-- end of refresh additional material -->



<!-- refresh tutorial -->
<script>
var xmlHttp  
var xmlHttp
function func2(){
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
	var val =document.getElementById("tutorial_dropdown");
	var optn=val.options[val.selectedIndex].value;
	var url="refreshTutorial.jsp";
	url+="?opt="+optn;
	xmlHttp.onreadystatechange = refreshTutorial;
	xmlHttp.open("GET", url, true);
	xmlHttp.send(null);
}
function refreshTutorial(){ 
	if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
	document.getElementById("tutorial-table").innerHTML=xmlHttp.responseText   
	}  	
}
</script>
<!-- end of refresh tutorial -->


<!-- refresh PhET -->
<script>
var xmlHttp  
var xmlHttp
function func3(){
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
	var val =document.getElementById("phet_dropdown");
	var optn=val.options[val.selectedIndex].value;
	var url="refreshPhet.jsp";
	url+="?opt="+optn;
	xmlHttp.onreadystatechange = refreshPhet;
	xmlHttp.open("GET", url, true);
	xmlHttp.send(null);
}
function refreshPhet(){ 
	if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
	document.getElementById("phet-table").innerHTML=xmlHttp.responseText   
	}  	
}
</script>
<!-- end of refresh PhET -->


<!-- refresh mind map -->
<script>
var xmlHttp  
var xmlHttp
function func4(){
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
	var val =document.getElementById("mindmap_dropdown");
	var optn=val.options[val.selectedIndex].value;
	var url="refreshMindmap.jsp";
	url+="?opt="+optn;
	xmlHttp.onreadystatechange = refreshMindmap;
	xmlHttp.open("GET", url, true);
	xmlHttp.send(null);
}
function refreshMindmap(){ 
	if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
	document.getElementById("mm-table").innerHTML=xmlHttp.responseText   
	}  	
}
</script>
<!-- end of refresh mind map -->



</head>
<%
String s=request.getParameter("slct");
Integer a=Integer.parseInt(s);
%>

<body>

<!-- HEADER -->
		<div class="header-box" style="padding:0px">
			<div class="header-text" style="width:100%">
  				<h1 onclick='takeToUserHome()' style="font-size:5vw">School Resource System</h1>
  				<button class="btn" onclick="window.location.href='./../user-home.jsp'"><i class="fa fa-home"></i></button>
			</div>
		</div>
<!-- END OF HEADER -->
<center>
<h2 style='font-family:courier'>Requests</h2>

<!-- Additional material...................................................................... -->
<%
if(a==1)
{	
%>
<br>
<h3 style='font-family:courier'>Additional material request</h3>
<br>

<select id='additional_material_dropdown'>
	<option value=-1 selected="selected">-All-</option>
<%
rs=stat.executeQuery("select user.userid,user_name from user,user_roles where user.userid=user_roles.userid and user_roles.role_id=2");
while(rs.next()){
%>
	<option value=<%=rs.getInt(1)%>><%=rs.getString(2)%></option>	
<%
}
%>
</select>
<button onclick='func1()'>refine</button>


<div id="additional-material-table">
<%
	

	rs=stat.executeQuery(" select additional_material_id,additional_material_description,additional_material_link,additional_material.userid,user.user_name,user.email from additional_material,user where activity=0 and additional_material.userid=user.userid");
    Integer i=0;
%>	
	<br><br>
	<table border=1 style='border-collapse:collapse;width:80%'>
		<tr style='background-color:#878383'>
			<td>description</td>
			<td>link</td>
			<td>user-name</td>
			<td>user-id</td>
			<td>email</td>
			<td>preview</td>
		</tr>
<%
	while(rs.next()){
	if(i%2==0){
%>
		<tr>
			<td><%=rs.getString("additional_material_description")%></td>
			<td><%=rs.getString("additional_material_link")%></td>
			<td><%=rs.getString("user.user_name")%></td>
			<td><%=rs.getString("additional_material.userid")%></td>
			<td><%=rs.getString("user.email")%></td>
			<!-- Trigger the modal with a button -->
			<td><button type="button" value='<%=rs.getString(1)%>+<%=rs.getString(3)%>' onclick='mdlbtn1(this.value)' class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal1">Review</button></td>
		</tr>
<% 	
	}
	else{
%>
		<tr style='background-color:#59b300'>
			<td><%=rs.getString("additional_material_description") %></td>
			<td><%=rs.getString("additional_material_link")%></td>
			<td><%=rs.getString("user.user_name")%></td>
			<td><%=rs.getString("additional_material.userid")%></td>
			<td><%=rs.getString("user.email")%></td>
			<!-- Trigger the modal with a button -->
			<td><button type="button" value='<%=rs.getString(1)%>+<%=rs.getString(3)%>' onclick='mdlbtn1(this.value)' class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal1">Review</button></td>
		</tr>
<% 		
	}
	i++;
	}
%>
</table>
<br>
</div>
<%
}
%>


<!-- Tutorial............................................................................ -->
<%
if(a==2)
{
%>
<br>
<h3 style='font-family:courier'>Tutorial request</h3>

<br>

<select id='tutorial_dropdown'>
	<option value=-1 selected="selected">-All-</option>
<%
rs=stat.executeQuery("select user.userid,user_name from user,user_roles where user.userid=user_roles.userid and user_roles.role_id=2");
while(rs.next()){
%>
	<option value=<%=rs.getInt(1)%>><%=rs.getString(2)%></option>	
<%
}
%>
</select>
<button onclick='func2()'>refine</button>


<div id="tutorial-table">
<%
	

	rs=stat.executeQuery(" select tutorial_id,tutorial_name,tutorial_link,tutorial_description,tutorial_additional_link,resources_id,tutorial.userid,user.user_name,user.email from tutorial,user where activity=0 and tutorial.userid=user.userid");
    Integer j=0;
%>	
	<br><br>
	<table border=1 style='border-collapse:collapse;width:80%'>
		<tr style='background-color:#878383'>
			<td>Name</td>
			<td>description</td>
			<td>link</td>
			<td>additional link</td>
			<td>user-name</td>
			<td>user-id</td>
			<td>email</td>
			<td>review</td>
		</tr>
<%
	while(rs.next()){
	if(j%2==0){
%>
		<tr>
			<td><%=rs.getString("tutorial_name")%></td>
			<td><%=rs.getString("tutorial_description")%></td>
			<td><%=rs.getString("tutorial_link")%></td>
			<td><%=rs.getString("tutorial_additional_link")%></td>
			<td><%=rs.getString("user.user_name")%></td>
			<td><%=rs.getString("tutorial.userid")%></td>
			<td><%=rs.getString("user.email")%></td>
			<!-- Trigger the modal with a button -->
			<td><button type="button" value='<%=rs.getString(1)%>+<%=rs.getString(3)%>' onclick='mdlbtn2(this.value)' class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal2">Review</button></td>
       </tr>
<% 	
	}
	else{
%>
		<tr style='background-color:#59b300'>
			<td><%=rs.getString("tutorial_name")%></td>
			<td><%=rs.getString("tutorial_description")%></td>
			<td><%=rs.getString("tutorial_link")%></td>
			<td><%=rs.getString("tutorial_additional_link")%></td>
			<td><%=rs.getString("user.user_name")%></td>
			<td><%=rs.getString("tutorial.userid")%></td>
			<td><%=rs.getString("user.email")%></td>
			<!-- Trigger the modal with a button -->
			<td><button type="button" value='<%=rs.getString(1)%>+<%=rs.getString(3)%>' onclick='mdlbtn2(this.value)' class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal2">Review</button></td>
        </tr>
<% 		
	}
	j++;
	}
%>
</table>
</div>
<%
}
%>

<!-- PhET............................................................................ -->
<%
if(a==3)
{	
%>

<br>
<h3 style='font-family:courier'>PhET request</h3>



<br>

<select id='phet_dropdown'>
	<option value=-1 selected="selected">-All-</option>
<%
rs=stat.executeQuery("select user.userid,user_name from user,user_roles where user.userid=user_roles.userid and user_roles.role_id=2");
while(rs.next()){
%>
	<option value=<%=rs.getInt(1)%>><%=rs.getString(2)%></option>	
<%
}
%>
</select>
<button onclick='func3()'>refine</button>




<div id="phet-table">
<%
	

	rs=stat.executeQuery(" select phet_id,phet_name,phet_link,resources_id,user.user_name,phet.userid,user.email from phet,user where activity=0 and phet.userid=user.userid");
    Integer k=0;
%>	
	<br><br>
	<table border=1 style='border-collapse:collapse;width:80%'>
		<tr style='background-color:#878383'>
			<td>Name</td>
			<td>link</td>
			<td>user-name</td>
			<td>user-id</td>
			<td>email</td>
			<td>review</td>
		</tr>
<%
	while(rs.next()){
	if(k%2==0){
%>
		<tr>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(5)%></td>
			<td><%=rs.getString(6)%></td>
			<td><%=rs.getString(7)%></td>
			<!-- Trigger the modal with a button -->
			<td><button type="button" value='<%=rs.getString(1)%>+<%=rs.getString(3)%>' onclick='mdlbtn3(this.value)' class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal3">Review</button></td>
       </tr>
<% 	
	}
	else{
%>
		<tr>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(5)%></td>
			<td><%=rs.getString(6)%></td>
			<td><%=rs.getString(7)%></td>
			<!-- Trigger the modal with a button -->
			<td><button type="button" value='<%=rs.getString(1)%>+<%=rs.getString(3)%>' onclick='mdlbtn3(this.value)' class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal3">Review</button></td>
       </tr><% 		
	}
	k++;
	}
%>
</table>
<br>
</div>
<%
}
%>


<!-- Mind map............................................................................ -->

<%
if(a==4)
{	
%>


<br>



<br>

<select id='mindmap_dropdown'>
	<option value=-1 selected="selected">-All-</option>
<%
rs=stat.executeQuery("select user.userid,user_name from user,user_roles where user.userid=user_roles.userid and user_roles.role_id=2");
while(rs.next()){
%>
	<option value=<%=rs.getInt(1)%>><%=rs.getString(2)%></option>	
<%
}
%>
</select>
<button onclick='func4()'>refine</button>




<h3 style='font-family:courier'>Mind map request</h3>
<div id="mm-table">
<%
	

	rs=stat.executeQuery(" select mindmap_id,mindmapcontent,description,resources_id,user.user_name,mindmap.userid,user.email from mindmap,user where activity=0 and mindmap.userid=user.userid");
    Integer l=0;
    Integer mmbtnval=0;
    String mmlnkval="";
%>	
	<br><br>
	<table border=1 style='border-collapse:collapse;width:80%'>
		<tr style='background-color:#878383'>
			<td>Description</td>
			<td>link</td>
			<td>user-name</td>
			<td>user-id</td>
			<td>email</td>
			<td>review</td>
		</tr>
<%
	while(rs.next()){
	if(l%2==0){
%>

		<tr>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(5)%></td>
			<td><%=rs.getString(6)%></td>
			<td><%=rs.getString(7)%></td>
			<!-- Trigger the modal with a button -->
			<td><button type="button" value='<%=rs.getString(1)%>+<%=rs.getString(2)%>' onclick='mdlbtn4(this.value)' class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal4">Review</button></td>
		</tr>			
<% 	
	}
	else{
%>
		<tr>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(5)%></td>
			<td><%=rs.getString(6)%></td>
			<td><%=rs.getString(7)%></td>
			<!-- Trigger the modal with a button -->
			<td><button type="button" value='<%=rs.getString(1)%>+<%=rs.getString(2)%>' onclick='mdlbtn4(this.value)' class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal4">Review</button></td>
       </tr>
<%		
	}
	l++;
}
%>
</table>
</div>
<br>
<%
}
%>

<!-- 1........................................................................... -->
<!-- modal content for additional material................................................................ -->
<!-- Modal -->
<div id="myModal1" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Additional Material</h4>
      </div>
      <div class="modal-body">
        <p>	
      
		<button id="prevw1" value="" onclick="prvwbtn1(this.value)">view</button>
		
		<button class="btn btn-success" id="reject1" value="" onclick="addit(this.value)" data-dismiss="modal">need improvement</button>
	
		<button class="btn btn-alert" id="accept1" value="" onclick="rejectit(this.value)" data-dismiss="modal">publish</button>
		
			
		</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
<!-- end of modal content for additional material................................................................... -->


<!-- 2........................................................................... -->
<!-- modal content for tutorial................................................................ -->
<!-- Modal -->
<div id="myModal2" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Tutorials</h4>
      </div>
      <div class="modal-body">
        <p>	
      
		<button id="prevw2" value="" onclick="prvwbtn2(this.value)">veiw</button>
		
		<button class="btn btn-success" id="reject2" value="" onclick="tutorialReject(this.value)" data-dismiss="modal">need improvement</button>
		<button class="btn btn-alert" id="accept2" value="" onclick="tutorialAccept(this.value)" data-dismiss="modal">publish</button>
		
			
		</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
<!-- end of modal content for tutorial................................................................... -->




<!-- 3........................................................................... -->
<!-- modal content for PhET................................................................ -->
<!-- Modal -->
<div id="myModal3" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">PhET</h4>
      </div>
      <div class="modal-body">
        <p>	
      
		<button id="prevw3" value="" onclick="prvwbtn3(this.value)">veiw</button>
		
		<button class="btn btn-success" id="reject3" value="" onclick="phetReject(this.value)" data-dismiss="modal">need improvement</button>
		<button class="btn btn-alert" id="accept3" value="" onclick="phetAccept(this.value)" data-dismiss="modal">publish</button>
		
			
		</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
<!-- end of modal content for phet................................................................... -->





<!-- 4........................................................................... -->
<!-- modal content for mindmap................................................................ -->
<!-- Modal -->
<div id="myModal4" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Concept map/Mind map</h4>
      </div>
      <div class="modal-body">
        <p>	
      
		<button id="prevw4" value="" onclick="prvwbtn4(this.value)">veiw</button>
		
		<button class="btn btn-success" id="reject4" value="" onclick="mmReject(this.value)" data-dismiss="modal">need improvement</button>
		<button class="btn btn-alert" id="accept4" value="" onclick="mmAccept(this.value)" data-dismiss="modal">publish</button>
		
			
		</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
<!-- end of modal content for mindmap................................................................... -->


</body>

<!-- script for additional material -->

<script>
function mdlbtn1(val){
	
	document.getElementById("accept1").disabled = true;
	document.getElementById("reject1").disabled = true;
	
	var temp_string_1=val;
	var temp_string_2=val;
	
	//alert(temp_string_1);
	
	var n = val.indexOf("+");
	
	
	var str1=val.substring(0, n);
	var str2=temp_string_1.substring((n+1));
	
	//alert(str1);
	//alert(str2);
	
	document.getElementById('accept1').value= str1;
	document.getElementById('reject1').value= str1;
	
if(temp_string_2.lastIndexOf(".txt")>0 || temp_string_2.lastIndexOf(".pdf")>0){	
	document.getElementById('prevw1').value = "./../../static/resource/1/"+str2;
}
else
	document.getElementById('prevw1').value = "http://"+str2;
}
function prvwbtn1(prvwurl){
	document.getElementById("accept1").disabled = false;
	document.getElementById("reject1").disabled = false;
	window.open(prvwurl,'_blank');
}
</script>

<!-- end of script for additional material -->


<!-- script for tutorial -->
<script>
function mdlbtn2(val){
	
	document.getElementById("accept2").disabled = true;
	document.getElementById("reject2").disabled = true;
	
	var temp_str=val;
	var n = val.indexOf("+");
	
	var str1=val.substring(0, n);
	var str2=temp_str.substring((n+1));
	
	document.getElementById('accept2').value=str1;
	document.getElementById('reject2').value=str1;
	
	document.getElementById('prevw2').value=str2;

}
function prvwbtn2(prvwurl){
	document.getElementById("accept2").disabled = false;
	document.getElementById("reject2").disabled = false;
	window.open(prvwurl,'_blank');
}
</script>
<!-- end of script for tutorial -->



<!-- script for phet -->
<script>
function mdlbtn3(val){
	
	document.getElementById("accept3").disabled = true;
	document.getElementById("reject3").disabled = true;
	
	var temp_str=val;
	var n = val.indexOf("+");
	
	var str1=val.substring(0, n);
	var str2=temp_str.substring((n+1));
	
	document.getElementById('accept3').value=str1;
	document.getElementById('reject3').value=str1;
	
	document.getElementById('prevw3').value=str2;

}
function prvwbtn3(prvwurl){
	document.getElementById("accept3").disabled = false;
	document.getElementById("reject3").disabled = false;
	window.open(prvwurl,'_blank');
}
</script>
<!-- end of script for phet -->


<!-- script for mind map -->
<script>
function mdlbtn4(val){
	
	document.getElementById("accept4").disabled = true;
	document.getElementById("reject4").disabled = true;
	
	var temp_str=val;
	var n = val.indexOf("+");
	var dotIndex = val.indexOf(".");
	var len=val.length;
	
	
	var str1=val.substring(0, n);
	var str2=temp_str.substring((n+1),dotIndex);
	
	document.getElementById('accept4').value= str1;
	document.getElementById('reject4').value= str1;
	
	document.getElementById('prevw4').value = "./../../static/resource/4/"+ str2 +"/index.html";

}
function prvwbtn4(prvwurl){
	document.getElementById("accept4").disabled = false;
	document.getElementById("reject4").disabled = false;
	window.open(prvwurl,'_blank');
}
</script>
<!-- end of script for mind map -->