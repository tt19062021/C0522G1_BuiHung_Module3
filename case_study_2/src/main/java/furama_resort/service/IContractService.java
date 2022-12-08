package furama_resort.service;

import furama_resort.model.Contract;

import java.util.List;

public interface IContractService {
    List<Contract> selectAll();
}
