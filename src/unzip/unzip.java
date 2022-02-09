package unzip;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class unzip extends HttpServlet
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	PrintWriter pw1,pw2;
	
	public void doGet(HttpServletRequest rq, HttpServletResponse res) throws IOException, ServletException
	{

		try {
			String str=rq.getParameter("flnm");
			System.out.println(str);
			Integer len=str.length();
			String nwdrc=str.substring(0,(len-4));
			System.out.println(nwdrc);
//create a new directory if it does not exist			
			File f=new File("/home/dutta/workspace/spoken_school_resource_system/WebContent/static/resource/4/"+nwdrc);
		    if(!f.exists()){
		        f.mkdirs();
		    }
			//unzipping using iteration.
			ZipFile zipFile = new ZipFile("/home/dutta/workspace/spoken_school_resource_system/WebContent/static/resource/4/"+str);
			Enumeration<?> enu = zipFile.entries();
			while (enu.hasMoreElements()) {
				ZipEntry zipEntry = (ZipEntry) enu.nextElement();

				String name = zipEntry.getName();
				long size = zipEntry.getSize();
				long compressedSize = zipEntry.getCompressedSize();
				System.out.printf("name: %-20s | size: %6d | compressed size: %6d\n", 
						name, size, compressedSize);
			//unzip directory within directory
				File file = new File("/home/dutta/workspace/spoken_school_resource_system/WebContent/static/resource/4/"+name);
				if (name.endsWith("/")) {  
					file.mkdirs();
					continue;
				}

				File parent = file.getParentFile();
				if (parent != null) {
					parent.mkdirs();
				}

				InputStream is = zipFile.getInputStream(zipEntry);
				FileOutputStream fos = new FileOutputStream(file);
				byte[] bytes = new byte[1024];
				int length;
				while ((length = is.read(bytes)) >= 0) {
					fos.write(bytes, 0, length);
				}
				is.close();
				fos.close();

			}
			zipFile.close();
			System.out.println("unzip file created Successful");
			pw2=res.getWriter();
	//		HttpSession session=rq.getSession();
		//	pw.println("Please wait a moment...");
		//	session.invalidate();
			pw2.println("<head><meta http-equiv=refresh content='0;URL=jsp/user-home.jsp?upload-status=success' /></head>");
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void doPost(HttpServletRequest rq, HttpServletResponse res) throws ServletException, IOException 
	{
   	   	doGet(rq,res);//inside doPost() we are again declaring doGet() with the parameters rq,rs.
   	}

}
