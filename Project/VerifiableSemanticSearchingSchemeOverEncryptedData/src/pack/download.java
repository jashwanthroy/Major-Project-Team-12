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

public class download extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            String path = AppUtil.Download_Path;
            
            if (FileDownload.fileDownload(path+request.getParameter("file"))) {
            	
            	System.out.println("in if");
            	
            	FileInputStream fis=new FileInputStream(path+request.getParameter("file"));
            	
            	FileOutputStream fos=new FileOutputStream(path+"new"+request.getParameter("file"));
            	
            	try {
					SimpleFTPClient.decrypt(fis, fos);
				} catch (Throwable e) {
					e.printStackTrace();
				}
            	 response.sendRedirect("owneruserpage.jsp?dwn= sucess..!");
                
            } else {
                 response.sendRedirect("owneruserpage.jsp?dwnn= not sucess..!");
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
