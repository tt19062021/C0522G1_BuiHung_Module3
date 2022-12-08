package furama_resort.repository.impl;

import furama_resort.model.Employee;
import furama_resort.repository.BaseRepository;
import furama_resort.repository.IEmployeeRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepository implements IEmployeeRepository {
    private static final String INSERT_EMPLOYEE = "insert into employee(employee_name, employee_birthday, employee_id_card," +
            " employee_salary, employee_phone, employee_email," +
            " employee_address, position_id, education_degree_id, division_id )\n" +
            "values (?,?,?,?,?,?,?,?,?,?)";
    private static final String SELECT_ALL_EMP = "select * from employee where is_delete=0;";
    private static final String DELETE = "update employee set is_delete = 1 where employee_id = ? and is_delete = 0;";
    private static final String UPDATE = "update employee set employee_name = ?, employee_birthday = ?, " +
            "employee_id_card = ?, employee_salary = ?, employee_phone = ?, employee_email = ?, " +
            "employee_address = ?, position_id = ?, education_degree_id = ?, division_id = ? where employee_id = ? and " +
            "is_delete = 0;";
    private static final String FIND_BY_ID = "select * from employee where employee_id = ? and is_delete = 0;";
    private static final String SEARCH = "select * from employee where is_delete = 0 and employee_name like ? and " +
            "employee_address like ? and employee_phone like ?;";

    @Override
    public List<Employee> selectAll() {
        List<Employee> employeeList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(SELECT_ALL_EMP);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("employee_id");
                String name = resultSet.getString("employee_name");
                String dateOfBirth = resultSet.getString("employee_birthday");
                String idCard = resultSet.getString("employee_id_card");
                double salary = resultSet.getDouble("employee_salary");
                String phone = resultSet.getString("employee_phone");
                String email = resultSet.getString("employee_email");
                String address = resultSet.getString("employee_address");
                int positionId = resultSet.getInt("position_id");
                int educationId = resultSet.getInt("education_degree_id");
                int divisionId = resultSet.getInt("division_id");

                Employee emp = new Employee(id, name, dateOfBirth, idCard, salary, phone, email, address, positionId, educationId, divisionId);
                employeeList.add(emp);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return employeeList;
    }



    @Override
    public boolean addEmp(Employee employee) {

        Connection connection = BaseRepository.getConnection();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_EMPLOYEE);

            preparedStatement.setString(1, employee.getName());
            preparedStatement.setString(2, employee.getDateOfBirth());
            preparedStatement.setString(3, employee.getIdCard());
            preparedStatement.setDouble(4, employee.getSalary());
            preparedStatement.setString(5, employee.getPhone());
            preparedStatement.setString(6, employee.getEmail());
            preparedStatement.setString(7, employee.getAddress());
            preparedStatement.setInt(8, employee.getPositionId());
            preparedStatement.setInt(9, employee.getEducationDegree());
            preparedStatement.setInt(10, employee.getDivisionId());

            int num = preparedStatement.executeUpdate();
            return (num == 1);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean delete(int idDelete) {
        boolean rowDelete = false;
        Connection connection = BaseRepository.getConnection();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
            preparedStatement.setInt(1, idDelete);
            rowDelete = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rowDelete;
    }

    @Override
    public boolean edit(Employee employee) {
        boolean rowUpdated = false;
        Connection connection = BaseRepository.getConnection();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);

            preparedStatement.setString(1, employee.getName());
            preparedStatement.setString(2, employee.getDateOfBirth());
            preparedStatement.setString(3, employee.getIdCard());
            preparedStatement.setDouble(4, employee.getSalary());
            preparedStatement.setString(5, employee.getPhone());
            preparedStatement.setString(6, employee.getEmail());
            preparedStatement.setString(7, employee.getAddress());
            preparedStatement.setInt(8, employee.getPositionId());
            preparedStatement.setInt(9, employee.getEducationDegree());
            preparedStatement.setInt(10, employee.getDivisionId());
            preparedStatement.setInt(11, employee.getId());

            rowUpdated = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rowUpdated;
    }

    @Override
    public Employee findById(int idFind) {
        Employee employee = null;
        Connection connection = BaseRepository.getConnection();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID);
            preparedStatement.setInt(1, idFind);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int employeeId = resultSet.getInt("employee_id");
                String employeeName = resultSet.getString("employee_name");
                String employeeBirthday = resultSet.getString("employee_birthday");
                String employeeIdCard = resultSet.getString("employee_id_card");
                double employeeSalary = resultSet.getInt("employee_salary");
                String employeePhone = resultSet.getString("employee_phone");
                String employeeEmail = resultSet.getString("employee_email");
                String employeeAddress = resultSet.getString("employee_address");
                int positionId = resultSet.getInt("position_id");
                int educationDegreeId = resultSet.getInt("education_degree_id");
                int divisionId = resultSet.getInt("division_id");

                employee = new Employee(employeeId, employeeName, employeeBirthday, employeeIdCard, employeeSalary,
                        employeePhone, employeeEmail, employeeAddress, positionId, educationDegreeId, divisionId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employee;
    }

    @Override
    public List<Employee> search(String nameSearch, String addressSearch, String phoneSearch) {
        List<Employee> employeeList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH);
            preparedStatement.setString(1, "%" + nameSearch + "%");
            preparedStatement.setString(2, "%" + addressSearch + "%");
            preparedStatement.setString(3, "%" + phoneSearch + "%");
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int employeeId = resultSet.getInt("employee_id");
                String employeeName = resultSet.getString("employee_name");
                String employeeBirthday = resultSet.getString("employee_birthday");
                String employeeIdCard = resultSet.getString("employee_id_card");
                double employeeSalary = resultSet.getInt("employee_salary");
                String employeePhone = resultSet.getString("employee_phone");
                String employeeEmail = resultSet.getString("employee_email");
                String employeeAddress = resultSet.getString("employee_address");
                int positionId = resultSet.getInt("position_id");
                int educationDegreeId = resultSet.getInt("education_degree_id");
                int divisionId = resultSet.getInt("division_id");

                Employee employee = new Employee(employeeId, employeeName, employeeBirthday, employeeIdCard,
                        employeeSalary, employeePhone, employeeEmail, employeeAddress, positionId, educationDegreeId,
                        divisionId);
                employeeList.add(employee);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return employeeList;
    }
}
