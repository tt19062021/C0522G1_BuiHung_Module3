package furama_resort.model;

public class ContractDetail {
    private int id;
    private int contractId;
    private int attachFacility;
    private int quantity;

    public ContractDetail() {
    }

    public ContractDetail(int id, int contractId, int attachFacility, int quantity) {
        this.id = id;
        this.contractId = contractId;
        this.attachFacility = attachFacility;
        this.quantity = quantity;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getContractId() {
        return contractId;
    }

    public void setContractId(int contractId) {
        this.contractId = contractId;
    }

    public int getAttachFacility() {
        return attachFacility;
    }

    public void setAttachFacility(int attachFacility) {
        this.attachFacility = attachFacility;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
