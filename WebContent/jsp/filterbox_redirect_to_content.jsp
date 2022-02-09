<%@ include file="connection.jsp"%>

<head>

<title>Content</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0"> 

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>

/* Start of side bar navigation. */

#mySidenav a {
    position: fixed;
    z-index: 1;
    left: -104px;
    transition: 0.3s;
    padding: 15px;
    width: 150px;
    text-decoration: none;
    font-size: 20px;
    color: white;
    border-radius: 0 5px 5px 0;
    opacity:0.5;
}

#mySidenav a:hover {
    left: 0;
}

#additionalMaterial {
    background-color: #4CAF50;
}

#tutorial {
    background-color: #2196F3;
}

#phet {
    background-color: #f44336;
}

#mindMap {
    background-color: #555
}

/* End of side bar decoration */

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

/*list margin*/
li{
margin:10px 0;
}
/*end of list margin*/

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




/*tutorial video when view port become less than 786px*/


#tutorialcntr{
left-margin:80px;
}

.tcntr video,iframe{
	width:250px;
}


@media screen and (max-width:786px){
.tcntr video,iframe{
	width:100px;
}
#tutorialcntr{
	left-margin:20px;
	right-margin:10px;
}
}

.thumbnail{
  transition: transform .2s;
}

.thumbnail:hover{
    -ms-transform: scale(0.8); /* IE 9 */
    -webkit-transform: scale(0.8); /* Safari 3-8 */
     transform: scale(0.8);
}
/*end of tutorial styling*/

</style>




<script>
function takeToUserHome(){
	window.location.href="user-home.jsp";
}
</script>

</head>



<!-- HEADER -->
		<div class="header-box" style="padding:0px">
			<div class="header-text" style="width:100%">
  				<h1 onclick='takeToUserHome()' style="font-size:5vw">School Resource System</h1>
  				<button class="btn" onclick="window.location.href='user-home.jsp'"><i class="fa fa-home"></i></button>
			</div>
		</div>
<!-- END OF HEADER -->






<%
Integer k=0,v1=0,v2=0,v3=0,v4=0,rsid1=0,rsid2=0,rsid3=0,rsid4=0;
String val=request.getParameter("val");
rs=stat.executeQuery("SELECT resources_type_id,topic_id from resources where resources_id='" + val + "' ");


String resourceType="";
Integer topicId=0;

if(rs.next()){
	resourceType=rs.getString("resources_type_id");
	topicId=rs.getInt("topic_id");
}	

//for selecting all the resources
rs=stat.executeQuery("select resources_id from resources where topic_id="+ topicId +" and resources_type_id=1 ");
		if(rs.next()){
			rsid1=rs.getInt("resources_id");
		}
rs=stat.executeQuery("select resources_id from resources  where topic_id="+ topicId +" and resources_type_id=2 ");
		if(rs.next()){
			rsid2=rs.getInt("resources_id");
		}
rs=stat.executeQuery("select resources_id from resources  where topic_id="+ topicId +" and resources_type_id=3 ");
		if(rs.next()){
			rsid3=rs.getInt("resources_id");
		}
rs=stat.executeQuery("select resources_id from resources  where topic_id="+ topicId +" and resources_type_id=4 ");
		if(rs.next()){
			rsid4=rs.getInt("resources_id");
		}
//fill v1,v2,v3,v4 with appropriate value of resources id.
rs=stat.executeQuery("select * from additional_material where resources_id="+ rsid1 +" and activity=1");
if(rs.next()){
	v1=rsid1;
}
rs=stat.executeQuery("select * from tutorial where resources_id="+ rsid2 +" and activity=1 ");
if(rs.next()){
	v2=rsid2;
}
rs=stat.executeQuery("select * from phet where resources_id="+ rsid3 +" and activity=1 ");
if(rs.next()){
	v3=rsid3;
}
rs=stat.executeQuery("select * from mindmap where resources_id="+ rsid4 +" and activity=1 ");
if(rs.next()){
	v4=rsid4;
}
//end of all selecting	


//display the path NOTE: P suffix in each variable stands for path......................................  
Integer topicIdP=0,flagTP=0,subjectIdP=0,flagSP=0;
String topicNameP="",subjectNameP="",gradeNameP="";		
//select the topic name and topic i.
	rs=stat.executeQuery("select resources.topic_id,topics.topic_name from resources,topics where resources_id="+ val +" and resources.topic_id=topics.topic_id");
	if(rs.next()){
		flagTP=1;
		topicNameP=rs.getString(2);
		topicIdP=rs.getInt(1);
	}
	if(flagTP==1){
		rs=stat.executeQuery("select topics.subject_id,subject.subject_name from topics,subject where topic_id="+ topicIdP +" and topics.subject_id=subject.subject_id");
		if(rs.next()){
			flagSP=1;
			subjectIdP=rs.getInt(1);
			subjectNameP=rs.getString(2);
		}
	}
	if(flagSP==1){
		rs=stat.executeQuery("select grade.grade_name from subject,grade where subject_id="+ subjectIdP +" and subject.grade_id=grade.grade_id");
		if(rs.next()){
			gradeNameP=rs.getString(1);
		}		
	}
