package furama_resort.service.impl;

import furama_resort.model.Division;
import furama_resort.repository.IDivisionRepository;
import furama_resort.repository.impl.DivisionRepository;
import furama_resort.service.IDivisionService;

import java.util.List;

public class DivisionService implements IDivisionService {
    private static IDivisionRepository iDivisionRepository = new DivisionRepository();
    @Override
    public List<Division> findAll() {
        return iDivisionRepository.findAll();
    }
}
