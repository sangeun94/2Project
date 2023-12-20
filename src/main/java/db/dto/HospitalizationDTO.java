package db.dto;

public class HospitalizationDTO { //입원
	
	public String hospitalization_date;
	public String discharge_date;
	public int patient_number;
	
	//생성자
	public HospitalizationDTO() {}
	public HospitalizationDTO(String hospitalization_date, String discharge_date, int patient_number) {
		super();
		this.hospitalization_date = hospitalization_date;
		this.discharge_date = discharge_date;
		this.patient_number = patient_number;
	}
	
	//메소드
	public String getHospitalization_date() {
		return hospitalization_date;
	}
	public void setHospitalization_date(String hospitalization_date) {
		this.hospitalization_date = hospitalization_date;
	}
	public String getDischarge_date() {
		return discharge_date;
	}
	public void setDischarge_date(String discharge_date) {
		this.discharge_date = discharge_date;
	}
	public int getPatient_number() {
		return patient_number;
	}
	public void setPatient_number(int patient_number) {
		this.patient_number = patient_number;
	}
	
	
	
}
