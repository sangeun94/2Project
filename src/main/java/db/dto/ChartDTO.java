package db.dto;

public class ChartDTO { //차트

	public int chart_number;
	public int patient_number;
	public String treatment_content;
	public String hospitalization_status;
	
	//생성자
	public ChartDTO() {}
	public ChartDTO(int chart_number, int patient_number, String treatment_content, String hospitalization_status) {
		super();
		this.chart_number = chart_number;
		this.patient_number = patient_number;
		this.treatment_content = treatment_content;
		this.hospitalization_status = hospitalization_status;
	}
	
	//메소드
	public int getChart_number() {
		return chart_number;
	}
	public void setChart_number(int chart_number) {
		this.chart_number = chart_number;
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
	public String getHospitalization_status() {
		return hospitalization_status;
	}
	public void setHospitalization_status(String hospitalization_status) {
		this.hospitalization_status = hospitalization_status;
	}
		
	
	

	
	
	
}
