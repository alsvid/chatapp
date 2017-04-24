/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ui.controller.handlers;

import domain.db.PersonListInMemory;
import domain.model.Person;
import domain.model.Person.ROLE;
import domain.service.PersonRepository;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ui.controller.handlers.RequestHandler;

/**
 *
 * @author Alsvid
 */
public class registerHandler extends RequestHandler {
    PersonRepository persons = new PersonListInMemory();

    public registerHandler(PersonRepository persons) {
        this.persons = persons;
    }

    @Override
    public void handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Person person = new Person();
        List<String> errors = checkInputValuesPerson(request,person,true);
        
        if (errors.size() > 0) {
            request.setAttribute("errors", errors);
            request.setAttribute("person", person);
            RequestDispatcher view = request.getRequestDispatcher("index.jsp");
            view.forward(request, response);
        }
        else if (!persons.checkUseridAvailable(person.getUserid())) {
            errors.add("Username not available - try something else.");
            RequestDispatcher view = request.getRequestDispatcher("index.jsp");
            view.forward(request, response);
        }
        else {
            person.setRole(ROLE.CLIENT);
            persons.addPerson(person);
            RequestDispatcher view = request.getRequestDispatcher("index.jsp");
            view.forward(request, response);
        }
    }

    private List<String> checkInputValuesPerson(HttpServletRequest request, Person person, boolean b) {
        List<String> errormessages = new ArrayList<>();
        
        getUserid(person,request,errormessages);
        getFirstName(person,request,errormessages);
        getLastName(person,request,errormessages);
        if (b){
            getPassword(person,request,errormessages);
        }
        return errormessages;
    }

    private void getUserid(Person person, HttpServletRequest request, List<String> errormessages) {
        String userid = request.getParameter("userid");
		try {
			person.setUserid(userid);
		} catch (IllegalArgumentException e) {
			errormessages.add(e.getMessage());
        }
    }

    private void getFirstName(Person person, HttpServletRequest request, List<String> errormessages) {
        String name = request.getParameter("firstName");
		try {
			person.setFirstname(name);
		} catch (IllegalArgumentException e) {
			errormessages.add(e.getMessage());
		}
    }

    private void getLastName(Person person, HttpServletRequest request, List<String> errormessages) {
    String name = request.getParameter("lastName");
		try {
			person.setLastname(name);
		} catch (IllegalArgumentException e) {
			errormessages.add(e.getMessage());
		}
    }

    private void getPassword(Person person, HttpServletRequest request, List<String> errormessages) {
    String pass = request.getParameter("password");
		try {
			person.setPassword(pass);
		} catch (IllegalArgumentException e) {
			errormessages.add(e.getMessage());
		}
    }
    
}