//end of display path.....................................................................................	

		







//Additional resources..............................................................................................................

if(resourceType.equals("1")){
	rs=stat.executeQuery("SELECT additional_material_description ,additional_material_link  from additional_material  where resources_id='" + val + "' and activity=1");
	
%>
<!-- start of change resources -->
<div id="mySidenav" class="sidenav">
	
<%
if(v2!=0){
%>
	<a href="filterbox_redirect_to_content.jsp?val=<%=v2%>" id="tutorial" style="top:180px">tutorial</a>
<%
}
%>

<%
if(v3!=0){
%>
<a href="filterbox_redirect_to_content.jsp?val=<%=v3%>" id="phet" style="top:240px">PhET</a>
<%
}
%>

<%
if(v4!=0){
%>
<a href="filterbox_redirect_to_content.jsp?val=<%=v4%>" id="mindMap" style="top:300px">Mind map</a>
<%
}
%>

</div>

<!-- end of change resources -->

<!-- Start of content -->
<div style="margin-left:20%px;">
	<p style='font-family:courier'><%=gradeNameP%>/ <%=subjectNameP%>/ <%=topicNameP%>/</p><h3 style='font-family:courier;font-weight:bold'> Additional material</h3>
<div class="cntr3" style='width:100%;padding:20px 20px'>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2">
				<p>&nbsp;</p>
			</div>
		
			<div class="col-xs-12 col-sm-12 col-md-8 col-lg-8" style='border: 4px solid #6a91b7;border-radius:10px;background-color:#edeeef;top:10px;box-shadow: 0 8px 16px 0 rgba(0,0,0,1.5);padding-top:5px;padding-right:20px;padding-bottom:20px;text-align:center;'>
					

	<table  style='border-collapse:collapse;width:67.66%'>
		<tr>
			<th><p style='font-family:courier;font-size:16px'>DESCRIPTION</p></th>
			<th><p style='font-family:courier;font-size:16px'>link</p></th>
		</tr>	
<% 
	String addstr="";
	String addlnk="";
	String str="";
	Integer c1=0;
	Integer length=0;
	Integer startIndex=0;
	while(rs.next()){
		k=1;
		addstr=rs.getString("additional_material_description");
		addlnk=rs.getString("additional_material_link");
		length=addlnk.length();
		startIndex=length-3;
		str=addlnk.substring(startIndex);
		if(str.equalsIgnoreCase("txt") || str.equalsIgnoreCase("pdf")){
	%>
	<tr bgcolor=#aaaaaa>
		<td height="50"><%=addstr%></td>
		<td height="50"><a href="download.jsp?flnm=<%=addlnk%>" target='_blank'><span class="glyphicon glyphicon-file"></span> .pdf/.txt file</a></td>
	</tr>
	<%
	}
		else{
			
	%>
	<tr>
		<td height="50"><%=addstr%></td>
		
		<!-- No need of writing https:// in database. -->
		<td height="50"><a href="https://<%=addlnk%>" target='_blank'><span class="glyphicon glyphicon-tag"></span> reference URL</a></td>
	</tr>
	<% 	
	}
		++c1;
}
	%>
	</table>
<% 	
}
%>
</div>

		<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2">
			<p>&nbsp;</p>
		</div>
				

</div>
</div>
</div>

<!-- end of content -->

<!-- END OF Additional links  Start of tutorials-->




<!-- Tutorials...................................................................................................................... -->


