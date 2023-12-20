package db.dto;

public class MedicalTreatmentDTO { //진료
	
	public int treatment_number;
	public String treatment_date;
	public String employee_number;
	public int patient_number;
	public String treatment_content;
		
	//생성자
	public MedicalTreatmentDTO() {}
	public MedicalTreatmentDTO(int treatment_number, String treatment_date, String employee_number, int patient_number,
			String treatment_content) {
		super();
		this.treatment_number = treatment_number;
		this.treatment_date = treatment_date;
		this.employee_number = employee_number;
		this.patient_number = patient_number;
		this.treatment_content = treatment_content;
	}
	
	
	//메소드
	public int getTreatment_number() {
		return treatment_number;
	}
	public void setTreatment_number(int treatment_number) {
		this.treatment_number = treatment_number;
	}
	public String getTreatment_date() {
		return treatment_date;
	}
	public void setTreatment_date(String treatment_date) {
		this.treatment_date = treatment_date;
	}
	public String getEmployee_number() {
		return employee_number;
	}
	public void setEmployee_number(String employee_number) {
		this.employee_number = employee_number;
	}
	public int getPatient_number() {
		return patient_number;
	}
	public void setPatient_number(int patient_number) {
		this.patient_number = patient_number;
	}
	public String getTreatment_content() {
		return treatment_content;
	}
	public void setTreatment_content(String treatment_content) {
		this.treatment_content = treatment_content;
	}
	
	
	
}
