/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ui.controller;

import ui.controller.handlers.registerPreHandler;
import ui.controller.handlers.registerHandler;
import ui.controller.handlers.loginHandler;
import ui.controller.handlers.IndexHandler;
import ui.controller.handlers.PersonOverviewHandler;
import domain.db.PersonListInDb;
import domain.db.PersonListInMemory;
import domain.model.Person;
import domain.model.Person.ROLE;
import domain.service.PersonRepository;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import ui.controller.handlers.*;

/**
 *
 * @author Alsvid
 */
public class HandlerFactory {
    PersonRepository persons = new PersonListInMemory();
    
    
    public HandlerFactory() {
        
    }
    
    public RequestHandler getHandler(String action, HttpServletRequest request, HttpServletResponse response) {
        if (action == null) {
            action = "index";
        }
        request.setAttribute("action",action);
        
        switch(action) {
            case "personOverview":
                checkRole(request, new ROLE[] {ROLE.ADMINISTRATOR});
                return new PersonOverviewHandler(persons);
            case "login":
                return new loginHandler(persons);
            case "register":
                return new registerPreHandler();
            case "registerContinued":
                return new registerHandler(persons);
            case "logOut":
                return new logOutHandler();
            case "index":
                return new IndexHandler();
            case "offlinebutton":
                return new OfflineHandler();
            case "onlinebutton":
                return new OnlineHandler();
            case "awaybutton":
                return new AwayHandler();
            case "friendstoxml":
                return new FriendListPollingHandler();
            default:
                return new IndexHandler();
        }
    }
    private Person checkRole(HttpServletRequest request, ROLE[] roles) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("loginid");
		if (id == null)
			throw new NotAuthorizedException();

		Person p = persons.findPerson(id);
		boolean isOneOfTheRoles = false;
		for (ROLE R : roles) {
			if (p.getRole().equals(R)) {
				isOneOfTheRoles = true;
			}
		}
		if (isOneOfTheRoles)
			return p;
		else
			throw new NotAuthorizedException();
	}
}
