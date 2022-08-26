package mvc.repository.impl;

import com.sun.javafx.collections.MappingChange;
import mvc.model.Product;
import mvc.repository.IProductReponsitory;

import java.util.*;

public class ProductReponsitory implements IProductReponsitory {
    private static Map<Integer, Product> productList = new HashMap<>();

    static {
        productList.put(1, new Product(1, "Bánh Kem", 150000, "kem socolate", "Đồng Thạnh"));
    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(productList.values());
    }

    @Override
    public void save(Product product) {
        productList.put(product.getId(), product);
    }

    @Override
    public void delete(int id) {
        productList.remove(id);
    }

    @Override
    public String view(int id) {
        return null;
    }

    @Override
    public void update(int id, Product product) {
        productList.put(id,product);
    }


    @Override
    public Product findById(int id) {
        return productList.get(id);
    }


    @Override
    public List<Product> search(String name) {
        List<Product> list = new ArrayList<>();
        Set<Integer> set = productList.keySet();
        for (Integer integer : set) {
            if (productList.get(integer).getProductName().contains(name)) {
                list.add(productList.get(integer));
            }
        }
        return list;
    }
}

