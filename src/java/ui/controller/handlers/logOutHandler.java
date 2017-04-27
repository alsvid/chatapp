/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ui.controller.handlers;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Alsvid
 */
public class logOutHandler extends RequestHandler {

    public logOutHandler() {
        
    }
    
    @Override
    public void handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("loginid",null);
        session.setAttribute("user", null);
        request.setAttribute("login", null);
        request.setAttribute("loggedInPerson", null);
        request.setAttribute("loggedout", true);
        RequestDispatcher view = request.getRequestDispatcher("index.jsp");
        view.forward(request, response);
        //response.sendRedirect("Controller?action=index");
        
                
    }
    
}
