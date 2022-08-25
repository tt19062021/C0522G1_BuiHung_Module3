package mvc.repository.impl;

import mvc.model.Product;
import mvc.repository.IProductReponsitory;

import java.util.ArrayList;
import java.util.List;

public class ProductReponsitory implements IProductReponsitory {
    private static List<Product> productList = new ArrayList<>();

    static {
        productList.add(new Product(1, "Bánh Kem", 150000, "kem socolate", "Đồng Thạnh"));
    }

    @Override
    public List<Product> findAll() {
        return productList;
    }

    @Override
    public void save(Product product) {
        productList.add(product);
    }

    @Override
    public Product findById(int id) {
        return productList.get(id);
    }

    @Override
    public void update(int id, Product product) {
        productList.add( product);
    }

    @Override
    public void remove(int id) {
        productList.remove(id);
    }

    @Override
    public List<Product> search(String name) {
        List<Product> searchList = new ArrayList<>();
        for (Product item : productList) {
            if (item.getProductName().contains(name)){
                searchList.add(item);
            }
        }
        return searchList;
    }

    @Override
    public Product searchByID(int id) {

        return productList.get(id);
    }
}
