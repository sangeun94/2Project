package db.dto;

public class ReservationDTO { //예약
	//DTO Data Transfer Object
	public String reservation_date;
	public String reservation_time;
	public String reservation_number;
	public String reservation_status;
	public int patient_number;
	public String reservation_content;
	public String employee_number;
	public String department_number;
	
	public String department_name;
	public String employee_name;
	public String patient_name;
			
	//생성자	
	public ReservationDTO() {}
	
	public ReservationDTO(String reservation_date, String reservation_time, int patient_number, String employee_number) {
		this.reservation_date = reservation_date;
		this.reservation_time = reservation_time;
		this.patient_number = patient_number;
		this.employee_number = employee_number;
	}

	public ReservationDTO(String reservation_date, String reservation_time, String reservation_number,
			String reservation_status, int patient_number, String reservation_content, String employee_number,
			String department_number) {
		super();
		this.reservation_date = reservation_date;
		this.reservation_time = reservation_time;
		this.reservation_number = reservation_number;
		this.reservation_status = reservation_status;
		this.patient_number = patient_number;
		this.reservation_content = reservation_content;
		this.employee_number = employee_number;
		this.department_number = department_number;
	}
	
	public ReservationDTO(String reservation_number, int patient_number, String reservation_date, String reservation_time, 
			String reservation_status, String department_name,
			String employee_name, String patient_name, String reservation_content) {
		super();
		this.reservation_date = reservation_date;
		this.reservation_time = reservation_time;
		this.reservation_number = reservation_number;
		this.reservation_status = reservation_status;
		this.patient_number = patient_number;
		this.reservation_content = reservation_content;
		this.department_name = department_name;
		this.employee_name = employee_name;
		this.patient_name = patient_name;
	}
	
	public ReservationDTO(String reservation_number, int patient_number, String reservation_date, String reservation_time, 
			String reservation_status, String employee_number, String department_name,
			String employee_name, String patient_name, String reservation_content) {
		super();
		this.reservation_date = reservation_date;
		this.reservation_time = reservation_time;
		this.reservation_number = reservation_number;
		this.reservation_status = reservation_status;
		this.patient_number = patient_number;
		this.reservation_content = reservation_content;
		this.employee_number = employee_number;
		this.department_name = department_name;
		this.employee_name = employee_name;
		this.patient_name = patient_name;
	}

	//메소드
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

	public String getEmployee_number() {
		return employee_number;
	}

	public void setEmployee_number(String employee_number) {
		this.employee_number = employee_number;
	}

	public String getDepartment_number() {
		return department_number;
	}

	public void setDepartment_number(String department_number) {
		this.department_number = department_number;
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