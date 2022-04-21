/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.shiv.ignouecommerce.servlets;

import com.shiv.ignouecommerce.dao.CategoryDao;
import com.shiv.ignouecommerce.dao.ProductDao;
import com.shiv.ignouecommerce.entities.Category;
import com.shiv.ignouecommerce.entities.Product;
import com.shiv.ignouecommerce.helper.factoryProvider;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author ninja
 */
@MultipartConfig
@WebServlet(name = "ProductOperationsServlet", urlPatterns = {"/ProductOperationsServlet"})
public class ProductOperationsServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            try {
                String op = request.getParameter("operations");
                if(op.trim().equals("addcategory")){
                    
                    // get the data from add category form.
                    String categoryTitle = request.getParameter("categoryTitle");
                    String categoryDescription = request.getParameter("categoryDescription");
                
                    // Validation
                    if(categoryTitle.isEmpty()) { 
                        //out.println("Title is Blank");
                        HttpSession httpSession = request.getSession();
                        httpSession.setAttribute("screenmsg", "Title is Blank");
                        response.sendRedirect("admin.jsp");
                        return;
                    }
                    
                    // creating a category object with form data
                    Category cat = new Category();
                    cat.setCategoryTitle(categoryTitle);
                    cat.setCategoryDescription(categoryDescription);
                    
                    // save the category data to database
                    CategoryDao catdao = new CategoryDao(factoryProvider.getFactory());
                    int catid = (int) catdao.saveCategory(cat);
                    
                    if(catid == 0){
                        HttpSession httpSession = request.getSession();
                        httpSession.setAttribute("screenmsg", "Category data is not saved");
                        response.sendRedirect("admin.jsp");
                        return;
                    } else {
                        HttpSession httpSession = request.getSession();
                        httpSession.setAttribute("screenmsg", "Category data is saved successfully, new cat id is : "+ catid);
                        response.sendRedirect("admin.jsp");
                    }
                }
                if(op.trim().equals("addproduct")){
                    // get the data from add category form.
                    String pName = request.getParameter("pName");
                    String pDesc = request.getParameter("pDesc");
                    
                    int pPrice = Integer.parseInt(request.getParameter("pPrice"));
                    int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
                    int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
                    
                    int cId = Integer.parseInt(request.getParameter("categoryId"));
                    CategoryDao catdao = new CategoryDao(factoryProvider.getFactory());
                    Category pCat = catdao.getCategoryById(cId);
                                        
                    Part part = request.getPart("pPhoto");
                    String fileName = part.getSubmittedFileName();
                    
                    Product newP = new Product();
                    newP.setpName(pName);
                    newP.setpDesc(pDesc);
                    newP.setpPrice(pPrice);
                    newP.setpDiscount(pDiscount);
                    newP.setpQuantity(pQuantity);
                    newP.setpPhoto(fileName);
                    //newP.setpPhoto("default.jpg");
                    newP.setCategory(pCat);
                    
                    ProductDao pdao = new ProductDao(factoryProvider.getFactory());
                    
                    int pid = pdao.saveProduct(newP);
                    
                    try {
                        // findout the path to upload the images
                        String path = request.getRealPath("img") + File.separator + "products" + File.separator + fileName;

                        // uploading code...
                        // for writing the file
                        FileOutputStream fos = new FileOutputStream(path);

                        // for reading the file
                        // FileInputStream fis = new FileInputStream(part.getSubmittedFileName());
                        InputStream istrm = part.getInputStream();
                        // reading data
                        byte []data = new byte[istrm.available()];
                        istrm.read(data);
                        fos.write(data);

                        //close the open i/o streams
                        fos.close();
                        istrm.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    
                    // firing the session, to display the message on admin screen for new product 
                    HttpSession httpSession = request.getSession();
                    httpSession.setAttribute("screenmsg", "Product data is saved successfully, new product id is : "+ pid);
                    response.sendRedirect("admin.jsp");
                    
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
