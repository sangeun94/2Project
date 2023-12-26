package db.dto;

public class ReservationDTO { //예약
	//DTO Data Transfer Object
	
	public String reservation_number; 
	public String reservation_date;
	public String reservation_time;
	public String reservation_number;
	public String reservation_status;
	public int patient_number;
	public String reservation_content;
	public String employee_number;
	public String department_number;
	
	//생성자
	public ReservationDTO() {}
	public ReservationDTO(String reservation_number, String reservation_date, String reservation_time,
			String reservation_content, int employee_number, String department_number) {
		super();
		this.reservation_number = reservation_number;
		this.reservation_date = reservation_date;
		this.reservation_time = reservation_time;
		this.reservation_number = reservation_number;
		this.reservation_status = reservation_status;
		this.patient_number = patient_number;
		this.reservation_content = reservation_content;
		this.employee_number = employee_number;
		this.department_number = department_number;
	}
	
	//메소드
	public String getReservation_number() {
		return reservation_number;
	}

	public void setReservation_number(String reservation_number) {
		this.reservation_number = reservation_number;
	}
	public String getReservation_date() {
		return reservation_date;
	}

	public void setReservation_date(String reservation_date) {
		this.reservation_date = reservation_date;
	}

	public String getReservation_time() {
		return reservation_time;
	}

	public void setReservation_time(String reservation_time) {
		this.reservation_time = reservation_time;
	}

	public String getReservation_number() {
		return reservation_number;
	}

	public void setReservation_number(String reservation_number) {
		this.reservation_number = reservation_number;
	}

	public String getReservation_status() {
		return reservation_status;
	}

	public void setReservation_status(String reservation_status) {
		this.reservation_status = reservation_status;
	}

	public int getPatient_number() {
		return patient_number;
	}

	public void setPatient_number(int patient_number) {
		this.patient_number = patient_number;
	}

	public String getReservation_content() {
		return reservation_content;
	}

	public void setReservation_content(String reservation_content) {
		this.reservation_content = reservation_content;
	}
	public int getEmployee_number() {
		return employee_number;
	}
	public void setEmployee_number(int employee_number) {
		this.employee_number = employee_number;
	}

	public String getDepartment_number() {
		return department_number;
	}

	public void setDepartment_number(String department_number) {
		this.department_number = department_number;
	}

	
	


	
	
	

	
}
