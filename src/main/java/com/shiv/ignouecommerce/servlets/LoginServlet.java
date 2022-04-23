/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.shiv.ignouecommerce.servlets;

import com.shiv.ignouecommerce.dao.UserDao;
import com.shiv.ignouecommerce.entities.User;
import com.shiv.ignouecommerce.helper.factoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ninja
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

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
                String userEmail = request.getParameter("userEmail");
                String userPassword = request.getParameter("userPassword");
                
                // input field validation
                if(userEmail.isEmpty()) { 
                    // out.println("Email is Blank");
                    HttpSession httpSession = request.getSession();
                    httpSession.setAttribute("screenmsg", "Please type email id ");
                    response.sendRedirect("login.jsp");
                    return;
                }
                
                if(userPassword.isEmpty()) { 
                    // out.println("Password is Blank");
                    HttpSession httpSession = request.getSession();
                    httpSession.setAttribute("screenmsg", "Please type password");
                    response.sendRedirect("login.jsp");
                    return;
                }
                
                UserDao userdao = new UserDao(factoryProvider.getFactory());
                User user = userdao.getUserByEmailAndPassword(userEmail, userPassword);
                //out.println(user);
                
                if(user == null){
                    HttpSession httpSession = request.getSession();
                    httpSession.setAttribute("screenmsg", "Invalid User Credentials");
                    response.sendRedirect("login.jsp");
                    return;
                } else {
                    HttpSession httpSession = request.getSession();
                    httpSession.setAttribute("current-user", user);
                    
                    if( user.getUserType().equals("admin")){
                        httpSession.setAttribute("screenmsg", "Welcome " + user.getUserName() + "  You are now successfully logged in!");
                        // redirect to home page
                        response.sendRedirect("admin.jsp");
                        return;
                    } else if ( user.getUserType().equals("normal")){
                        httpSession.setAttribute("screenmsg", "Welcome " + user.getUserName() + "  You are now successfully logged in!");
                        // redirect to home page
                        response.sendRedirect("checkout.jsp");
                        return;
                    } else {
                        httpSession.setAttribute("screenmsg", "Unknown User :) ");
                        // redirect to home page
                        response.sendRedirect("checkout.jsp");
                        return;
                    }
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
