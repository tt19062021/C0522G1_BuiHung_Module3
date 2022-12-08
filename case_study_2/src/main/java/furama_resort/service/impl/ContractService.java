package furama_resort.service.impl;

import furama_resort.model.Contract;
import furama_resort.repository.IContractRepository;
import furama_resort.repository.impl.ContractRepository;

import java.util.List;

public class ContractService implements IContractRepository {
    private static IContractRepository iContractRepository = new ContractRepository();
    @Override
    public List<Contract> selectAll() {
        return iContractRepository.selectAll();
    }
}
