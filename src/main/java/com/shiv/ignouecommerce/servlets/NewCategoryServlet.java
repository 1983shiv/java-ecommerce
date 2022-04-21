/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.shiv.ignouecommerce.servlets;

import com.shiv.ignouecommerce.entities.Category;
import com.shiv.ignouecommerce.helper.factoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author ninja
 */
@WebServlet(name = "NewCategoryServlet", urlPatterns = {"/NewCategoryServlet"})
public class NewCategoryServlet extends HttpServlet {

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
                
                
                Category newcatId = new Category(categoryTitle, categoryDescription);
                
                // Creating hibernate session
                Session hibernateSession = factoryProvider.getFactory().openSession();
                // open the transaction
                Transaction tx = hibernateSession.beginTransaction();
                
                // save the new user object which return newcatId, that we can print on successfully completion
                int catId = (int)hibernateSession.save(newcatId);
                
                tx.commit();
                hibernateSession.close();
                
                // Create a HTTP Session to store the userId and successful msg on to utilize on screenmsg components.
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("screenmsg", "New Category Added Successfully, Category Id is : " + catId);
                // redirect to home page
                response.sendRedirect("admin.jsp");
                return;
                
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
