package furama_resort.repository;

import furama_resort.model.Customer;

import java.util.List;

public interface ICustomerRepository {
    List<Customer> selectAll();
}
