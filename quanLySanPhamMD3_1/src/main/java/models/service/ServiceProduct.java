package models.service;

import models.models.Product;

import java.security.PublicKey;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

public class ServiceProduct implements IServiceProduct{
    List<Product> products = new ArrayList<>();

    public ServiceProduct() {
        products.add(new Product(1,"Sang tao 1", 10,20,"Mô tả 1"));
        products.add(new Product(2,"Sang tao 2", 20,40,"Mô tả 2"));
        products.add(new Product(3,"Sang tao 3", 30,60,"Mô tả 3"));
        products.add(new Product(4,"Sang tao 4", 40,80,"Mô tả 4"));
        products.add(new Product(5,"Sang tao 5", 50,100,"Mô tả 5"));
        products.add(new Product(6,"Sang tao 6", 60,120,"Mô tả 6"));
    }

    @Override
    public List<Product> getProducts() {
        return products;
    }

    @Override
    public void creat(Product product) {
        products.add(product);
    }

    @Override
    public void update(int id, Product product) {
        products.remove(findById(id));
        products.add(product);
    }

    @Override
    public void remove(int id) {
        products.remove(findById(id));
    }

    @Override
    public Product findById(int id) {
        for (Product product : products) {
            if(product.getId() == id) {
                return product;
            }
        }
        return null;
    }

    @Override
    public List<Product> searchByName(String name) {
        List<Product> searchList = new ArrayList<>();
        for (Product product: products) {
            if(product.getName().toLowerCase().contains(name.toLowerCase())){
                searchList.add(product);
            }
        }
        return searchList;
    }
}
