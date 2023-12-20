package bean;

public class Userbean {

	private String name;
	private String email;
	private String phone;
	private String password;
	private String gender;
	private String userType;
	private int userId;
	
	public Userbean() {
	
	}

	public Userbean(String name, String email, String phone, String password, String gender,int userId) {
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.password = password;
		this.gender = gender;
		this.userId = userId;
	}
	
	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
		System.out.println("Bean user=>"+name);
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
		System.out.println(email);
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}



	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "Userbean [name=" + name + ", email=" + email + ", phone=" + phone + ", password=" + password
				+ ", gender=" + gender + " ,usertype="+userType+"]";
	}

	

	
}
