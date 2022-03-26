package repohandler;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import java.security.MessageDigest;
import java.sql.*;
//import java.lang.*;





public class UserLoginVerification extends HttpServlet
{


	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	PrintWriter pw;
	public void doGet(HttpServletRequest rq, HttpServletResponse res) throws IOException, ServletException
	{
	try
	{
		Connection con;
		Statement stat;
		ResultSet rs;
	

		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/SCHOOL", "root", "mysql");
		stat=con.createStatement();	

		res.setContentType("text/html");
		pw=res.getWriter();
		HttpSession session=rq.getSession();  

		
		String u_nm=rq.getParameter("u_nm");
		String pass=rq.getParameter("pass");
		
		byte[] unencodedPassword = pass.getBytes();
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
		String psw=buf.toString(); 
		session=rq.getSession();
		
		rs=stat.executeQuery(" select userid,user_name,password from user where user_name='" + u_nm + "' and password='" + psw + "' ");
		if(rs.next())
		{
			    Integer u_id=rs.getInt("userid");
				session.setAttribute("unm",u_nm);
				session.setAttribute("uid",u_id);
				res.sendRedirect("jsp/user-home.jsp");
		}
		else
		{
				session.invalidate();
				pw.println(" <head><meta http-equiv=refresh content='3;URL=jsp/login.jsp?abc=inv' /></head> ");		
		}
		
		
		
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

	public void doPost(HttpServletRequest rq, HttpServletResponse res) throws ServletException, IOException 
	{
   	   	doGet(rq,res);//inside doPost() we are again declaring doGet() with the parameters rq,rs.
   	}
}
