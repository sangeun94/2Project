package db.dto;

public class EmployeeDTO { //직원

	public String employee_number;
	public int employee_code;
	public String employee_status;
	public String password;
	public String name;
	public String gender;
	public String phone_number;
	public String address;
	public String email;
	public String position;
	public int department_number;
	
	//생성자
	public EmployeeDTO() {}
	public EmployeeDTO(String employee_number, int employee_code, String employee_status, String password, String name,
			String gender, String phone_number, String address, String email, String position, int department_number) {
		super();
		this.employee_number = employee_number;
		this.employee_code = employee_code;
		this.employee_status = employee_status;
		this.password = password;
		this.name = name;
		this.gender = gender;
		this.phone_number = phone_number;
		this.address = address;
		this.email = email;
		this.position = position;
		this.department_number = department_number;
	}
	
	//메소드
	public String getEmployee_number() {
		return employee_number;
	}
	public void setEmployee_number(String employee_number) {
		this.employee_number = employee_number;
	}
	public int getEmployee_code() {
		return employee_code;
	}
	public void setEmployee_code(int employee_code) {
		this.employee_code = employee_code;
	}
	public String getEmployee_status() {
		return employee_status;
	}
	public void setEmployee_status(String employee_status) {
		this.employee_status = employee_status;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhone_number() {
		return phone_number;
	}
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public int getDepartment_number() {
		return department_number;
	}
	public void setDepartment_number(int department_number) {
		this.department_number = department_number;
	}
	
	
	
	
	
}
