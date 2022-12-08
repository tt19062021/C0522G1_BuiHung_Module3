package furama_resort.service;

import furama_resort.model.Customer;
import furama_resort.model.Employee;

import java.util.List;

public interface ICustomerService {
    List<Customer> selectAll();
}
