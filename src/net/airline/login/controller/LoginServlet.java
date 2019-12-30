package net.airline.login.controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.airline.login.dao.LoginDao;
import net.airline.login.bean.LoginBean;

@WebServlet("/login")
public class LoginServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
    private LoginDao loginDao;

    public void init() {
        loginDao = new LoginDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        LoginBean loginBean = new LoginBean();
        loginBean.setUsername(username);
        loginBean.setPassword(password);

        try {
            if (loginDao.validate(loginBean)) {
                HttpSession session = request.getSession();
               
                session.setAttribute("user",username);
                System.out.println("Welcome "+username);
                response.sendRedirect("loginsuccess.jsp");
            } else {
                //HttpSession session = request.getSession();
                //session.setAttribute("user", username);
                //session.setAttribute("errorMessage", "Invalid user or password");
                response.sendRedirect("loginfailed.jsp");
                
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
