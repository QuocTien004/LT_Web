package vn.iotstar.demo.Service;

import java.util.List;

import vn.iotstar.demo.Entity.Product;

public interface ProductServices {
	void delete(Long id);
	
	Product get(Long id);
	
	Product save(Product product);
	
	List<Product> listAll();
}
