--ERD 데이터

-- 차트
DROP TABLE Chart;

-- 진료실
DROP TABLE Medical_Room;

-- 입원실
DROP TABLE Inpatient_Room;

-- 입원
DROP TABLE Hospitalization;

-- 예약
DROP TABLE Reservation;

-- 직원
DROP TABLE Employee;

-- 진료
DROP TABLE Medical_Treatment;

-- 회원가입 시퀀스
DROP SEQUENCE patient_number_seq;

-- 진료 번호 시퀀스
DROP SEQUENCE treatment_number_seq;

-- 환자
DROP TABLE Patient;

-- 진료과
DROP TABLE Medical_Department;





-- 진료과
CREATE TABLE Medical_Department (
    Department_Number NUMBER PRIMARY KEY,
    Department_Name VARCHAR2(50) NOT NULL,
    Tel VARCHAR2(20)
);

-- 진료 번호 시퀀스 생성
CREATE SEQUENCE treatment_number_seq START WITH 1 INCREMENT BY 1;




-- 직원
CREATE TABLE Employee (
    Employee_Number VARCHAR2(20),
    Employee_Code NUMBER NOT NULL,
    Employment_Status VARCHAR2(10) NOT NULL,
    Password VARCHAR2(40),
    Name VARCHAR2(50) NOT NULL,
    Gender VARCHAR2(10),
    Phone_Number VARCHAR2(20),
    Address VARCHAR2(255),
    Email VARCHAR2(50),
    Position VARCHAR2(50),
    Department_Number NUMBER,
    PRIMARY KEY (Employee_Number), -- 수정된 부분
    FOREIGN KEY (Department_Number) REFERENCES Medical_Department(Department_Number)
);

-- 회원가입 시퀀스
CREATE SEQUENCE patient_number_seq START WITH 1 INCREMENT BY 1;

--진료 테이블
CREATE TABLE Medical_Treatment (
    Treatment_Number NUMBER PRIMARY KEY,
    Treatment_Date DATE,
    Treatment_time DATE,
    Employee_Number VARCHAR2(20),
    Patient_Number NUMBER,
    Hospitalization_Status VARCHAR2(20),
    Treatment_Content VARCHAR2(255),
    FOREIGN KEY(Employee_Number) REFERENCES Employee(Employee_Number),
    FOREIGN KEY(Patient_Number) REFERENCES Patient(Patient_Number)
);

-- 환자
CREATE TABLE Patient (
    Patient_Number NUMBER DEFAULT patient_number_seq.NEXTVAL PRIMARY KEY,
    Patient_Status_Code NUMBER,
    id VARCHAR2(30),
    password VARCHAR2(40),
    email VARCHAR2(50),
    name VARCHAR2(50) NOT NULL,
    jumin VARCHAR2(20),
    phone_number VARCHAR2(20),
    address VARCHAR2(50)
);

-- 입원
CREATE TABLE Hospitalization (
    Hospitalization_Date DATE NOT NULL,
    Discharge_Date DATE,
    Inpatient_Room_Number VARCHAR2(10),
    Patient_Number NUMBER PRIMARY KEY,
    FOREIGN KEY (Patient_Number) REFERENCES Patient(Patient_Number)
);

-- 입원실
CREATE TABLE Inpatient_Room (
    Inpatient_Room_Number VARCHAR2(10),
    Patient_Number NUMBER,
    PRIMARY KEY (Inpatient_Room_Number, Patient_Number),
    FOREIGN KEY (Patient_Number) REFERENCES Patient(Patient_Number)
);

-- 진료실
CREATE TABLE Medical_Room (
    Medical_Room_Number VARCHAR2(10),
    Employee_Number VARCHAR2(20),
    PRIMARY KEY (Medical_Room_Number),
    FOREIGN KEY (Employee_Number) REFERENCES Employee(Employee_Number) -- 수정된 부분
);

-- 차트
CREATE TABLE Chart (
    Chart_Number NUMBER,
    Patient_Number NUMBER NOT NULL,
    Treatment_Content VARCHAR2(255),
    Hospitalization_Status VARCHAR2(20),
    PRIMARY KEY (Chart_Number),
    FOREIGN KEY (Patient_Number) REFERENCES Patient(Patient_Number)
);

-- 예약
CREATE TABLE Reservation (
    Reservation_Number VARCHAR2(20),
    Patient_Number NUMBER NOT NULL,
    Reservation_Status VARCHAR2(20),
    Reservation_Date DATE,
    Reservation_Time DATE,
    Reservation_Content VARCHAR2(255),
    Employee_Number VARCHAR2(20),
    Department_Number NUMBER NOT NULL,
    PRIMARY KEY (Reservation_Number),
    FOREIGN KEY (Patient_Number) REFERENCES Patient(Patient_Number),
    FOREIGN KEY (Employee_Number) REFERENCES Employee(Employee_Number), -- 수정된 부분
    FOREIGN KEY (Department_Number) REFERENCES Medical_Department(Department_Number) -- 추가된 부분
);


-- 예약 정보 샘플 INSERT
-- 가정의학과 박지윤
INSERT INTO Reservation
(Reservation_Number, Patient_Number, Reservation_Status, Reservation_Date, Reservation_Time, Reservation_Content, Employee_Number, Department_Number)
VALUES
('1', 1, 'Y', TO_DATE('2023-04-29', 'YYYY-MM-DD'), TO_DATE('2023-04-29 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), '배가 아파요', 'hm3', '1');

-- 신경과 임서연
INSERT INTO Reservation
(Reservation_Number, Patient_Number, Reservation_Status, Reservation_Date, Reservation_Time, Reservation_Content, Employee_Number, Department_Number)
VALUES
('2', 3, 'N', TO_DATE('2023-05-30', 'YYYY-MM-DD'), TO_DATE('2023-05-30 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), '머리가 아파요', 'hm10', '8');

-- 가정의학과
INSERT INTO Reservation
(Reservation_Number, Patient_Number, Reservation_Status, Reservation_Date, Reservation_Time, Reservation_Content, Employee_Number, Department_Number)
VALUES
('3', 4, 'Y', TO_DATE('2023-06-07', 'YYYY-MM-DD'), TO_DATE('2023-06-07 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), '가슴이 아파요', 'hm3', '1');

-- 신경과
INSERT INTO Reservation
(Reservation_Number, Patient_Number, Reservation_Status, Reservation_Date, Reservation_Time, Reservation_Content, Employee_Number, Department_Number)
VALUES
('4', 13, 'Y', TO_DATE('2023-07-24', 'YYYY-MM-DD'), TO_DATE('2023-07-24 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), '머리가 아파요', 'hm10', '8');

-- 가정의학과
INSERT INTO Reservation
(Reservation_Number, Patient_Number, Reservation_Status, Reservation_Date, Reservation_Time, Reservation_Content, Employee_Number, Department_Number)
VALUES
('5', 25, 'N', TO_DATE('2023-07-24', 'YYYY-MM-DD'), TO_DATE('2023-07-24 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), '엉덩이가 아파요', 'hm3', '1');

-- 신경과
INSERT INTO Reservation
(Reservation_Number, Patient_Number, Reservation_Status, Reservation_Date, Reservation_Time, Reservation_Content, Employee_Number, Department_Number)
VALUES
('6', 38, 'Y', TO_DATE('2023-05-30', 'YYYY-MM-DD'), TO_DATE('2023-05-30 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), '머리가 아파요', 'hm10', '8');

COMMIT;
