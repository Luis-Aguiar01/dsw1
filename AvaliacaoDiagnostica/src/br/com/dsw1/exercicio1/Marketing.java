package br.com.dsw1.exercicio1;

public class Marketing implements ProductObserver {

	@Override
	public void update(Product product) {
		if (product.getQuantity() > 100) {
			product.setPrice(product.getPrice() * 0.9);
			System.out.println("Promoção: Produto " + product.getName() + " price: R$" + product.getPrice());
		}
		else if (product.getQuantity() < 50) {
			product.setPrice(product.getPrice() * 1.18);
			System.out.println("Aumento: Produto " + product.getName() + " price: R$" + product.getPrice());
		}
	}
}
