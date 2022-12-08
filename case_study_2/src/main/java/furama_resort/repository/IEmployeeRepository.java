package furama_resort.repository;

import furama_resort.model.Employee;

import java.util.List;

public interface IEmployeeRepository {
    List<Employee> selectAll();

    boolean addEmp(Employee employee);

    boolean delete(int idDelete);

    boolean edit(Employee employee);

    Employee findById(int idFind);
    List<Employee> search(String nameSearch, String addressSearch, String phoneSearch);
}
