package servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Collection;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import Dao.ProductDao;
import bean.Product;
import connectiondb.ConnectionProvider;

@MultipartConfig
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		PrintWriter p = response.getWriter();
		response.setContentType("text/html");		
		String pname = request.getParameter("pname");
		String pmodel = request.getParameter("pmodel");
		String ptype = request.getParameter("ptype");
		String pbrand = request.getParameter("pbrand");
		String pquantity = request.getParameter("pquantity");
		String price1 = request.getParameter("price");
		double price = Double.parseDouble(price1);
		String disc = request.getParameter("discount");
		int discount = Integer.parseInt(disc);
		String category = request.getParameter("category");
		String discription = request.getParameter("description");
		
		String image1 = request.getPart("pimage1").getSubmittedFileName();
		String image2 = request.getPart("pimage2").getSubmittedFileName();
		String image3 = request.getPart("pimage3").getSubmittedFileName();
		String image4 = request.getPart("pimage4").getSubmittedFileName();
		
		Collection<Part> fileParts = request.getParts();
		for (Part filePart : fileParts) {
			String fileName = filePart.getSubmittedFileName();
			System.out.println("file-----------" + fileName);
			String uploadPath = "C:\\Users\\LENOVO\\eclipse-workspace\\ProEcommerce\\src\\main\\webapp\\product-image"+File.separator + fileName;

			InputStream inputStream = filePart.getInputStream();
			Files.copy(inputStream, Paths.get(uploadPath), StandardCopyOption.REPLACE_EXISTING);
			inputStream.close();
		
		}
      try {
    	  ProductDao productDao = new ProductDao(ConnectionProvider.getConnection());
         
    	  Product productBean = productDao.productStore(pname, pmodel, ptype, pbrand, pquantity, price1, image1, image2, image3, image4, category, discount, price);
          System.out.println("Data uploaded success means photo");
          System.out.println(productBean);
      }catch(Exception e) {
    	  e.printStackTrace();
      }
	}

}
