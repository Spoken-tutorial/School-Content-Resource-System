<%@include file = "connection.jsp"%>
<head>
<title>display request</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0"> 

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
      

<script>
function takeToUserHome(){
	window.location="user-home.jsp";
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
td, th{
height:40px;
}

</style>

</head>

<body>

<%   Integer uid=(Integer) session.getAttribute("uid"); %>

<!-- HEADER -->
		<div class="header-box" style="padding:0px">
			<div class="header-text" style="width:100%">
  				<h1 style="font-size:5vw" onclick='takeToUserHome()'>School Resource System</h1>
  				<button class="btn" onclick="window.location.href='user-home.jsp'"><i class="fa fa-home"></i></button>
			</div>
		</div>
<!-- END OF HEADER -->
<center>
<h2 style='font-family:courier'>Accepted resources</h2>

<!-- Additional material...................................................................... -->

<br>
<h3 style='font-family:courier'>Additional material</h3>
<%
	
 	rs=stat.executeQuery(" select additional_material_description,topics.topic_name from additional_material,topics,resources where additional_material.userid="+uid+"  and activity=1 and additional_material.resources_id=resources.resources_id and resources.topic_id=topics.topic_id;");
    Integer i=0;
%>	
	<br><br>
	<table  border=1 style='border-collapse:collapse;width:80%'>
		<tr style='background-color:#878383'>
			<th style='font-family:courier;text-align:center'>Description</th>
			<th style='font-family:courier;text-align:center'>Topic Name</th>
		</tr>
<%
	while(rs.next()){
	if(i%2==0){
%>
		<tr>
			<td style='text-align:center;font-family:courier'><%=rs.getString(1)%></td>
			<td style='text-align:center;font-family:courier'><%=rs.getString(2)%></td>
		</tr>
<% 	
	}
	else{
%>
		<tr style='background-color:#59b300'>
			<td style='text-align:center;font-family:courier'><%=rs.getString(1) %></td>
			<td style='text-align:center;font-family:courier'><%=rs.getString(2)%></td>
		</tr>	
<% 		
	}
	i++;
	}
%>
</table>


<!--  tutorial...................................................................... -->

<br>
<h3 style='font-family:courier'>Tutorial</h3>
<%
	
 
	rs=stat.executeQuery(" select tutorial_name,topics.topic_name from tutorial,topics,resources where tutorial.userid="+ uid +"  and activity=1 and tutorial.resources_id=resources.resources_id and resources.topic_id=topics.topic_id ");
    Integer j=0;
%>	
	<br><br>
	<table border=1 style='border-collapse:collapse;width:80%'>
		<tr style='background-color:#878383'>
			<th style='font-family:courier;text-align:center'>Description</th>
			<th style='font-family:courier;text-align:center'>Topic Name</th>
		</tr>
<%
	while(rs.next()){
	if(j%2==0){
%>
		<tr>
			<td style='text-align:center;font-family:courier'><%=rs.getString(1)%></td>
			<td style='text-align:center;font-family:courier'><%=rs.getString(2)%></td>
		</tr>
<% 	
	}
	else{
%>
		<tr style='background-color:#59b300'>
			<td style='text-align:center;font-family:courier'><%=rs.getString(1) %></td>
			<td style='text-align:center;font-family:courier'><%=rs.getString(2)%></td>
		</tr>	
<% 		
	}
	j++;
	}
%>
</table>



<!--  PhET...................................................................... -->

<br>
<h3 style='font-family:courier'>PhET</h3>
<%
	
 
	rs=stat.executeQuery(" select phet_name,topics.topic_name from phet,topics,resources where phet.userid="+ uid +"  and activity=1 and phet.resources_id=resources.resources_id and resources.topic_id=topics.topic_id");
    Integer k=0;
%>	
	<br><br>
	<table  border=1 style='border-collapse:collapse;width:80%'>
		<tr style='background-color:#878383'>
			<th style='font-family:courier;text-align:center'>Description</th>
			<th style='font-family:courier;text-align:center'>Topic Name</th>
		</tr>
<%
	while(rs.next()){
	if(k%2==0){
%>
		<tr>
			<td style='text-align:center;font-family:courier'><%=rs.getString(1)%></td>
			<td style='text-align:center;font-family:courier'><%=rs.getString(2)%></td>
		</tr>
<% 	
	}
	else{
%>
		<tr style='background-color:#59b300'>
			<td style='text-align:center;font-family:courier'><%=rs.getString(1) %></td>
			<td style='text-align:center;font-family:courier'><%=rs.getString(2)%></td>
		</tr>	
<% 		
	}
	k++;
	}
%>
</table>



<!--  mind map...................................................................... -->

<br>
<h3 style='font-family:courier'>Mind map</h3>
<%
	
 
	rs=stat.executeQuery(" select description,topics.topic_name from mindmap,topics,resources where mindmap.userid="+ uid +"  and activity=1 and mindmap.resources_id=resources.resources_id and resources.topic_id=topics.topic_id");
    Integer l=0;
%>	
	<br><br>
	<table border=1 style='border-collapse:collapse;width:80%'>
		<tr style='background-color:#878383'>
			<th style='font-family:courier;text-align:center'>Description</th>
			<th style='font-family:courier;text-align:center'>Topic name</th>
		</tr>
<%
	while(rs.next()){
	if(l%2==0){
%>
		<tr>
			<td style='text-align:center;font-family:courier'><%=rs.getString(1)%></td>
			<td style='text-align:center;font-family:courier'><%=rs.getString(2)%></td>
		</tr>
<% 	
	}
	else{
%>
		<tr style='background-color:#59b300'>
			<td style='text-align:center;font-family:courier'><%=rs.getString(1) %></td>
			<td style='text-align:center;font-family:courier'><%=rs.getString(2)%></td>
		</tr>	
<% 		
	}
	l++;
	}
%>
</table>
<br>
<br>


      