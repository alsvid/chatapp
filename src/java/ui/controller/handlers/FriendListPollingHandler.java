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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Alsvid
 */
public class FriendListPollingHandler extends RequestHandler {
    
    private PersonRepository persons = new PersonListInMemory();

    public FriendListPollingHandler() {
       
    }
    
    @Override
    public void handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Person p = (Person) request.getSession().getAttribute("user");
        String outXML = "";
        for (Person person : p.getFriendList().getFriendlist()) {
            outXML += this.personFriendToXML(person);
        }
        response.setContentType("text/xml");
        response.getWriter().write(outXML);
    }
    
    public String personFriendToXML(Person p){
       StringBuffer xmlDoc = new StringBuffer();
       
       xmlDoc.append("<friend>\n");
       xmlDoc.append("<userid>\n");
       xmlDoc.append(p.getUserid());
       xmlDoc.append("</userid>\n");
       xmlDoc.append("<status>\n");
       xmlDoc.append(p.getStatusString());
       xmlDoc.append("</status>\n");
       xmlDoc.append("</friend>\n");
       
       return xmlDoc.toString();
    }
}
