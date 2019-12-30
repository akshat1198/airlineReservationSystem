package net.airline.adminlogin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.airline.adminlogin.bean.adminLoginBean;
import net.airline.adminlogin.dao.AdminDao;

@WebServlet("/adminlogin")

public class AdminServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
    private AdminDao loginDao;

    public void init() {
        loginDao = new AdminDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        adminLoginBean loginBean = new adminLoginBean();
        loginBean.setUsername(username);
        loginBean.setPassword(password);

        try {
            if (loginDao.validate(loginBean)) {
                HttpSession session = request.getSession();
               
                session.setAttribute("user",username);
                System.out.println("Welcome "+username);
                response.sendRedirect("adminHome.jsp");
            } else {
                //HttpSession session = request.getSession();
                //session.setAttribute("user", username);
                //session.setAttribute("errorMessage", "Invalid user or password");
                response.sendRedirect("adminfailed.jsp");
                
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
