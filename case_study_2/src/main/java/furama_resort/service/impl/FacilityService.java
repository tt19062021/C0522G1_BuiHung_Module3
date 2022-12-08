package furama_resort.service.impl;

import furama_resort.model.Facility;
import furama_resort.repository.IFacilityRepository;
import furama_resort.repository.impl.FacilityRepository;
import furama_resort.service.IFacilityService;

import java.util.List;

public class FacilityService implements IFacilityService {
    private static IFacilityRepository iFacilityRepository = new FacilityRepository();
    @Override
    public List<Facility> selectAll() {
        return iFacilityRepository.selectAll();
    }
}
