/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ui.controller;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;

/**
 *
 * @author Alsvid
 */
@ServerEndpoint("/echo")
public class ChatServer {
    
    	private static final Set<Session> sessions = Collections.synchronizedSet(new HashSet<Session>());

        @OnOpen
        public void onOpen(Session session) {
            System.out.println(session.getId() + "has opened a connection");
            sendMessageToAll("User has connected");
            try {
                session.getBasicRemote().sendText("Connection Established");
            }
            catch (IOException e) {
                e.printStackTrace();
            }
            sessions.add(session);
        }
        
        @OnMessage
        public void onMessage(String message, Session session) {
            System.out.println("Message from " + session.getId() + ": " + message);
            sendMessageToAll(message);
        }
        
        @OnClose
        public void onClose(Session session) {
            System.out.println("Chat " + session.getId() + " has ended");
            sessions.remove(session);
        }
        
        private void sendMessageToAll(String message){
            for(Session s : sessions){
                try {
                    s.getBasicRemote().sendText(message);
                } catch (IOException ex) {
                    ex.printStackTrace();
            }
        }
    }
}
