package furama_resort.repository.impl;

import furama_resort.model.Position;
import furama_resort.repository.BaseRepository;
import furama_resort.repository.IPositionRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PositionRepository implements IPositionRepository {
    private static final String FIND_ALL = "select * from position;";

    @Override
    public List<Position> findAll() {
        List<Position> positionList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int positionId = resultSet.getInt("position_id");
                String positionName = resultSet.getString("position_name");

                Position position = new Position(positionId, positionName);
                positionList.add(position);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return positionList;
    }
}
