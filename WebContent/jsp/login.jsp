<%@ include file="connection.jsp"%>
<html>
<p>&nbsp;
<p>&nbsp;
<center>
<%
String s=request.getParameter("abc");
if(s!=null)
{
	if(s.equals("inv"))
	{
		out.println("<font color=red> Invalid login info !! </font> ");
		s="";
	}
}

%>
<form method=post action=./../user_login_verification>	 		

<table border=1 align=center width=50% bordercolor=#000055 style='border-collapse:collapse'>
<tr>
<th bgcolor=#000055 > <font color=white> Login Form
<tr>
<td bgcolor=#aaaaaa >&nbsp;
<tr>
<td>
<table border=0 align=center width=68% >
<tr>
<td>&nbsp;
<tr>
<td > User name : 
<td > <input type=text name=u_nm required>
<tr>
<td > Password : 
<td > <input type=password name=pass required>
<tr>
<td> <a href=user-reset-password-form.jsp>forgot-password?</a>
<tr>
<td>&nbsp;
<tr>
<td align=center colspan=2> <input type=submit value=' Login '>
<tr>
<td>&nbsp;
</table>
</table>
<p><a href=./../index.jsp>HOME</a>
</p>
<p>
&copy; School-resource-system - 2018
</p>
</form>


</html>