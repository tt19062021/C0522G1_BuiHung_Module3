package mvc.service;

import mvc.model.Product;

import java.util.List;

public interface IProductService {
    List<Product> display();
    void addNew(Product product);
    void update( Product product);
    void remove(int id);
    void view(int id);

    Product searchByID(int id);
    List<Product> searchByName(String name);
    void save(Product product);
}
