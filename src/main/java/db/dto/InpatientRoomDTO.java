package db.dto;

public class InpatientRoomDTO { //입원실

	 public int inpatient_room_number;
	 public int patient_number;
	
	 //생성자
	 public InpatientRoomDTO() {}
	 public InpatientRoomDTO(int inpatient_room_number, int patient_number) {
		super();
		this.inpatient_room_number = inpatient_room_number;
		this.patient_number = patient_number;
	}
	 
	//메소드
	public int getInpatient_room_number() {
		return inpatient_room_number;
	}
	public void setInpatient_room_number(int inpatient_room_number) {
		this.inpatient_room_number = inpatient_room_number;
	}
	public int getPatient_number() {
		return patient_number;
	}
	public void setPatient_number(int patient_number) {
		this.patient_number = patient_number;
	}
	 
	 
}
