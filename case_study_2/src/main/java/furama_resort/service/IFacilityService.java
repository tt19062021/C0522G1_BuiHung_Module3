package furama_resort.service;

import furama_resort.model.Employee;
import furama_resort.model.Facility;

import java.util.List;

public interface IFacilityService {
    List<Facility> selectAll();

}
