package br.com.dsw1.exercicio1;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Main {
	
	private static final Scanner scanner = new Scanner(System.in);
	
	public static void main(String[] args) {
		
		var marketing = new Marketing();
		var purchasing = new Purchasing();
		List<Product> products = new ArrayList<>(3);
		int choice;
		
		do {
			System.out.println("[1] - Cadastrar Produto.");
			System.out.println("[2] - Vender Produto.");
			System.out.println("[3] - Adicionar Produto.");
			System.out.println("[0] - Sair.");
			
			System.out.println("Escolha: ");
			choice = scanner.nextInt();
			
			scanner.nextLine();
			
			switch (choice) {
				case 1:
					var product = createNewProduct();
					product.attach(marketing);
					product.attach(purchasing);
					products.add(product);
					break;
				case 2:
					sell(products);
					break;
				case 3:
					buy(products);
					break;
			}
		} while (choice != 0);
		
		scanner.close();
	}
	
	public static Product createNewProduct() {
		System.out.println("Name of product: ");
		var name = scanner.nextLine();
		
		System.out.println("Quantity of product: ");
		var quantity = scanner.nextInt();
		
		System.out.println("Price of product: ");
		var price = scanner.nextDouble();
		
		return new Product(name, quantity, price);
	}
	
	public static void sell(List<Product> products) {
		printProducts(products);
		
		var productID = selectProductID();
		
		if (productID >= 0 && productID < 3) {
			var findProduct = products.get(productID);
			
			System.out.println("Digite a quantidade para vender: ");
			var quantityToSell = scanner.nextInt();
			
			findProduct.reduceStock(quantityToSell);
		}
	}
	
	public static void buy(List<Product> products) {
		printProducts(products);
		
		var productID = selectProductID();
		
		if (productID >= 0 && productID < 3) {
			var findProduct = products.get(productID);
			
			System.out.println("Digite a quantidade de produto para adicionar no estoque: ");
			int quantityToAdd = scanner.nextInt();
			
			findProduct.increaseStock(quantityToAdd);
		}
	}
	
	public static void printProducts(List<Product> products) {
		int id = 1;
		
		for (var product : products) {
			System.out.println("--------------------------------------");
			System.out.println("ID: " + id + "\n" + product);
			System.out.println("--------------------------------------\n");
			id++;
		}
	}
	
	public static int selectProductID() {
		System.out.println("Digite o ID do produto: ");
		var productID = scanner.nextInt();
		productID--;
		
		return productID;
	}
}
