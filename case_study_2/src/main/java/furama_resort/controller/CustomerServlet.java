package furama_resort.controller;

import furama_resort.model.Customer;
import furama_resort.model.Employee;
import furama_resort.repository.ICustomerRepository;
import furama_resort.repository.IEmployeeRepository;
import furama_resort.repository.impl.CustomerRepository;
import furama_resort.repository.impl.EmployeeRepository;
import furama_resort.service.ICustomerService;
import furama_resort.service.impl.CustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    private static ICustomerService iCustomerService = new CustomerService();
    private static List<Customer> customerList = new ArrayList<>();



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "view":
                showAll(request, response);
                break;
            case "create":
                showCreate(request, response);
                break;
            default:
                break;
        }
    }

    private void showCreate(HttpServletRequest request, HttpServletResponse response) {
    }

    private void showAll(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customerList = iCustomerService.selectAll();
        request.setAttribute("customerList", customerList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/view.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {

            default:
                break;
        }
    }
}
