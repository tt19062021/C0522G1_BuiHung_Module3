package furama_resort.service.impl;

import furama_resort.model.Position;
import furama_resort.repository.IPositionRepository;
import furama_resort.repository.impl.PositionRepository;
import furama_resort.service.IPositionService;

import java.util.List;

public class PositionService implements IPositionService {
    private static IPositionRepository iPositionRepository = new PositionRepository();

    @Override
    public List<Position> findAll() {
        return iPositionRepository.findAll();
    }
}
