package furama_resort.service.impl;

import furama_resort.model.Employee;
import furama_resort.repository.IEmployeeRepository;
import furama_resort.repository.impl.EmployeeRepository;
import furama_resort.service.IEmployeeService;

import java.util.List;

public class EmployeeService implements IEmployeeService {
    private static IEmployeeRepository iEmployeeRepository = new EmployeeRepository();

    @Override
    public List<Employee> selectAll() {
        return iEmployeeRepository.selectAll();
    }

    @Override
    public boolean addEmp(Employee employee) {
        return iEmployeeRepository.addEmp(employee);
    }

    @Override
    public boolean delete(int idDelete) {
        return iEmployeeRepository.delete(idDelete);
    }

    @Override
    public boolean edit(Employee employee) {
        return iEmployeeRepository.edit(employee);
    }

    @Override
    public Employee findById(int idFind) {
        return iEmployeeRepository.findById(idFind);
    }

    @Override
    public List<Employee> search(String nameSearch, String addressSearch, String phoneSearch) {
        return iEmployeeRepository.search(nameSearch,addressSearch,phoneSearch);
    }
}
