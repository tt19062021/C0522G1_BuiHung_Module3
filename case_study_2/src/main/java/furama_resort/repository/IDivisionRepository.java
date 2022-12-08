package furama_resort.repository;

import furama_resort.model.Division;

import java.util.List;

public interface IDivisionRepository {
    List<Division> findAll();
}
