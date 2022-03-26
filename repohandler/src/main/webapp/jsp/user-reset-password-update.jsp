<%@ include file="connection.jsp"%>
<%@ page import="java.security.MessageDigest"%>

<%
String password=request.getParameter("new-pass");
String usid=request.getParameter("uid");
Integer uid=Integer.parseInt(usid);


byte[] unencodedPassword = password.getBytes();
MessageDigest msdg = null;
try {
msdg = MessageDigest.getInstance("MD5");
} catch (Exception e) {}
msdg.reset();
msdg.update(unencodedPassword);
byte[] encodedPassword = msdg.digest();
StringBuffer buf = new StringBuffer();
for (int i = 0; i < encodedPassword.length; i++) {
if (((int) encodedPassword[i] & 0xff) < 0x10) {
buf.append("0");
}
buf.append(Long.toString((int) encodedPassword[i] & 0xff, 16));
}
String pass=buf.toString(); 


String qry="UPDATE user set password='" + pass + "' where userid="+uid+" ";
stat.executeUpdate(qry);
out.println("Updated successfully...");

try {
	con.close();
} catch (SQLException e) {
	
	e.printStackTrace();
}
%>
<meta http-equiv=refresh content="2;URL=user-home.jsp" />
</head>
