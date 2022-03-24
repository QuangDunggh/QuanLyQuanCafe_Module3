package models.service;

import models.models.Product;

import java.util.List;

public interface IServiceProduct {
    List<Product> getProducts();
    void creat(Product product);
    void update(int id, Product product);
    void remove(int id);
    Product findById(int id);
    List<Product> searchByName(String name);
}
