package furama_resort.repository.impl;

import furama_resort.model.Contract;
import furama_resort.model.Customer;
import furama_resort.repository.BaseRepository;
import furama_resort.repository.IContractRepository;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ContractRepository implements IContractRepository {
    private static final String SELECT_ALL_CONT = "call sp_select_cont_all();";

    private static List<Contract> contractList = new ArrayList<>();

    @Override
    public List<Contract> selectAll() {
        List<Contract> contractList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(SELECT_ALL_CONT);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {

                int id = resultSet.getInt("id");
                String startDate = resultSet.getString("start_date");
                String endDate = resultSet.getString("end_date");
                double deposit = resultSet.getDouble("deposit");
                int employeeId = resultSet.getInt("employee_id");
                int customerID = resultSet.getInt("customer_id");
                int facilityId = resultSet.getInt("facility_id");
                Contract cus = new Contract(id, startDate, endDate, deposit, employeeId,
                        customerID, facilityId);
                contractList.add(cus);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return contractList;
    }

}
