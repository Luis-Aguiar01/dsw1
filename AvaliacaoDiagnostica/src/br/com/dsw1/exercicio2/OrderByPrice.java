package br.com.dsw1.exercicio2;

import java.util.Comparator;
import java.util.List;

public class OrderByPrice implements OrderStrategy {

	@Override
	public void order(List<Product> products) {
		products.sort(Comparator.comparing(Product::getPrice));
	}
}
