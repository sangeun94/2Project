package db.dto;

public class MedicalRoomDTO { //진료실

	public int medical_room_number;
	public int employee_number;
	
	//생성자
	public MedicalRoomDTO() {}
	public MedicalRoomDTO(int medical_room_number, int employee_number) {
		super();
		this.medical_room_number = medical_room_number;
		this.employee_number = employee_number;
	}
	
	//메소드
	public int getMedical_room_number() {
		return medical_room_number;
	}
	public void setMedical_room_number(int medical_room_number) {
		this.medical_room_number = medical_room_number;
	}
	public int getEmployee_number() {
		return employee_number;
	}
	public void setEmployee_number(int employee_number) {
		this.employee_number = employee_number;
	}
	
	
	    
	
}
