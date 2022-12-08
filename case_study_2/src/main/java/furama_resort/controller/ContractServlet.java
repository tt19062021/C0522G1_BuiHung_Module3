package furama_resort.controller;

import furama_resort.model.Contract;
import furama_resort.model.Customer;
import furama_resort.repository.IContractRepository;
import furama_resort.repository.impl.ContractRepository;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ContractServlet", value = "/contract")
public class ContractServlet extends HttpServlet {
    private static IContractRepository iContractRepository = new ContractRepository();
    private static List<Contract> contractList = new ArrayList<>();
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
        List<Contract> contractList = iContractRepository.selectAll();
        request.setAttribute("contractList",contractList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("contract/view.jsp");
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
