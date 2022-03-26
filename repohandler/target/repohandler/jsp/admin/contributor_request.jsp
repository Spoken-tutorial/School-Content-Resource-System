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
	window.location="./../../index.jsp";
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

</style>      


<script language="javascript" type="text/javascript">  
var xmlHttp  
var xmlHttp
function addit(val){
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
var url="contributor_accept.jsp";
url +="?count=" +val;
xmlHttp.onreadystatechange = addcontributor;
xmlHttp.open("GET", url, true);
xmlHttp.send(null);
}

function addcontributor(){ 
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
document.getElementById("request_table").innerHTML=xmlHttp.responseText   
}   
}


</script>


<script language="javascript" type="text/javascript">  
var xmlHttp  
var xmlHttp
function rejectit(val){
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
var url="contributor_reject.jsp";
url +="?count=" +val;
xmlHttp.onreadystatechange = subcontributor;
xmlHttp.open("GET", url, true);
xmlHttp.send(null);
}

function subcontributor(){ 
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
document.getElementById("request_table").innerHTML=xmlHttp.responseText   
}   
}


</script>

<style>
td{
font-family:courier;
}
</style>

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
<center>
<h2 style='font-family:courier'>Requests to become contributor</h2>
<br>
<h3 style='font-family:courier'>Contributor request</h3>
<div id="request_table">
<%
	rs=stat.executeQuery(" select user.userid,user_name,email,phone from user,contributor_request where contributor_request.userid=user.userid;");
    Integer i=0;
%>	
	<br><br>
	<table border=1 style='border-collapse:collapse;width:80%'>
		<tr style='background-color:#878383'>
			<td>user-id</td>
			<td>user-name</td>
			<td>email</td>
			<td>phone</td>
			<td>accept</td>
			<td>reject</td>
		</tr>
<%
	while(rs.next()){
	if(i%2==0){
%>
		<tr>
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(4)%></td>
			<td><button value=<%=rs.getInt(1)%> onclick="addit(this.value);" >accept</button></td>
			<td><button value=<%=rs.getInt(1)%> onclick="rejectit(this.value);" >reject</button></td>
		</tr>
<% 	
	}
	else{
%>
		<tr style='background-color:#59b300'>
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(4)%></td>
			<td><button value=<%=rs.getInt(1)%> onclick="addit(this.value);" >accept</button></td>
			<td><button value=<%=rs.getInt(1)%> onclick="rejectit(this.value);">reject</button></td>
		</tr>
<% 		
	}
	i++;
	}
%>
</table>
</div>
</body>
