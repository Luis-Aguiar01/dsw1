package br.com.dsw1.exercicio2;

import java.util.LinkedList;
import java.util.List;

public class ListOfProducts {
	
	private final List<Product> products;
	private OrderStrategy strategy;
	
	public ListOfProducts() {
		products = new LinkedList<>();
	}
	
	public void addProduct(Product product) {
		products.add(product);
	}
	
	public void setOrderStrategy(OrderStrategy strategy) {
		this.strategy = strategy;
	}
	
	public void order() {
		strategy.order(products);
	}
	
	public void printProducts() {
		System.out.println("\n------------ PRODUCTS ---------------\n");
		
		for (var product : products) {
			System.out.println(product);
		}
	}
}
