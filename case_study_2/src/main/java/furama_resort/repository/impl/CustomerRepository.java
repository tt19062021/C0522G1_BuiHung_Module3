package furama_resort.repository.impl;


import furama_resort.model.Customer;
import furama_resort.model.Employee;
import furama_resort.repository.BaseRepository;
import furama_resort.repository.ICustomerRepository;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private static final String SELECT_ALL_CUS = "call sp_select_cus_all();";

    private static List<Customer> customerList = new ArrayList<>();

    @Override
    public List<Customer> selectAll() {
        List<Customer> customerList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(SELECT_ALL_CUS);
            ResultSet resultSet = callableStatement.executeQuery();
                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    int customerTypeId = resultSet.getInt("customer_type_id");
                    String name = resultSet.getString("name");
                    int gender = resultSet.getInt("gender");
                    String date = resultSet.getString("date_of_birth");
                    String idCard = resultSet.getString("id_card");
                    String phone = resultSet.getString("phone_number");
                    String email = resultSet.getString("email");
                    String address = resultSet.getString("address");

                    Customer cus = new Customer( id,customerTypeId,name,gender,date,idCard,phone,email,address);
                    customerList.add(cus);
                }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customerList;
    }
}
