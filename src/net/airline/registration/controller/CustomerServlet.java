package net.airline.registration.controller;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.airline.registration.dao.CustomerDao;
import net.airline.registration.model.Customers;



@WebServlet("/register")



public class CustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private CustomerDao customerDao;

    public void init() {
        customerDao = new CustomerDao();
    }
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
        	    throws ServletException, IOException {

        	        String firstName = request.getParameter("firstName");
        	        String lastName = request.getParameter("lastName");
        	        String email = request.getParameter("email");
        	        String username = request.getParameter("username");
        	        String password = request.getParameter("password");
        	        String phone = request.getParameter("phone");

        	        Customers customer = new Customers();
        	        customer.setFirstName(firstName);
        	        customer.setLastName(lastName);
        	        customer.setEmail(email);
        	        customer.setUsername(username);
        	        customer.setPassword(password);
        	        customer.setPhone(phone);

        	        try {
        	        	customerDao.registerCustomer(customer);
        	        } catch (Exception e) {
        	            // TODO Auto-generated catch block
        	            e.printStackTrace();
        	        }

        	        response.sendRedirect("customerdetails.jsp");
        	    }
}
