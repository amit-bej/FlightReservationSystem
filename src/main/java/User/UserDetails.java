package User;

public class UserDetails {

	//String UserId;
	String Password;
	String First_Name;
	String Last_Name;
	String DOB;
	int Age;
	String Gender; 
	String Address;
	Long PhoneNo;
	public UserDetails( String first_Name, String last_Name, int age,
			String gender, String address, long phoneNo,String password) {
		super();
		Password = password;
		First_Name = first_Name;
		Last_Name = last_Name;
		//DOB = dOB;
		Age = age;
		Gender = gender;
		Address = address;
		PhoneNo = phoneNo;

	}
	
	



	/*public String getUserId() {
		return UserId;
	}
	public void setUserId(String userId) {
		UserId = userId;
	}*/
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public String getFirst_Name() {
		return First_Name;
	}
	public void setFirst_Name(String first_Name) {
		First_Name = first_Name;
	}
	public String getLast_Name() {
		return Last_Name;
	}
	public void setLast_Name(String last_Name) {
		Last_Name = last_Name;
	}
	//public String getDOB() {
	//	return DOB;
	//}
	//public void setDOB(String dOB) {
	///	DOB = dOB;
	//}
	public int getAge() {
		return Age;
	}
	public void setAge(int age) {
		Age = age;
	}
	public String getGender() {
		return Gender;
	}
	public void setGender(String gender) {
		Gender = gender;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public Long getPhoneNo() {
		return PhoneNo;
	}
	public void setPhoneNo(Long phoneNo) {
		PhoneNo = phoneNo;
	}
	/*public int getLoginStatus() {
		return LoginStatus;
	}
	public void setLoginStatus(int loginStatus) {
		LoginStatus = loginStatus;
	}
	*/
}
