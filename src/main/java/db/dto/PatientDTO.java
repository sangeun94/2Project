package db.dto;

public class PatientDTO { //환자
	
	public int patient_number;
	public int patient_status_code;
	public String id;
	public String password;
	public String email;
	public String name;
	public String jumin;
	public String phone_number;
	public String address;
	
	//생성자
	public PatientDTO() {}
	public PatientDTO(int patient_number, int patient_status_code, String id, String password, String email,
			String name, String jumin, String phone_number, String address) {
		super();
		this.patient_number = patient_number;
		this.patient_status_code = patient_status_code;
		this.id = id;
		this.password = password;
		this.email = email;
		this.name = name;
		this.jumin = jumin;
		this.phone_number = phone_number;
		this.address = address;
	}
	
	//테스트용 생성자
	public PatientDTO(String name, String phone_number) {
		super();
		this.name = name;
		this.phone_number = phone_number;
	}
	
	
	//메소드
	public int getPatient_number() {
		return patient_number;
	}
	public void setPatient_number(int patient_number) {
		this.patient_number = patient_number;
	}
	public int getPatient_status_code() {
		return patient_status_code;
	}
	public void setPatient_status_code(int patient_status_code) {
		this.patient_status_code = patient_status_code;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getJumin() {
		return jumin;
	}
	public void setJumin(String jumin) {
		this.jumin = jumin;
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
	
	
}
