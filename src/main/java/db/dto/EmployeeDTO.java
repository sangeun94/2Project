package db.dto;

public class EmployeeDTO { //직원

	public String employee_number; //사번
	public int employee_code;
	public String employment_status;
	public String password;
	public String name;
	public String gender;
	public String phone_number;
	public String address;
	public String email;
	public String position;
	public int department_number;
	public String employee_category;
	public String department_name;
	
	//생성자
	public EmployeeDTO() {}
	public EmployeeDTO(String employee_number, String password) {
		this.employee_number = employee_number;
		this.password = password;
	}
	public EmployeeDTO(String employee_number, int employee_code, String employment_status, String password, String name,
			String gender, String phone_number, String address, String email, String position, int department_number) {
		super();
		this.employee_number = employee_number;
		this.employee_code = employee_code;
		this.employment_status = employment_status;
		this.password = password;
		this.name = name;
		this.gender = gender;
		this.phone_number = phone_number;
		this.address = address;
		this.email = email;
		this.position = position;
		this.department_number = department_number;
	}
	
	
	//직원 목록 생성자
	public EmployeeDTO(String employee_number, String employee_category, String position, String name,
			String phone_number, String email) {
		super();
		this.employee_number = employee_number;
		this.employee_category = employee_category;
		this.position = position;
		this.name = name;
		this.phone_number = phone_number;
		this.email = email;
	}
	
	//의료진 목록출력용 생성자
	public EmployeeDTO(String name, int department_number) {
		super();
		this.name = name;
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
	public void setEmployee_code(int employment_code) {
		this.employee_code = employee_code;
	}
	public String getEmployment_status() {
		return employment_status;
	}
	public void setEmployment_status(String employment_status) {
		this.employment_status = employment_status;
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
	public String getEmployee_category() {
		return employee_category;
	}
	public void setEmployee_category(String employee_category) {
		this.employee_category = employee_category;
	}
	public String getDepartment_name() {
		return department_name;
	}
	public void setDepartment_name(String department_Name) {
		this.department_name = department_Name;
	}
	
	
	
	
	
}
