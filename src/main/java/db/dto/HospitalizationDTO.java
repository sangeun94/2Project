package db.dto;

public class HospitalizationDTO { //입원
	
	public int hospitalization_number;
	public String hospitalization_date;
	public String discharge_date;
	public String inpatient_room_number;
	public int patient_number;
	
	public String patient_name;
	
	//생성자
	public HospitalizationDTO() {}	
	
	public HospitalizationDTO(int hospitalization_number, String hospitalization_date, String discharge_date,
			String inpatient_room_number, int patient_number) {
		super();
		this.hospitalization_number = hospitalization_number;
		this.hospitalization_date = hospitalization_date;
		this.discharge_date = discharge_date;
		this.inpatient_room_number = inpatient_room_number;
		this.patient_number = patient_number;
	}
	
	public HospitalizationDTO(int hospitalization_number, String hospitalization_date, String discharge_date,
			String inpatient_room_number, int patient_number, String patient_name) {
		super();
		this.hospitalization_number = hospitalization_number;
		this.hospitalization_date = hospitalization_date;
		this.discharge_date = discharge_date;
		this.inpatient_room_number = inpatient_room_number;
		this.patient_number = patient_number;
		this.patient_name = patient_name;
	}

	//메소드
	public int getHospitalization_number() {
		return hospitalization_number;
	}

	public void setHospitalization_number(int hospitalization_number) {
		this.hospitalization_number = hospitalization_number;
	}

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

	public String getInpatient_room_number() {
		return inpatient_room_number;
	}

	public void setInpatient_room_number(String inpatient_room_number) {
		this.inpatient_room_number = inpatient_room_number;
	}

	public int getPatient_number() {
		return patient_number;
	}

	public void setPatient_number(int patient_number) {
		this.patient_number = patient_number;
	}
	
	public String getPatient_name() {
        return patient_name;
    }

    public void setPatient_name(String patient_name) {
        this.patient_name = patient_name;
    }
	
	
}
