
package forms;

import domain.CreditCard;
import domain.Newspaper;

public class SubscribeForm {

	private CreditCard	creditcard;
	private Newspaper	newspaper;


	public CreditCard getCreditCard() {
		return this.creditcard;
	}

	public void setCreditCard(final CreditCard creditcard) {
		this.creditcard = creditcard;
	}

	public Newspaper getNewspapers() {
		return this.newspaper;
	}

	public void setNewspaper(final Newspaper newspaper) {
		this.newspaper = newspaper;
	}

}
