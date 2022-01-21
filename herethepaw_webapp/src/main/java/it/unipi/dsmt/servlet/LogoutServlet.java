package it.unipi.dsmt.servlet;

import it.unipi.dsmt.ejb.UserRemoteEJB;


import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import javax.naming.NamingException;
import java.io.IOException;

@WebServlet(name = "LogoutServlet",value="/logout")
public class LogoutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserRemoteEJB userRemoteEJB = null;
        try {
            userRemoteEJB = new UserRemoteEJB();
            userRemoteEJB.setLogged_user(null);
        } catch (NamingException e) {
            e.printStackTrace();
        }
        response.sendRedirect(request.getContextPath()+"/index.jsp");
    }
}
