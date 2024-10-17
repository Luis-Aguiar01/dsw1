package br.edu.ifsp.dsw1;

import java.util.Comparator;
import java.util.LinkedList;
import java.util.List;

public class ContactsBean {

	private final List<Contact> contacts;
	
	public ContactsBean() {
		contacts = new LinkedList<>();
	}
	
	public void insertContact(Contact contact) {
		if (contact != null) {
			contacts.add(contact);
		}
	}
	
	public void removeContact(Contact contact) {
		contacts.remove(contact);
	}
	
	public Contact findById(Long id) {
		return contacts.stream()
				.filter(c -> c.getId().equals(id))
				.findFirst()
				.orElseThrow(
						() -> new IllegalArgumentException("Not found contact with " + id + " id.")
				);
	}
	
	public List<Contact> findAll() {
		return contacts.stream()
				.sorted(Comparator.comparing(Contact::getName))
				.toList();
	}	
}
