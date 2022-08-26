package mvc.service.impl;

import mvc.model.Product;
import mvc.repository.IProductReponsitory;
import mvc.repository.impl.ProductReponsitory;
import mvc.service.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    private static IProductReponsitory iProductReponsitory = new ProductReponsitory();

    @Override
    public List<Product> findAll() {
        return iProductReponsitory.findAll();
    }


    @Override
    public List<Product> searchByName(String name) {
        return iProductReponsitory.search(name);
    }

    @Override
    public Product findById(int id) {
        return iProductReponsitory.findById(id);
    }

    @Override
    public void save(Product product) {
        iProductReponsitory.save(product);
    }

    @Override
    public void delete(int id) {
        iProductReponsitory.delete(id);
    }

    @Override
    public void update(int id, Product product) {
        iProductReponsitory.update(id,product);
    }

}
