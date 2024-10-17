package br.com.dsw1.exercicio1;

import java.util.LinkedList;
import java.util.List;

public class Product implements ProductSubject {
	
	private String name;
	private int quantity;
	private double price;
	private final List<ProductObserver> observers;
	
	public Product(String name, int quantity, double price) {
		this.name = name;
		this.quantity = quantity;
		this.price = price;
		observers = new LinkedList<>();
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}
	
	public boolean reduceStock(int quantity) {
		if (this.quantity >= quantity) {
			this.quantity -= quantity;
			notifyObservers();
			return true;
		}
		
		return false;
	}
	
	public void increaseStock(int quantity) {
		if (quantity > 0) {
			this.quantity += quantity;
			notifyObservers();
		}
	}

	@Override
	public void attach(ProductObserver observer) {
		if (observer != null) {
			observers.add(observer);
		}
	}

	@Override
	public void detach(ProductObserver observer) {
		if (observer != null) {
			observers.remove(observer);
		}
	}

	@Override
	public void notifyObservers() {
		for (var observer : observers) {
			observer.update(this);
		}
	}
	
	@Override
	public String toString() {
		return "Product Name: " + name +
				"\nPrice: R$" + price +
				"\nQuantity: " + quantity;
	}
}
