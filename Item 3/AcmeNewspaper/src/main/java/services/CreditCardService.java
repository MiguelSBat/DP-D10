
package services;

import java.util.Collection;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import repositories.CreditCardRepository;
import domain.CreditCard;
import domain.Customer;
import domain.Newspaper;

@Service
@Transactional
public class CreditCardService {

	//Managed Repository ----
	@Autowired
	private CreditCardRepository	creditCardRepository;

	@Autowired
	private CustomerService			customerService;

	@Autowired
	private ActorService			actorService;

	@Autowired
	private NewspaperService		newspaperService;


	//Constructors
	public CreditCardService() {
		super();
	}

	public CreditCard create() {
		CreditCard result;

		result = new CreditCard();

		return result;
	}

	public Collection<CreditCard> findAll() {
		Collection<CreditCard> result;

		result = this.creditCardRepository.findAll();

		return result;
	}

	public void delete(final CreditCard creditCard) {

		this.creditCardRepository.delete(creditCard);

	}

	public CreditCard save(final CreditCard creditCard) {
		CreditCard result;
		Collection<CreditCard> aux;
		Customer customer;
		customer = (Customer) this.actorService.findByPrincipal();
		result = this.creditCardRepository.save(creditCard);

		//a�ado la creditcard al customer
		aux = customer.getCreditCard();
		aux.add(result);
		customer.setCreditCard(aux);
		this.customerService.save(customer);
		return result;
	}

	public CreditCard findOne(final int creditCardId) {
		CreditCard result;

		result = this.creditCardRepository.findOne(creditCardId);
		Assert.notNull(result);

		return result;
	}

	public void flush() {
		this.creditCardRepository.flush();
	}

	public Collection<CreditCard> findByCustomer(final int customerid) {
		return this.creditCardRepository.findByCustomer(customerid);
	}

	public void subscribe(final Newspaper newspaper, final CreditCard creditcard) {
		Customer customer;
		customer = (Customer) this.actorService.findByPrincipal();
		Assert.isTrue(customer.getCreditCard().contains(creditcard));

		final Collection<Newspaper> aux = creditcard.getNewspapers();
		aux.add(newspaper);
		creditcard.setNewspapers(aux);

	}

}
