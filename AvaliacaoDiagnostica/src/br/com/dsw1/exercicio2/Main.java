package br.com.dsw1.exercicio2;

import java.util.Scanner;

public class Main {
	
	private final static Scanner scanner = new Scanner(System.in);
	
	public static void main(String[] args) {
		
		final ListOfProducts products = new ListOfProducts();
		
		products.addProduct(new Product("Mouse", 50.00, 20));
		products.addProduct(new Product("Keyboard", 120.00, 5));
		products.addProduct(new Product("Headset", 350.00, 2));
		products.addProduct(new Product("Mouse pad", 15, 50));
		
		int choice;
		
		do {
			System.out.println("1 - Order by name.");
			System.out.println("2 - Order by price.");
			System.out.println("3 - Order by quantity.");
			System.out.println("0 - Finish.");
			
			System.out.println("Choice: ");
			choice = scanner.nextInt();
			
			switch (choice) {
				case 1:
					printProductsOrdered(products, new OrderByName());
					break;
				case 2:
					printProductsOrdered(products, new OrderByPrice());
					break;
				case 3:
					printProductsOrdered(products, new OrderByQuantity());
					break;
			}

		} while (choice != 0);
		
		scanner.close();
	}
	
	public static void printProductsOrdered(ListOfProducts products, OrderStrategy strategy) {
		products.setOrderStrategy(strategy);
		products.order();
		products.printProducts();
	}
}