<% 
if(resourceType.equals("2")){

%>
<!-- start of change resources -->

<div id="mySidenav" class="sidenav">
<%
if(v1!=0){
%>
<a href="filterbox_redirect_to_content.jsp?val=<%=v1%>" id="additionalMaterial" style="top:180px">links</a>
<%
}
%>

<%
if(v3!=0){
%>
<a href="filterbox_redirect_to_content.jsp?val=<%=v3%>" id="phet" style="top:240px">PhET</a>
<%
}
%>

<%
if(v4!=0){
%>
<a href="filterbox_redirect_to_content.jsp?val=<%=v4%>" id="mindMap" style="top:300px">Mind map</a>
<%
}
%>
</div>
<!-- end of change resources -->
<!-- Start of content -->
<div id='tutorialcntr'>



	<p style='font-family:courier'><%=gradeNameP%>/ <%=subjectNameP%>/ <%=topicNameP%>/</p><h2 style='font-family:courier;font-weight:bold;padding-left:80px'> Tutorials</h2>
		<div class="container">
			<div class="row">
<% 	
	
	
	rs=stat.executeQuery("SELECT tutorial_name ,tutorial_link,tutorial_description,tutorial_additional_link  from tutorial  where resources_id='" + val + "' and activity=1 ");

	String tnm="";
	String tlnk="";
	String tdsc="";
	String taddlnk="";
	Integer c2=0;
while(rs.next()){
		k=1;
		tnm=rs.getString("tutorial_name");
		tlnk=rs.getString("tutorial_link");
		tdsc=rs.getString("tutorial_description");
		taddlnk=rs.getString("tutorial_additional_link");
		
if(c2%2==0){
%>
<div class='tcntr'>

<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4" style='border: 4px solid #6a91b7;border-radius:10px;top:10px;left:10px;right:10px;bottom:10px;background-color:#edeeef;box-shadow: 0 8px 16px 0 rgba(0,0,0,1.5);padding-bottom:5px;padding-top:5px;text-align:center;'>	
  <div class="thumbnail">	
	<div style='width:100%;'>
		<ul style='list-style-type: none'>
			<li>
				<h4 style='font-family:courier;font-weight:bold'><%=tnm%></h4>
			</li>

<!-- contain youtube video................................................... -->
<%
if(tlnk.contains("www.youtube.com/embed")){
%>
			<li>
				<iframe height="150" src="<%=tlnk%>" ></iframe>
			</li>
<%
}
%>
<!-- contain ogg or mp4 video.......................................................... -->
<% 
if(!tlnk.contains("www.youtube.com/embed")){
%>	
			<li>
				<p style='font-size:1100%'><a href="<%=tlnk%>" target="_blank"><span class="glyphicon glyphicon-film"></span></a></p>
				<!--  youtube video cannot be played with video tag and all the videos of tutorial are of.ogv format				
				<iframe width="200" height="150" src="<%=tlnk%>" ></iframe>
-->			
			</li>
<%
}
%>	

			
			<li>
				<p><%=tdsc%></p>
			</li>
			<li>
				<a href="<%=taddlnk%>">you can visit</a>	
			</li>
		</ul>
	</div>
 </div>	
</div>	
	<%
}


if(c2%2!=0){
	%>		
<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4" style='border: 4px solid #d65f4a;border-radius:10px;top:10px;left:10px;right:10px;bottom:10px;background-color:#edeeef;top:10px;box-shadow: 0 8px 16px 0 rgba(0,0,0,1.5);padding-top:5px;padding-bottom:5px;text-align:center;'>			
  <div class="thumbnail">	
	<div style='width:100%'>
		<ul style='list-style-type: none'>
			<li>
				<h4 style='font-family:courier;font-weight:bold'><%=tnm%></h4>
			</li>
			


<!-- contain youtube video................................................... -->
<%
if(tlnk.contains("www.youtube.com/embed")){
%>
			<li>
				<iframe height="150" src="<%=tlnk%>" ></iframe>
			</li>
<%
}
%>

<!-- contain ogg or mp4 video.......................................................... -->
<% 
if(!tlnk.contains("www.youtube.com/embed")){
%>	
			<li>
				<p style='font-size:1100%'><a href="<%=tlnk%>" target="_blank"><span class="glyphicon glyphicon-film"></span></a></p>
<!--  youtube video cannot be played with video tag and all the videos of tutorial are of.ogv format				
				<iframe width="200" height="150" src="<%=tlnk%>" ></iframe>
-->			</li>
<%
}
%>	
			<li>
				<p><%=tdsc%></p>
			</li>
			<li>
				<a href="<%=taddlnk%>">you can visit</a>	
			</li>
		</ul>
	</div>
 </div>
</div>		

	<% 	
}

++c2;

}	
}

%>
		</div>
	</div>
</div>
</div>	
<!-- end of content -->
<!-- END OF tutorial   Start of mind map-->





<!-- PhET.......................................................................................................................... -->




