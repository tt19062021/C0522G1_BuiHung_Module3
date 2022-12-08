package furama_resort.repository;

import furama_resort.model.Contract;

import java.util.List;

public interface IContractRepository {
    List<Contract> selectAll();
}
