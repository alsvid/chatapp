/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ui.controller.handlers;

import domain.db.PersonListInMemory;
import domain.service.PersonRepository;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ui.controller.handlers.RequestHandler;

/**
 *
 * @author Alsvid
 */
public class PersonOverviewHandler extends RequestHandler {
    PersonRepository persons = new PersonListInMemory();

    public PersonOverviewHandler(PersonRepository persons) {
        this.persons = persons;
    }

    @Override
    public void handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       request.setAttribute("people", persons.getPersonlist());
        RequestDispatcher view = request.getRequestDispatcher("personlist.jsp");
        view.forward(request, response);
    }
    
    
    
}