<% 
if(resourceType.equals("3")){
%>


<!-- start of change resources -->

<div id="mySidenav" class="sidenav">
<%
if(v1!=0){
%>
<a href="filterbox_redirect_to_content.jsp?val=<%=v1%>" id="additionalMaterial" style="top:180px">links</a>
<%
}
%>

<%
if(v2!=0){
%>
<a href="filterbox_redirect_to_content.jsp?val=<%=v2%>" id="tutorial" style="top:240px">Tutorial</a>
<%
}
%>

<%
if(v4!=0){
%>
<a href="filterbox_redirect_to_content.jsp?val=<%=v4%>" id="tutorial" style="top:300px">mindMap</a>
<%
}
%>
</div>
<!-- end of change resources -->

<!-- startof content -->
<div style="margin-left:80px;">
<% 	
	
	rs=stat.executeQuery("SELECT phet_name ,phet_link  from phet  where resources_id='" + val + "' and activity=1 ");

	String phtnm="";
	String phtlk="";
	Integer c3=0;
%>
	<p style='font-family:courier'><%=gradeNameP%>/ <%=subjectNameP%>/ <%=topicNameP%>/</p><h2 style='font-family:courier'> PhET content</h2>
<%	
	while(rs.next()){
		k=1;
		phtnm=rs.getString("phet_name");
		phtlk=rs.getString("phet_link");		
					
	if(c3%2==0){
	%>
	<div style='width:90%;background-color:#d6d6c2;border-radius:10px;top:10px;box-shadow: 0 2px 4px 0 rgba(0,0,0,0.4);text-align:center'>
	<ul style='list-style-type: none'>
	<li>
		<a href="<%=phtlk%>" style='font-family:courier;font-size:12px;font-color:red' target="_blank"><b>Hyperlink: </b>Hyperlink to PhET simulation</a>
	</li>
	<li>
		<p style='font-family:courier;font-size:14px'><b>Description: </b><%=phtnm%></p>
	</li>
</ul>
</div>
		
	<%
	}
	else{
	%>		
	<div style='width:90%;text-align:center;top:10px;border:2px solid #d65f4a;border-radius:10px'>
		<ul style='list-style-type: none'>
			<li>
				<a href="<%=phtlk%>" style='font-family:courier;font-size:12px;font-color:red' target="_blank"><b>Hyperlink: </b>Hyperlink to PhET simulation.</a>
			</li>
			<li>
				<p style='font-family:courier;font-size:14px'> <b>Description: </b><%=phtnm%></p>
			</li>
		</ul>
	</div>
			<% 	
	}
		++c3;
}
	%>
	
<% 	
}
%>

</div>
<!-- end of content -->


<!-- END OF p h e t start of mind map  -->

<!-- Mind map.......................................................................................................................... -->

<% 
if(resourceType.equals("4")){


%>
<!-- start of change resources -->

<div id="mySidenav" class="sidenav">
<%
if(v1!=0){
%>
<a href="filterbox_redirect_to_content.jsp?val=<%=v1%>" id="additionalMaterial" style="top:180px">links</a>
<%
}
%>

<%
if(v2!=0){
%>
<a href="filterbox_redirect_to_content.jsp?val=<%=v2%>" id="tutorial" style="top:240px">Tutorial</a>
<% 
}
%>

<%
if(v3!=0){
%>
<a href="filterbox_redirect_to_content.jsp?val=<%=v3%>" id="phet" style="top:300px">PhET</a>
<%
}
%>
</div>
<!-- end of change resources -->
<!-- Start of content -->
<div style="margin-left:80px;">
<p style='font-family:courier'><%=gradeNameP%>/ <%=subjectNameP%>/ <%=topicNameP%>/</p><h2 style='font-family:courier'> Mind map content</h2>
<%	
	
	rs=stat.executeQuery("SELECT description ,mindmapcontent  from mindmap  where resources_id='" + val + "' and activity=1 ");

	String desc="";
	String cnt="";
	Integer c4=0;
	Integer indexOfDot = 0;
	while(rs.next()){
		k=1;
		
		
		desc=rs.getString("description");
		cnt=rs.getString("mindmapcontent");		
		indexOfDot=cnt.indexOf(".zip");
		cnt=cnt.substring(0, indexOfDot);
				
	if(c4%2==0){
	%>
	<div style='width:90%;background-color:#d6d6c2;border-radius:10px;top:10px;box-shadow: 0 2px 4px 0 rgba(0,0,0,0.4);text-align:center'>
	<ul style='list-style-type: none'>
	<li>
		<a href="./../static/resource/4/<%=cnt%>/index.html">Check the mind map.</a>
	</li>
	<li>
		<p style='font-family:courier;font-size:14px'><b>Description: </b><%=desc%></p>
	</li>
</ul>
</div>
		
	<%
	}
		else{
	%>	
	<div style='width:90%;text-align:center;top:10px;border:2px solid #d65f4a;border-radius:10px'>
		<ul style='list-style-type: none'>
			<li>
				<a href="./../static/resource/4/<%=cnt%>/index.html">Check the mind map.</a>
			</li>
			<li>
				<p style='font-family:courier;font-size:14px'><b>Description: </b><%=desc%></p>
			</li>
		</ul>
	</div>	

	<% 	
	}
		++c4;
}
	%>
	
<% 	
}
%>
</div>
<!-- End of content -->

<!-- END OF mind map  -->

<%

if(k==0){
%>
<p style='color:red'>Invalid input or resource not available. Please try again!!</p>	
<head>
<meta http-equiv=refresh content="5;URL=user-home.jsp?abc=inv" />
</head>
<%
}
%>

























