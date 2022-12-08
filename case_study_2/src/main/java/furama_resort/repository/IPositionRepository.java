package furama_resort.repository;

import furama_resort.model.Position;

import java.util.List;

public interface IPositionRepository {
        List<Position> findAll();
}
