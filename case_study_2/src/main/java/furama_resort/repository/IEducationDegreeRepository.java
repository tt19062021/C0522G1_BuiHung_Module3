package furama_resort.repository;

import furama_resort.model.EducationDegree;

import java.util.List;

public interface IEducationDegreeRepository {
    List<EducationDegree> findAll();
}
