package br.com.dsw1.exercicio1;

public class Purchasing implements ProductObserver {

	@Override
	public void update(Product product) {
		if (product.getQuantity() < 10) {
			product.increaseStock(100);
			System.out.println("Compra de 100 unidades do produto " + product.getName());
			System.out.println("Quantidade atual: " + product.getQuantity());
		}
	}	
}
