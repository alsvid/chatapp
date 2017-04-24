/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ui.controller.handlers;

import domain.db.PersonListInMemory;
import domain.model.Person;
import domain.service.PersonRepository;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import ui.controller.handlers.RequestHandler;

/**
 *
 * @author Alsvid
 */
public class loginHandler extends RequestHandler {
    private PersonRepository persons = new PersonListInMemory();

    public loginHandler(PersonRepository persons) {
        this.persons = persons;
    }

    @Override
    public void handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String userid = request.getParameter("userid");
       String pass = request.getParameter("password");
       Person p = persons.findAuthenticatedPerson(userid, pass);
       HttpSession session = null;
       
       if (p != null) {
           session = request.getSession();
           session.setAttribute("loginid", userid);
           session.setMaxInactiveInterval(3600);
           
           request.setAttribute("login", true);
           request.setAttribute("loggedInPerson", p);
           session.setAttribute("user", p);
           request.getRequestDispatcher("Controller?action=index").forward(request, response);
       }
       else {
           request.setAttribute("error", "Wrong username or password");
           request.getRequestDispatcher("Controller?action=index").forward(request, response);
       }
       
    }
    
}
