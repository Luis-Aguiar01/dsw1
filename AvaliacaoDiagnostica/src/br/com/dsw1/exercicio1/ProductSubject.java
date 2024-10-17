package br.com.dsw1.exercicio1;

public interface ProductSubject {
	void attach(ProductObserver observer);
	void detach(ProductObserver observer);
	void notifyObservers();
}
