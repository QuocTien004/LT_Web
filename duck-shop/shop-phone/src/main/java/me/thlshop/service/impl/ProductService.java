package me.thlshop.service.impl;

import java.util.List;

import javax.inject.Inject;

import me.thlshop.converter.ProductConverter;
import me.thlshop.dao.ICategoryDAO;
import me.thlshop.dao.IInformationDAO;
import me.thlshop.dao.IProductDAO;
import me.thlshop.dto.ProductDetailDTO;
import me.thlshop.entity.ProductEntity;
import me.thlshop.service.IProductService;

public class ProductService implements IProductService {

	@Inject
	private IProductDAO productDAO;
	
	@Inject
	private ICategoryDAO categoryDAO;

	@Inject
	private IInformationDAO informationDAO;
	
	@Inject ProductConverter productConverter;
	
	@Override
	public List<ProductEntity> findAll() {
		return productDAO.findAll();
	}

	@Override
	public ProductEntity findOne(Integer productId) {
		return productDAO.findOne(productId);
	}

	@Override
	public List<ProductEntity> findByBrand(Integer brandId) {
		return productDAO.findByBrand(brandId);
	}

	@Override
	public void update(ProductDetailDTO productDetailDTO) {
		ProductEntity productEntity = new ProductEntity();
		productEntity.setProductId(productDetailDTO.getProductId());
		productEntity.setProductName(productDetailDTO.getProductName());
		productEntity.setCategory(categoryDAO.findOne(productDetailDTO.getCategoryId()));
		if (productDetailDTO.getImageBig() != null) {
			productEntity.setImageBig(productDetailDTO.getImageBig());
		}
		if (productDetailDTO.getImageSmall() != null) {
			productEntity.setImageSmall(productDetailDTO.getImageSmall());
		}
		productEntity.setInfoId(informationDAO.findOne(productDetailDTO.getInfoId()));
		productEntity.setDescription(productDetailDTO.getDescription());
		productEntity.setPrice(productDetailDTO.getPrice());
		
		productDAO.update(productEntity);
	}

	@Override
	public Integer save(ProductDetailDTO productDetailDTO) {
		ProductEntity productEntity = new ProductEntity();
		productEntity.setProductId(productDetailDTO.getProductId());
		productEntity.setProductName(productDetailDTO.getProductName());
		productEntity.setCategory(categoryDAO.findOne(productDetailDTO.getCategoryId()));
		productEntity.setInfoId(informationDAO.findOne(productDetailDTO.getInfoId()));
		if (productDetailDTO.getImageBig() != null) {
			productEntity.setImageBig(productDetailDTO.getImageBig());
		}
		if (productDetailDTO.getImageSmall() != null) {
			productEntity.setImageSmall(productDetailDTO.getImageSmall());
		}
		productEntity.setDescription(productDetailDTO.getDescription());
		productEntity.setPrice(productDetailDTO.getPrice());
		
		return productDAO.insert(productEntity);
	}

	@Override
	public void delete(Integer productId) {
		ProductEntity product = productDAO.findOne(productId);
		productDAO.delete(productId);
		informationDAO.delete(product.getInfoId().getInfoId());
	}

	@Override
	public void updateByImage(ProductEntity productEntity) {
		productDAO.update(productEntity);
	}

	@Override
	public List<ProductEntity> search(String keyWord) {
		return productDAO.search(keyWord);
	}

	@Override
	public List<ProductEntity> findByCategory(Integer categoryId) {
		return productDAO.findByCategory(categoryId);
	}

	@Override
	public List<ProductEntity> findProductOutstanding() {
		return productDAO.findProductOutstanding();
	}

	@Override
	public Long productNumber() {
		return productDAO.productNumber();
	}

}
