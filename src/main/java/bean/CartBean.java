package bean;

public class CartBean extends Product{

	private int cartQuantity;
	
	public CartBean() {
		
	}

	public int getCartQuantity() {
		System.out.println("cart product quantity is => "+cartQuantity);
		return cartQuantity;
	}

	public void setCartQuantity(int cartQuantity) {
		this.cartQuantity= cartQuantity;
	}
	
}
