/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ui.controller.handlers;

import domain.db.PersonListInMemory;
import domain.model.Person;
import domain.model.Person.STATUS;
import domain.service.PersonRepository;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Alsvid
 */
public class OfflineHandler extends RequestHandler {
    
    private PersonRepository persons = new PersonListInMemory();

    public OfflineHandler() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    @Override
    public void handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Person p = (Person) request.getSession().getAttribute("user");
        for (Person person : persons.getPersonlist()) {
            if (person.equals(p)) {
                person.setStatus(STATUS.OFFLINE);
            }
        }
    }
    
}
