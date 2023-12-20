package db.dto;

public class ChartDTO { //차트

	public int chart_number;
	public int patient_number;
	public String treatment_content;
	
	
	//생성자
	public ChartDTO() {}
	public ChartDTO(int chart_number, int patient_number, String treatment_content) {
		super();
		this.chart_number = chart_number;
		this.patient_number = patient_number;
		this.treatment_content = treatment_content;
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
	
	
	
}
