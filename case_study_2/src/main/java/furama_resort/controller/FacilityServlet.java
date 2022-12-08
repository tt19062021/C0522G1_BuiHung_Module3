package furama_resort.controller;

import furama_resort.model.Customer;
import furama_resort.model.Facility;
import furama_resort.repository.ICustomerRepository;
import furama_resort.repository.IFacilityRepository;
import furama_resort.repository.impl.CustomerRepository;
import furama_resort.repository.impl.FacilityRepository;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "FacilityServlet", value = "/facility")
public class FacilityServlet extends HttpServlet {
    private static IFacilityRepository iFacilityRepository = new FacilityRepository();
    private static List<Facility> facilityList = new ArrayList<>();
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
            default:
                break;
        }
    }

    private void showAll(HttpServletRequest request, HttpServletResponse response) {
        List<Facility> facilityList = iFacilityRepository.selectAll();
        request.setAttribute("facilityList",facilityList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("facility/view.jsp");
        try {
            dispatcher.forward(request,response);
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
            case "":
                break;
            default:
                break;
        }
    }
}
