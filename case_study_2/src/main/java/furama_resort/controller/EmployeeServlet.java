package furama_resort.controller;

import furama_resort.model.Division;
import furama_resort.model.EducationDegree;
import furama_resort.model.Employee;
import furama_resort.model.Position;
import furama_resort.repository.IEmployeeRepository;
import furama_resort.repository.impl.EmployeeRepository;
import furama_resort.service.IDivisionService;
import furama_resort.service.IEducationDegreeService;
import furama_resort.service.IEmployeeService;
import furama_resort.service.IPositionService;
import furama_resort.service.impl.DivisionService;
import furama_resort.service.impl.EducationDegreeService;
import furama_resort.service.impl.EmployeeService;
import furama_resort.service.impl.PositionService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "EmployeeServlet", value = "/employee")
public class EmployeeServlet extends HttpServlet {

    private static IEmployeeService iEmployeeService = new EmployeeService();
    private static IPositionService iPositionSercive = new PositionService();
    private IEducationDegreeService iEducationDegreeService = new EducationDegreeService();
    private IDivisionService iDivisionService = new DivisionService();
    private static List<Employee> employeeList = new ArrayList<>();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showAdd(request, response);
                break;
            case "delete":
                deleteEmp(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "search":
                searchEmployee(request, response);
                break;
            case "display":
                showViewEmp(request, response);
                break;
            default:
                showAll(request, response);
        }
    }

    private void showViewEmp(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        List<Position> positionList = iPositionSercive.findAll();
        List<EducationDegree> educationDegreeList = iEducationDegreeService.findAll();
        List<Division> divisionList = iDivisionService.findAll();
        Employee employee = iEmployeeService.findById(id);
        RequestDispatcher dispatcher;

        if (employee == null) {
            dispatcher = request.getRequestDispatcher("error_404.jsp");
        } else {
            request.setAttribute("employee", employee);
            dispatcher = request.getRequestDispatcher("employee/display.jsp");
            request.setAttribute("positionList", positionList);
            request.setAttribute("educationDegreeList", educationDegreeList);
            request.setAttribute("divisionList", divisionList);

            LocalDate minAge = LocalDate.now().minusYears(65);
            LocalDate maxAge = LocalDate.now().minusYears(18);
            request.setAttribute("minAge", minAge);
            request.setAttribute("maxAge", maxAge);
        }

        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void searchEmployee(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("employee/view.jsp");

        String name = request.getParameter("nameSearch");
        String address = request.getParameter("addressSearch");
        String phone = request.getParameter("phoneSearch");

        List<Employee> employeeList = iEmployeeService.search(name, address, phone);
        List<Position> positionList = iPositionSercive.findAll();
        List<EducationDegree> educationDegreeList = iEducationDegreeService.findAll();
        List<Division> divisionList = iDivisionService.findAll();

        for (Employee employee : employeeList) {
            String[] arr = employee.getDateOfBirth().split("-");
            employee.setDateOfBirth(arr[2] + "/" + arr[1] + "/" + arr[0]);
        }

        request.setAttribute("employeeList", employeeList);
        request.setAttribute("positionList", positionList);
        request.setAttribute("educationDegreeList", educationDegreeList);
        request.setAttribute("divisionList", divisionList);

        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        List<Position> positionList = iPositionSercive.findAll();
        List<EducationDegree> educationDegreeList = iEducationDegreeService.findAll();
        List<Division> divisionList = iDivisionService.findAll();
        Employee employee = iEmployeeService.findById(id);
        RequestDispatcher dispatcher;

        if (employee == null) {
            dispatcher = request.getRequestDispatcher("error_404.jsp");
        } else {
            request.setAttribute("employee", employee);
            dispatcher = request.getRequestDispatcher("employee/edit.jsp");
            request.setAttribute("positionList", positionList);
            request.setAttribute("educationDegreeList", educationDegreeList);
            request.setAttribute("divisionList", divisionList);

            LocalDate minAge = LocalDate.now().minusYears(65);
            LocalDate maxAge = LocalDate.now().minusYears(18);
            request.setAttribute("minAge", minAge);
            request.setAttribute("maxAge", maxAge);
        }

        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteEmp(HttpServletRequest request, HttpServletResponse response) {
        int idDelete = Integer.parseInt(request.getParameter("idDelete"));
        boolean check = iEmployeeService.delete(idDelete);
        String mess = "Delete Employee failed.";
        if (check) {
            mess = "Delete Employee successfully.";
        }
        request.setAttribute("mess", mess);
        request.setAttribute("check", check);
        showAll(request, response);
    }

    private void showAdd(HttpServletRequest request, HttpServletResponse response) {
        List<Position> positionList = iPositionSercive.findAll();
        List<EducationDegree> educationDegreeList = iEducationDegreeService.findAll();
        List<Division> divisionList = iDivisionService.findAll();
        RequestDispatcher dispatcher = request.getRequestDispatcher("employee/create.jsp");
        request.setAttribute("positionList", positionList);
        request.setAttribute("educationDegreeList", educationDegreeList);
        request.setAttribute("divisionList", divisionList);

        LocalDate minAge = LocalDate.now().minusYears(65);
        LocalDate maxAge = LocalDate.now().minusYears(18);
        request.setAttribute("minAge", minAge);
        request.setAttribute("maxAge", maxAge);

        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showAll(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("employee/view.jsp");

        List<Employee> employeeList = iEmployeeService.selectAll();
        List<Position> positionList = iPositionSercive.findAll();
        List<EducationDegree> educationDegreeList = iEducationDegreeService.findAll();
        List<Division> divisionList = iDivisionService.findAll();

        for (Employee employee : employeeList) {
            String[] arr = employee.getDateOfBirth().split("-");
            employee.setDateOfBirth(arr[2] + "/" + arr[1] + "/" + arr[0]);
        }

        request.setAttribute("employeeList", employeeList);
        request.setAttribute("positionList", positionList);
        request.setAttribute("educationDegreeList", educationDegreeList);
        request.setAttribute("divisionList", divisionList);

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
            case "create":
                save(request, response);
                break;
            case "edit":
                updateEmployee(request, response);
                break;
            default:
                break;
        }
    }

    private void updateEmployee(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String dayOfBirth = request.getParameter("dateOfBirth");
        String idCard = request.getParameter("idCard");
        double salary = Double.parseDouble(request.getParameter("salary"));
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int position = Integer.parseInt(request.getParameter("position"));
        int educationDegree = Integer.parseInt(request.getParameter("educationDegree"));
        int division = Integer.parseInt(request.getParameter("division"));

        Employee employee = new Employee(id, name, dayOfBirth, idCard, salary, phone, email, address, position, educationDegree, division);

        boolean check = iEmployeeService.edit(employee);
        RequestDispatcher dispatcher = request.getRequestDispatcher("employee/edit.jsp");
        String mess = "Update Employee successfully.";

        if (!check) {
            mess = "Update Employee failed.";
        }
        request.setAttribute("mess", mess);
        request.setAttribute("check", check);

        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void save(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String dateOfBirth = request.getParameter("dateOfBirth");
        String idCard = request.getParameter("idCard");
        double salary = Double.parseDouble(request.getParameter("salary"));
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int positionId = Integer.parseInt(request.getParameter("positionId"));
        int educationDegree = Integer.parseInt(request.getParameter("educationDegree"));
        int divisionId = Integer.parseInt(request.getParameter("divisionId"));

        Employee emp = new Employee(name, dateOfBirth, idCard, salary, phone, email, address, positionId, educationDegree, divisionId);
        boolean check = iEmployeeService.addEmp(emp);
        String mess = "thêm mới thành công";
        if (!check) {
            mess = "thêm mới không thành cônn";
        }
        request.setAttribute("mess", mess);
        request.setAttribute("check", check);
        showAdd(request, response);
    }

}
