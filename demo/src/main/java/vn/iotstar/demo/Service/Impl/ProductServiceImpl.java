package vn.iotstar.demo.Service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vn.iotstar.demo.Entity.Product;
import vn.iotstar.demo.Repository.ProductRepository;
import vn.iotstar.demo.Service.ProductServices;

@Service
public class ProductServiceImpl implements ProductServices {
    @Autowired
    private ProductRepository repo;

    public ProductServiceImpl(ProductRepository repo) {
        this.repo = repo;
    }

    @Override
    public void delete(Long id) {
        repo.deleteById(id); 
    }

    @Override
    public Product get(Long id) {
        return repo.findById(id).get(); 
    }

    @Override
    public Product save(Product product) {
        return repo.save(product); 
    }

    @Override
    public List<Product> listAll() {
        return repo.findAll();
    }
}
