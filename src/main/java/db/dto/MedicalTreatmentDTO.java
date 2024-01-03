package db.dto;

public class MedicalTreatmentDTO { //진료
	
	public int treatment_number;
	public String treatment_date;
	public String treatment_time;
	public String employee_number;
	public int patient_number;
	public String hospitalization_status;
	public String treatment_content;
	
	public String department_name;
	public String employee_name;
	public String patient_name;	
		
	//생성자
	public MedicalTreatmentDTO() {}
	
	public MedicalTreatmentDTO(int treatment_number, String treatment_date, String treatment_time,
			String employee_number, int patient_number, String hospitalization_status, String treatment_content) {
		super();
		this.treatment_number = treatment_number;
		this.treatment_date = treatment_date;
		this.treatment_time = treatment_time;
		this.employee_number = employee_number;
		this.patient_number = patient_number;
		this.hospitalization_status = hospitalization_status;
		this.treatment_content = treatment_content;
	}
	
	public MedicalTreatmentDTO(int treatment_number, String treatment_date, String treatment_time,
			int patient_number, String patient_name, String treatment_content) {
		super();
		this.treatment_number = treatment_number;
		this.treatment_date = treatment_date;
		this.treatment_time = treatment_time;
		this.patient_number = patient_number;
		this.treatment_content = treatment_content;
		this.patient_name = patient_name;
	}
	
	public MedicalTreatmentDTO(int treatment_number, String treatment_date, String treatment_time,
			String employee_number, int patient_number, String patient_name, String hospitalization_status, 
			String treatment_content) {
		super();
		this.treatment_number = treatment_number;
		this.treatment_date = treatment_date;
		this.treatment_time = treatment_time;
		this.employee_number = employee_number;
		this.patient_number = patient_number;
		this.hospitalization_status = hospitalization_status;
		this.treatment_content = treatment_content;
		this.patient_name = patient_name;
	}
	
	
	public MedicalTreatmentDTO(int treatment_number, String treatment_date, String treatment_time,
			String hospitalization_status, String department_name, String employee_name, 
			int patient_number, String patient_name, String treatment_content) {
		super();
		this.treatment_number = treatment_number;
		this.treatment_date = treatment_date;
		this.treatment_time = treatment_time;
		this.patient_number = patient_number;
		this.hospitalization_status = hospitalization_status;
		this.treatment_content = treatment_content;
		this.department_name = department_name;
		this.employee_name = employee_name;
		this.patient_name = patient_name;
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

	public String getTreatment_time() {
		return treatment_time;
	}

	public void setTreatment_time(String treatment_time) {
		this.treatment_time = treatment_time;
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

	public String getHospitalization_status() {
		return hospitalization_status;
	}

	public void setHospitalization_status(String hospitalization_status) {
		this.hospitalization_status = hospitalization_status;
	}

	public String getTreatment_content() {
		return treatment_content;
	}

	public void setTreatment_content(String treatment_content) {
		this.treatment_content = treatment_content;
	}

	public String getDepartment_name() {
		return department_name;
	}

	public void setDepartment_name(String department_name) {
		this.department_name = department_name;
	}

	public String getEmployee_name() {
		return employee_name;
	}

	public void setEmployee_name(String employee_name) {
		this.employee_name = employee_name;
	}

	public String getPatient_name() {
		return patient_name;
	}

	public void setPatient_name(String patient_name) {
		this.patient_name = patient_name;
	}

	

	
	
}
