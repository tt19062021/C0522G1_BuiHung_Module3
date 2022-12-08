package furama_resort.service.impl;

import furama_resort.model.EducationDegree;
import furama_resort.repository.IEducationDegreeRepository;
import furama_resort.repository.impl.EducationDegreeRepository;
import furama_resort.service.IEducationDegreeService;

import java.util.List;

public class EducationDegreeService implements IEducationDegreeService {
    private static IEducationDegreeRepository iEducationDegreeRepository = new EducationDegreeRepository();
    @Override
    public List<EducationDegree> findAll() {
        return iEducationDegreeRepository.findAll();
    }
}
