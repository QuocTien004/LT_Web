package vn.iotstar.demo.Entity;

import jakarta.persistence.Column;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

public class Product {
	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	private Long id;
	@Column(columnDefinition = "nvarchar(255)")
	private String name;
	@Column(columnDefinition = "nvarchar(255)")
	private String brand;
	@Column(columnDefinition = "nvarchar(255)")
	private String madeinl;
	private float price;
}
