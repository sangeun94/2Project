package db.dto;

public class MedicalDepartmentDTO { //진료과
	
	public int department_number;
	public String department_name;
	public String tel;
	
	//생성자
	public MedicalDepartmentDTO() {}
	public MedicalDepartmentDTO(int department_number, String department_name, String tel) {
		super();
		this.department_number = department_number;
		this.department_name = department_name;
		this.tel = tel;
	}
	
	
	//메소드
	public int getDepartment_number() {
		return department_number;
	}
	public void setDepartment_number(int department_number) {
		this.department_number = department_number;
	}
	public String getDepartment_name() {
		return department_name;
	}
	public void setDepartment_name(String department_name) {
		this.department_name = department_name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	
}
