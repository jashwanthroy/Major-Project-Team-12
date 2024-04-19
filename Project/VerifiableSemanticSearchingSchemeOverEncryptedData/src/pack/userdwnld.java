package pack;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import drivehq.FileDownload;
import util.AppUtil;

public class userdwnld extends HttpServlet {

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();

		try {

			String path = AppUtil.Download_Path;
		
			if (FileDownload.fileDownload(path+request.getParameter("file"))) {

				FileInputStream fis=new FileInputStream(path+request.getParameter("file"));

				FileOutputStream fos=new FileOutputStream(path+"new"+request.getParameter("file"));

				try {
					SimpleFTPClient.decrypt(fis, fos);
				} catch (Throwable e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}


				response.setContentType("text/html");  

				response.setContentType("APPLICATION/OCTET-STREAM");   

				response.setHeader("Content-Disposition","attachment; filename=\"" + request.getParameter("file") + "\"");   

				FileInputStream fileInputStream = new FileInputStream(path+"new"+request.getParameter("file"));  

				int i;   
				
				while ((i=fileInputStream.read()) != -1) {  
					out.write(i);   
				}   
				
				fileInputStream.close();   
				
				out.close();   
				
				response.sendRedirect("userpage.jsp?dwn= sucess..!");
				
			} else {
				response.sendRedirect("userpage.jsp?dwnn= not sucess..!");
			}


		} finally {
			out.close();
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}
}
