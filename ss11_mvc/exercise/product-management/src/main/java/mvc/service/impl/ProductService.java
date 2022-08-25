package mvc.service.impl;

import mvc.model.Product;
import mvc.repository.IProductReponsitory;
import mvc.repository.impl.ProductReponsitory;
import mvc.service.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    private IProductReponsitory iProductReponsitory = new ProductReponsitory();

    @Override
    public List<Product> display() {
        return iProductReponsitory.findAll();
    }

    @Override
    public void addNew(Product product) {
        iProductReponsitory.save(product);

    }

    @Override
    public void update(Product product) {
        iProductReponsitory.findById(product.getId());
    }


    @Override
    public void remove(int id) {
        iProductReponsitory.remove(id);
    }

    @Override
    public void view(int id) {

    }


    @Override
    public Product searchByID(int id) {
        return iProductReponsitory.searchByID(id);
    }

    @Override
    public List<Product> searchByName(String name) {
        return iProductReponsitory.search(name);
    }

    @Override
    public void save(Product product) {
        iProductReponsitory.save(product);
    }

}
