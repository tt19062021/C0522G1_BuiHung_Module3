package furama_resort.repository;

import furama_resort.model.Employee;
import furama_resort.model.Facility;

import java.util.List;

public interface IFacilityRepository {
    List<Facility> selectAll();
}
