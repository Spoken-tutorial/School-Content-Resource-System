<%@include file="connection.jsp"%>
<head>
<title>Edit profile</title>
</head>


<%
Integer uid= (Integer) session.getAttribute("uid"); 
//Integer id=Integer.parseInt(uid);Not required......
rs=stat.executeQuery("Select * from user where userid = " + uid + " ");
String s1="";
String s2="";
String s3="";
String s4="";

if(rs.next())
{
	s1=rs.getString("first_name");
    s2=rs.getString("last_name");
	s3=rs.getString("email");
    s4=rs.getString("user_name");
    
 //   session.setAttribute("uid",uid);
 //   response.sendRedirect("user-edit-profile-update.jsp");
}

else{
	response.setHeader("Pragma","no-cache");
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Expires","0");
	response.setDateHeader("Expires",-1); 
	session.invalidate();
	out.println("<head><meta http-equiv=refresh content='0;URL=./../index.jsp'/><head/>");
}

Integer opt=0;
rs=stat.executeQuery("select role_id from user_roles where userid="+ uid +" ");
if(rs.next()){
	opt=rs.getInt(1);
}
if(opt==1){
%>
<a href=contributor_form.jsp>Become a contributor</a>
<%
}
%>




<form method=post action="user-edit-profile-update.jsp" >	 		

<table border=1 align=center width=50% bordercolor=#000055 style='border-collapse:collapse'>
<tr>
<th bgcolor=#000055 > <font color=white> Edit profile
<tr>
<td bgcolor=#aaaaaa >&nbsp;
<tr>
<td>
<table border=0 align=center width=68% >
<tr>
<td>&nbsp;
<tr>
<td > first name : 
<td > <input type=text name=fnm pattern='[A-Za-z\\s]*'  value=<%=s1%> required >
<tr>
<td > last name : 
<td > <input type=text name=lnm pattern='[A-Za-z\\s]*' value=<%=s2%> required >
<tr>
<td > email : 
<td > <input type=email name=email value=<%=s3%> required >
<tr>
<td > user name : 
<td > <input type=text name=unm value=<%=s4%> required >
<tr>
<td>edit:
<td><input type=submit value=confirm-edit>


<tr>
<td>&nbsp;
<tr>
<td>&nbsp;
</table>
</table>
 
<p><a href=user-home.jsp>HOME</a>
</p>
<p>
&copy; School-resource-system - 2018
</p>
</form>
