package furama_resort.repository.impl;

import furama_resort.model.EducationDegree;
import furama_resort.repository.BaseRepository;
import furama_resort.repository.IEducationDegreeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EducationDegreeRepository implements IEducationDegreeRepository {
    private static final String FIND_ALL = "select * from education_degree;";

    @Override
    public List<EducationDegree> findAll() {
        List<EducationDegree> educationDegreeList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int educationDegreeId = resultSet.getInt("education_degree_id");
                String educationDegreeName = resultSet.getString("education_degree_name");

                EducationDegree educationDegree = new EducationDegree(educationDegreeId, educationDegreeName);
                educationDegreeList.add(educationDegree);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return educationDegreeList;
    }
}
