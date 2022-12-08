package furama_resort.repository.impl;

import furama_resort.model.Employee;
import furama_resort.model.Facility;
import furama_resort.repository.BaseRepository;
import furama_resort.repository.IFacilityRepository;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FacilityRepository implements IFacilityRepository {
    private static final String SELECT_ALL_FAC = "call sp_select_fac_all();";
    private static List<Facility> facilityList = new ArrayList<>();
    @Override
    public List<Facility> selectAll() {
        List<Facility> facilityList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
//        id int AI PK
//        name varchar(50)
//        area int
//        cost double
//        max_people int
//        rent_type_id int
//        facility_type_id int
//        standard_room varchar(45)
//        description_other_convenience varchar(45)
//        pool_area double
//        number_of_floors int
//        facility_free text
//        is_delete bit(1)
        try {
            CallableStatement callableStatement = connection.prepareCall(SELECT_ALL_FAC);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                int area = resultSet.getInt("area");
                double cost = resultSet.getDouble("cost");
                int maxPeople=resultSet.getInt("max_people");
                int rentType=resultSet.getInt("rent_type_id");
                int facilityTypeId= resultSet.getInt("facility_type_id");
                String standardRoom= resultSet.getString("standard_room");
                String description = resultSet.getString("description_other_convenience");
                double poolArea = resultSet.getDouble("pool_area");
                int numberFloor= resultSet.getInt("number_of_floors");
                String facilityFree= resultSet.getString("facility_free");

                Facility fac = new Facility(id,name,
                        area,cost,maxPeople,
                        rentType,facilityTypeId,
                        standardRoom,description,
                        poolArea,numberFloor,facilityFree);
                facilityList.add(fac);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return facilityList;
    }

}
