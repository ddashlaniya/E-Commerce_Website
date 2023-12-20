package bean;

public class OrderBean extends CartBean{
	
	private int orderId;
	private String custAddress;
	private String dateTime;
	
	public OrderBean()
	{
		
	}

	public OrderBean(int orderId, String custAddress, String dateTime) {
		super();
		this.orderId = orderId;
		this.custAddress = custAddress;
		this.dateTime = dateTime;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public String getCustAddress() {
		return custAddress;
	}

	public void setCustAddress(String custAddress) {
		this.custAddress = custAddress;
	}

	public String getDateTime() {
		return dateTime;
	}

	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}

	@Override
	public String toString() {
		return "OrderBean [orderId=" + orderId + ", custAddress=" + custAddress + ", dateTime=" + dateTime
				+ ", discount=" + discount + ", productId=" + productId + ", productPrices=" + productPrices + "]";
	}
	 
}
