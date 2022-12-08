package furama_resort.service.impl;

import furama_resort.model.Customer;
import furama_resort.repository.ICustomerRepository;
import furama_resort.repository.impl.CustomerRepository;
import furama_resort.service.ICustomerService;

import java.util.List;

public class CustomerService implements ICustomerService {
    private static ICustomerRepository iCustomerRepository = new CustomerRepository();
    @Override
    public List<Customer> selectAll() {
        return iCustomerRepository.selectAll();
    }
}
