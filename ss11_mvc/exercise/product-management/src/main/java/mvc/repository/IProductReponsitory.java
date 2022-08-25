package mvc.repository;

import mvc.model.Product;

import java.util.List;

public interface IProductReponsitory {
    List<Product> findAll();

    void save(Product product);

    Product findById(int id);

    void update(int id, Product product);

    void remove(int id);
    List<Product> search(String name);
    Product searchByID(int id);
}
