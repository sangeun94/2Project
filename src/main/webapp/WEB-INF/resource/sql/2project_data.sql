-- drop
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





--직원, 환자, 진료과 등 테이블 생성 및 데이터 추가

--진료과
CREATE TABLE Medical_Department (
	Department_Number NUMBER PRIMARY KEY, -- 1 2 3 4
	Department_Name VARCHAR2(50) NOT NULL,
	Tel VARCHAR2(20)
);

INSERT INTO Medical_Department (Department_Number, Department_Name, Tel)
SELECT 1, '가정의학과', '041-9999-0001' FROM DUAL UNION ALL
SELECT 2, '국제진료과', '041-9999-0002' FROM DUAL UNION ALL
SELECT 3, '마취통증의학과', '041-9999-0003' FROM DUAL UNION ALL
SELECT 4, '병리과', '041-9999-0004' FROM DUAL UNION ALL
SELECT 5, '비뇨의학과', '041-9999-0005' FROM DUAL UNION ALL
SELECT 6, '산부인과', '041-9999-0006' FROM DUAL UNION ALL
SELECT 7, '성형외과', '041-9999-0007' FROM DUAL UNION ALL
SELECT 8, '신경과', '041-9999-0008' FROM DUAL UNION ALL
SELECT 9, '신경외과', '041-9999-0009' FROM DUAL UNION ALL
SELECT 10, '영상의학과', '041-9999-0010' FROM DUAL UNION ALL
SELECT 11, '응급의학과', '041-9999-0011' FROM DUAL UNION ALL
SELECT 12, '이비인후과', '041-9999-0012' FROM DUAL UNION ALL
SELECT 13, '임상약리학과', '041-9999-0013' FROM DUAL UNION ALL
SELECT 14, '정신건강의학과', '041-9999-0014' FROM DUAL UNION ALL
SELECT 15, '정형외과', '041-9999-0015' FROM DUAL UNION ALL
SELECT 16, '직업환경의학과', '041-9999-0016' FROM DUAL UNION ALL
SELECT 17, '진단검사의학과', '041-9999-0017' FROM DUAL UNION ALL
SELECT 18, '피부과', '041-9999-0018' FROM DUAL UNION ALL
SELECT 19, '핵의학과', '041-9999-0019' FROM DUAL UNION ALL
SELECT 20, '흉부외과', '041-9999-0020' FROM DUAL UNION ALL
SELECT 21, '감염내과', '041-9999-0021' FROM DUAL UNION ALL
SELECT 22, '내분비내과', '041-9999-0022' FROM DUAL UNION ALL
SELECT 23, '노년내과', '041-9999-0023' FROM DUAL UNION ALL
SELECT 24, '류마티스내과', '041-9999-0024' FROM DUAL UNION ALL
SELECT 25, '소화기내과', '041-9999-0025' FROM DUAL UNION ALL
SELECT 26, '신장내과', '041-9999-0026' FROM DUAL UNION ALL
SELECT 27, '알레르기내과', '041-9999-0027' FROM DUAL UNION ALL
SELECT 28, '통합내과', '041-9999-0028' FROM DUAL UNION ALL
SELECT 29, '혈액내과', '041-9999-0029' FROM DUAL UNION ALL
SELECT 30, '호흡기내과', '041-9999-0030' FROM DUAL UNION ALL
SELECT 31, '간담췌외과', '041-9999-0031' FROM DUAL UNION ALL
SELECT 32, '갑상선내분비외과', '041-9999-0032' FROM DUAL UNION ALL
SELECT 33, '대장항문외과', '041-9999-0033' FROM DUAL UNION ALL
SELECT 34, '위장관외과', '041-9999-0034' FROM DUAL UNION ALL
SELECT 35, '유방외과', '041-9999-0035' FROM DUAL UNION ALL
SELECT 36, '이식외과', '041-9999-0036' FROM DUAL UNION ALL
SELECT 37, '일반외과', '041-9999-0037' FROM DUAL;

--진료
CREATE TABLE Medical_Treatment (
	Treatment_Number NUMBER PRIMARY KEY, -- 1 2 3 4 ~
	Treatment_Date DATE,
	Treatment_time DATE,
	Employee_Number VARCHAR2(20), -- hm1 ~
	Patient_Number NUMBER, -- 1 2 3 4 ~
	Hospitalization_Status VARCHAR2(20), --Y,N
	Treatment_Content VARCHAR2(255) -- 고혈압 갑상선저하증 …
);

--진료 번호 시퀀스 생성    
CREATE SEQUENCE treatment_number_seq
START WITH 1
INCREMENT BY 1;

--차트
CREATE TABLE Chart (
	Chart_Number NUMBER,
	Patient_Number NUMBER NOT NULL, -- 1 2 3 4
	Treatment_Content VARCHAR2(255),
	Hospitalization_Status VARCHAR2(20), --Y,N
	PRIMARY KEY (Chart_Number)
);


--직원
CREATE TABLE Employee (
	Employee_Number VARCHAR2(20),
	Employee_Code NUMBER NOT NULL, -- Doctor: 1, Nurse: 2, Administrative Staff: 3
	Employment_Status VARCHAR2(10) NOT NULL, -- Y, N
	Password VARCHAR2(40),
	Name VARCHAR2(50) NOT NULL,
	Gender VARCHAR2(10),
	Phone_Number VARCHAR2(20),
	Address VARCHAR2(255),
	Email VARCHAR2(50),
	Position VARCHAR2(50),
	Department_Number NUMBER,
	PRIMARY KEY (Employee_Number)
);

INSERT INTO Employee (Employee_Number, Employee_Code, Employment_Status, Password, Name, Gender, Phone_Number, Address, Email, Position, Department_Number)
SELECT 'hm1', 1, 'Y', 'hm1', '김지원', 'F', '010-1234-5678', '서울특별시', 'user1@example.com', '병원장', 1000 FROM DUAL UNION ALL
SELECT 'hm2', 1, 'Y', 'hm2', '이승민', 'M', '010-2345-6789', '부산광역시', 'customer2@gmail.com', '부원장', 1000 FROM DUAL UNION ALL
SELECT 'hm3', 1, 'Y', 'hm3', '박지윤', 'F', '010-3456-7890', '대구광역시', 'test_account3@yahoo.com', '진료부장', 1 FROM DUAL UNION ALL
SELECT 'hm4', 1, 'Y', 'hm4', '최민재', 'M', '010-4567-8901', '인천광역시', 'sample_user4@hotmail.com', '교수', 2 FROM DUAL UNION ALL
SELECT 'hm5', 1, 'Y', 'hm5', '정서연', 'F', '010-5678-9012', '광주광역시', 'random_email5@outlook.com', '부교수', 3 FROM DUAL UNION ALL
SELECT 'hm6', 1, 'Y', 'hm6', '강준호', 'M', '010-6789-0123', '대전광역시', 'email6@example.net', '교수', 4 FROM DUAL UNION ALL
SELECT 'hm7', 1, 'Y', 'hm7', '조수빈', 'F', '010-7890-1234', '울산광역시', 'user7@gmail.com', '부교수', 5 FROM DUAL UNION ALL
SELECT 'hm8', 1, 'Y', 'hm8', '윤민지', 'F', '010-8901-2345', '세종특별자치시', 'example_email8@yahoo.com', '교수', 6 FROM DUAL UNION ALL
SELECT 'hm9', 1, 'Y', 'hm9', '장현우', 'M', '010-9012-3456', '경기도', 'testuser9@hotmail.com', '부교수', 7 FROM DUAL UNION ALL
SELECT 'hm10', 1, 'Y', 'hm10', '임서연', 'F', '010-1122-3344', '강원특별자치도', 'user10@outlook.com', '교수', 8 FROM DUAL UNION ALL
SELECT 'hm11', 1, 'Y', 'hm11', '한준서', 'M', '010-2233-4455', '충청북도', 'customer11@example.org', '부교수', 9 FROM DUAL UNION ALL
SELECT 'hm12', 1, 'Y', 'hm12', '오지현', 'F', '010-3344-5566', '충청남도', 'random12@gmail.com', '교수', 10 FROM DUAL UNION ALL
SELECT 'hm13', 1, 'Y', 'hm13', '서민호', 'M', '010-4455-6677', '전라북도', 'sample_email13@yahoo.com', '부교수', 11 FROM DUAL UNION ALL
SELECT 'hm14', 1, 'Y', 'hm14', '김다영', 'F', '010-5566-7788', '전라남도', 'test14@hotmail.com', '교수', 12 FROM DUAL UNION ALL
SELECT 'hm15', 1, 'Y', 'hm15', '이성호', 'M', '010-6677-8899', '경상북도', 'user15@outlook.com', '부교수', 13 FROM DUAL UNION ALL
SELECT 'hm16', 1, 'Y', 'hm16', '박수민', 'F', '010-7788-9900', '경상남도', 'email16@example.net', '교수', 14 FROM DUAL UNION ALL
SELECT 'hm17', 1, 'Y', 'hm17', '최준서', 'M', '010-8899-0011', '서울특별시', 'example17@gmail.com', '부교수', 15 FROM DUAL UNION ALL
SELECT 'hm18', 1, 'Y', 'hm18', '정유진', 'F', '010-9900-1122', '부산광역시', 'random18@yahoo.com', '교수', 16 FROM DUAL UNION ALL
SELECT 'hm19', 1, 'Y', 'hm19', '강민준', 'M', '010-1111-2222', '대구광역시', 'test_user19@hotmail.com', '부교수', 17 FROM DUAL UNION ALL
SELECT 'hm20', 1, 'Y', 'hm20', '조서현', 'F', '010-2222-3333', '인천광역시', 'user20@outlook.com', '교수', 18 FROM DUAL UNION ALL
SELECT 'hm21', 1, 'Y', 'hm21', '윤준영', 'M', '010-3333-4444', '광주광역시', 'customer21@example.org', '부교수', 19 FROM DUAL UNION ALL
SELECT 'hm22', 1, 'Y', 'hm22', '장하은', 'F', '010-4444-5555', '대전광역시', 'sample22@gmail.com', '교수', 20 FROM DUAL UNION ALL
SELECT 'hm23', 1, 'Y', 'hm23', '임도현', 'M', '010-5555-6666', '울산광역시', 'test_email23@yahoo.com', '부교수', 21 FROM DUAL UNION ALL
SELECT 'hm24', 1, 'Y', 'hm24', '한주원', 'M', '010-6666-7777', '세종특별자치시', 'random24@hotmail.com', '교수', 22 FROM DUAL UNION ALL
SELECT 'hm25', 1, 'Y', 'hm25', '오수빈', 'F', '010-7777-8888', '경기도', 'email25@outlook.com', '부교수', 23 FROM DUAL UNION ALL
SELECT 'hm26', 1, 'Y', 'hm26', '서승우', 'M', '010-8888-9999', '강원특별자치도', 'user26@example.net', '교수', 24 FROM DUAL UNION ALL
SELECT 'hm27', 1, 'Y', 'hm27', '김서영', 'F', '010-9999-0000', '충청북도', 'example27@gmail.com', '부교수', 25 FROM DUAL UNION ALL
SELECT 'hm28', 1, 'Y', 'hm28', '이준호', 'M', '010-1212-3435', '충청남도', 'test28@yahoo.com', '교수', 26 FROM DUAL UNION ALL
SELECT 'hm29', 1, 'Y', 'hm29', '박가영', 'F', '010-2323-4546', '전라북도', 'sample_user29@hotmail.com', '부교수', 27 FROM DUAL UNION ALL
SELECT 'hm30', 1, 'Y', 'hm30', '최승민', 'M', '010-3434-5657', '전라남도', 'user30@outlook.com', '교수', 28 FROM DUAL UNION ALL
SELECT 'hm31', 1, 'Y', 'hm31', '정지원', 'F', '010-4545-6768', '경상북도', 'email31@example.org', '부교수', 29 FROM DUAL UNION ALL
SELECT 'hm32', 1, 'Y', 'hm32', '강민지', 'F', '010-5656-7879', '경상남도', 'random32@gmail.com', '교수', 30 FROM DUAL UNION ALL
SELECT 'hm33', 1, 'Y', 'hm33', '조현우', 'M', '010-6767-8980', '서울특별시', 'test33@yahoo.com', '부교수', 31 FROM DUAL UNION ALL
SELECT 'hm34', 1, 'Y', 'hm34', '윤지민', 'F', '010-7878-9091', '부산광역시', 'sample34@hotmail.com', '교수', 32 FROM DUAL UNION ALL
SELECT 'hm35', 1, 'Y', 'hm35', '장준영', 'M', '010-8989-0103', '대구광역시', 'user35@outlook.com', '부교수', 33 FROM DUAL UNION ALL
SELECT 'hm36', 1, 'Y', 'hm36', '임수빈', 'F', '010-9090-1213', '인천광역시', 'example_email36@example.net', '교수', 34 FROM DUAL UNION ALL
SELECT 'hm37', 1, 'Y', 'hm37', '한도현', 'M', '010-2323-6564', '광주광역시', 'random37@gmail.com', '부교수', 35 FROM DUAL UNION ALL
SELECT 'hm38', 1, 'Y', 'hm38', '오윤서', 'F', '010-3434-7679', '대전광역시', 'email38@yahoo.com', '교수', 36 FROM DUAL UNION ALL
SELECT 'hm39', 1, 'Y', 'hm39', '서준혁', 'M', '010-4545-8786', '울산광역시', 'test39@hotmail.com', '부교수', 37 FROM DUAL UNION ALL
SELECT 'hm40', 1, 'Y', 'hm40', '김민지', 'F', '010-5656-9891', '세종특별자치시', 'user40@outlook.com', '교수', 1 FROM DUAL UNION ALL
SELECT 'hm41', 1, 'Y', 'hm41', '이주원', 'M', '010-6767-0910', '경기도', 'customer41@example.org', '부교수', 2 FROM DUAL UNION ALL
SELECT 'hm42', 1, 'Y', 'hm42', '박시우', 'M', '010-7878-2022', '강원특별자치도', 'sample_email42@gmail.com', '교수', 3 FROM DUAL UNION ALL
SELECT 'hm43', 1, 'Y', 'hm43', '최하은', 'F', '010-8989-3133', '충청북도', 'random43@yahoo.com', '부교수', 4 FROM DUAL UNION ALL
SELECT 'hm44', 1, 'Y', 'hm44', '정태민', 'M', '010-9090-4244', '충청남도', 'test_user44@hotmail.com', '교수', 5 FROM DUAL UNION ALL
SELECT 'hm45', 1, 'Y', 'hm45', '강유진', 'F', '010-2323-5353', '전라북도', 'user45@outlook.com', '부교수', 6 FROM DUAL UNION ALL
SELECT 'hm46', 1, 'Y', 'hm46', '조승현', 'M', '010-3434-6464', '전라남도', 'email46@example.net', '교수', 7 FROM DUAL UNION ALL
SELECT 'hm47', 1, 'Y', 'hm47', '윤주원', 'M', '010-4545-7575', '경상북도', 'example47@gmail.com', '부교수', 8 FROM DUAL UNION ALL
SELECT 'hm48', 1, 'Y', 'hm48', '장지훈', 'M', '010-5656-8686', '경상남도', 'random48@yahoo.com', '교수', 9 FROM DUAL UNION ALL
SELECT 'hm49', 1, 'Y', 'hm49', '임서아', 'F', '010-6767-9797', '서울특별시', 'test49@hotmail.com', '부교수', 10 FROM DUAL UNION ALL
SELECT 'hm50', 1, 'Y', 'hm50', '한승우', 'M', '010-7878-0808', '부산광역시', 'sample50@outlook.com', '교수', 11 FROM DUAL UNION ALL
SELECT 'hm51', 1, 'Y', 'hm51', '오수민', 'F', '010-8989-1919', '대구광역시', 'user51@example.org', '레지던트', 12 FROM DUAL UNION ALL
SELECT 'hm52', 1, 'Y', 'hm52', '서승민', 'M', '010-9090-3030', '인천광역시', 'email52@gmail.com', '레지던트', 13 FROM DUAL UNION ALL
SELECT 'hm53', 1, 'Y', 'hm53', '김주원', 'M', '010-2323-8787', '광주광역시', 'test_email53@yahoo.com', '레지던트', 14 FROM DUAL UNION ALL
SELECT 'hm54', 1, 'Y', 'hm54', '이수빈', 'F', '010-3434-9898', '대전광역시', 'random54@hotmail.com', '레지던트', 15 FROM DUAL UNION ALL
SELECT 'hm55', 1, 'Y', 'hm55', '박승민', 'M', '010-4545-0909', '울산광역시', 'user55@outlook.com', '레지던트', 16 FROM DUAL UNION ALL
SELECT 'hm56', 1, 'Y', 'hm56', '최하윤', 'F', '010-5656-2020', '세종특별자치시', 'example56@example.net', '레지던트', 17 FROM DUAL UNION ALL
SELECT 'hm57', 1, 'Y', 'hm57', '정도현', 'M', '010-6767-3131', '경기도', 'sample57@gmail.com', '레지던트', 18 FROM DUAL UNION ALL
SELECT 'hm58', 1, 'Y', 'hm58', '강민서', 'F', '010-7878-4242', '강원특별자치도', 'customer58@yahoo.com', '레지던트', 19 FROM DUAL UNION ALL
SELECT 'hm59', 1, 'Y', 'hm59', '조현서', 'F', '010-8989-5353', '충청북도', 'test59@hotmail.com', '레지던트', 20 FROM DUAL UNION ALL
SELECT 'hm60', 1, 'Y', 'hm60', '윤시우', 'M', '010-9090-6464', '충청남도', 'email60@outlook.com', '레지던트', 21 FROM DUAL UNION ALL
SELECT 'hm61', 2, 'Y', 'hm61', '장하린', 'F', '010-2323-7575', '전라북도', 'user61@example.org', '간호원장', 1 FROM DUAL UNION ALL
SELECT 'hm62', 2, 'Y', 'hm62', '임승준', 'M', '010-3434-8686', '전라남도', 'random62@gmail.com', '간호부원장', 2 FROM DUAL UNION ALL
SELECT 'hm63', 2, 'Y', 'hm63', '한예린', 'F', '010-4545-9797', '경상북도', 'example_email63@yahoo.com', '간호이사', 3 FROM DUAL UNION ALL
SELECT 'hm64', 2, 'Y', 'hm64', '오민서', 'F', '010-5656-0808', '경상남도', 'test_user64@hotmail.com', '간호본부장', 4 FROM DUAL UNION ALL
SELECT 'hm65', 2, 'Y', 'hm65', '서승현', 'M', '010-6767-1919', '서울특별시', 'sample65@outlook.com', '간호처장', 5 FROM DUAL UNION ALL
SELECT 'hm66', 2, 'Y', 'hm66', '김서하', 'F', '010-7878-3030', '부산광역시', 'user66@example.net', '간호국장', 6 FROM DUAL UNION ALL
SELECT 'hm67', 2, 'Y', 'hm67', '이도현', 'M', '010-8989-8787', '대구광역시', 'email67@gmail.com', '간호부장', 7 FROM DUAL UNION ALL
SELECT 'hm68', 2, 'Y', 'hm68', '박지아', 'F', '010-9090-9898', '인천광역시', 'random68@yahoo.com', '간호부장', 8 FROM DUAL UNION ALL
SELECT 'hm69', 2, 'Y', 'hm69', '최시윤', 'F', '010-2323-0909', '광주광역시', 'test69@hotmail.com', '간호과장', 9 FROM DUAL UNION ALL
SELECT 'hm70', 2, 'Y', 'hm70', '정지민', 'F', '010-3434-2020', '대전광역시', 'example70@outlook.com', '수간호사', 10 FROM DUAL UNION ALL
SELECT 'hm71', 2, 'Y', 'hm71', '강준서', 'M', '010-4545-3131', '울산광역시', 'customer71@example.org', '주임간호사', 11 FROM DUAL UNION ALL
SELECT 'hm72', 2, 'Y', 'hm72', '조은서', 'F', '010-5656-4242', '세종특별자치시', 'sample_email72@gmail.com', '사원', 12 FROM DUAL UNION ALL
SELECT 'hm73', 2, 'Y', 'hm73', '윤승아', 'F', '010-6767-5353', '경기도', 'user73@yahoo.com', '사원', 13 FROM DUAL UNION ALL
SELECT 'hm74', 2, 'Y', 'hm74', '장민서', 'F', '010-7878-6464', '강원특별자치도', 'random74@hotmail.com', '사원', 14 FROM DUAL UNION ALL
SELECT 'hm75', 2, 'Y', 'hm75', '임수민', 'F', '010-8989-7575', '충청북도', 'test75@outlook.com', '사원', 15 FROM DUAL UNION ALL
SELECT 'hm76', 2, 'Y', 'hm76', '한서영', 'F', '010-9090-8686', '충청남도', 'email76@example.net', '사원', 16 FROM DUAL UNION ALL
SELECT 'hm77', 2, 'Y', 'hm77', '오주원', 'M', '010-2323-9797', '전라북도', 'example77@gmail.com', '사원', 17 FROM DUAL UNION ALL
SELECT 'hm78', 2, 'Y', 'hm78', '서정우', 'M', '010-3434-0808', '전라남도', 'user78@yahoo.com', '사원', 18 FROM DUAL UNION ALL
SELECT 'hm79', 2, 'Y', 'hm79', '김주영', 'M', '010-4545-1919', '경상북도', 'test_email79@hotmail.com', '사원', 19 FROM DUAL UNION ALL
SELECT 'hm80', 2, 'Y', 'hm80', '이수민', 'F', '010-5656-3030', '경상남도', 'sample80@outlook.com', '사원', 20 FROM DUAL UNION ALL
SELECT 'hm81', 2, 'Y', 'hm81', '박지환', 'M', '010-6767-8787', '서울특별시', 'random81@example.org', '사원', 21 FROM DUAL UNION ALL
SELECT 'hm82', 2, 'Y', 'hm82', '최하린', 'F', '010-7878-9898', '부산광역시', 'email82@gmail.com', '사원', 22 FROM DUAL UNION ALL
SELECT 'hm83', 2, 'Y', 'hm83', '정서빈', 'F', '010-8989-0909', '대구광역시', 'user83@yahoo.com', '사원', 23 FROM DUAL UNION ALL
SELECT 'hm84', 2, 'Y', 'hm84', '강승현', 'M', '010-9090-2020', '인천광역시', 'example_email84@hotmail.com', '사원', 24 FROM DUAL UNION ALL
SELECT 'hm85', 2, 'Y', 'hm85', '조주원', 'M', '010-2323-3131', '광주광역시', 'test85@outlook.com', '사원', 25 FROM DUAL UNION ALL
SELECT 'hm86', 2, 'Y', 'hm86', '윤수빈', 'F', '010-3434-4242', '대전광역시', 'sample86@example.net', '사원', 26 FROM DUAL UNION ALL
SELECT 'hm87', 2, 'Y', 'hm87', '장승윤', 'M', '010-4545-5353', '울산광역시', 'random87@gmail.com', '사원', 27 FROM DUAL UNION ALL
SELECT 'hm88', 2, 'Y', 'hm88', '임유진', 'F', '010-5656-6464', '세종특별자치시', 'user88@yahoo.com', '사원', 28 FROM DUAL UNION ALL
SELECT 'hm89', 2, 'Y', 'hm89', '한도영', 'M', '010-6767-7575', '경기도', 'email89@hotmail.com', '사원', 29 FROM DUAL UNION ALL
SELECT 'hm90', 2, 'Y', 'hm90', '오정아', 'F', '010-7878-8686', '강원특별자치도', 'example90@outlook.com', '사원', 30 FROM DUAL UNION ALL
SELECT 'hm91', 2, 'Y', 'hm91', '서승서', 'M', '010-8989-9797', '충청북도', 'test_user91@example.org', '사원', 31 FROM DUAL UNION ALL
SELECT 'hm92', 2, 'Y', 'hm92', '김수빈', 'F', '010-9090-0808', '충청남도', 'random92@gmail.com', '간호부장', 32 FROM DUAL UNION ALL
SELECT 'hm93', 2, 'Y', 'hm93', '이현우', 'M', '010-2323-1919', '전라북도', 'sample_email93@yahoo.com', '간호과장', 33 FROM DUAL UNION ALL
SELECT 'hm94', 2, 'Y', 'hm94', '박하은', 'F', '010-3434-3030', '전라남도', 'user94@hotmail.com', '수간호사', 34 FROM DUAL UNION ALL
SELECT 'hm95', 2, 'Y', 'hm95', '최도현', 'M', '010-0000-0094', '경상북도', 'email95@outlook.com', '주임간호사', 35 FROM DUAL UNION ALL
SELECT 'hm96', 2, 'Y', 'hm96', '정서진', 'F', '010-0000-0095', '경상남도', 'example96@example.net', '사원', 36 FROM DUAL UNION ALL
SELECT 'hm97', 2, 'Y', 'hm97', '강수빈', 'F', '010-0000-0096', '서울특별시', 'test97@gmail.com', '사원', 37 FROM DUAL UNION ALL
SELECT 'hm98', 2, 'Y', 'hm98', '조도현', 'M', '010-0000-0097', '부산광역시', 'random98@yahoo.com', '사원', 1 FROM DUAL UNION ALL
SELECT 'hm99', 2, 'Y', 'hm99', '윤지은', 'F', '010-0000-0098', '대구광역시', 'user99@hotmail.com', '사원', 2 FROM DUAL UNION ALL
SELECT 'hm100', 2, 'Y', 'hm100', '장민아', 'F', '010-0000-0099', '인천광역시', 'email100@outlook.com', '사원', 3 FROM DUAL UNION ALL
SELECT 'hm101', 2, 'Y', 'hm101', '임주원', 'M', '010-0000-0100', '광주광역시', 'example101@example.org', '사원', 4 FROM DUAL UNION ALL
SELECT 'hm102', 2, 'Y', 'hm102', '한은서', 'F', '010-0000-0101', '대전광역시', 'test102@gmail.com', '사원', 5 FROM DUAL UNION ALL
SELECT 'hm103', 2, 'Y', 'hm103', '오서아', 'F', '010-0000-0102', '울산광역시', 'user103@yahoo.com', '사원', 6 FROM DUAL UNION ALL
SELECT 'hm104', 2, 'Y', 'hm104', '서민서', 'F', '010-0000-0103', '세종특별자치시', 'random104@hotmail.com', '사원', 7 FROM DUAL UNION ALL
SELECT 'hm105', 2, 'Y', 'hm105', '김정우', 'M', '010-0000-0104', '경기도', 'sample105@outlook.com', '사원', 8 FROM DUAL UNION ALL
SELECT 'hm106', 2, 'Y', 'hm106', '이승아', 'F', '010-0000-0105', '강원특별자치도', 'email106@example.net', '사원', 9 FROM DUAL UNION ALL
SELECT 'hm107', 2, 'Y', 'hm107', '박민서', 'F', '010-0000-0106', '충청북도', 'example107@gmail.com', '사원', 10 FROM DUAL UNION ALL
SELECT 'hm108', 2, 'Y', 'hm108', '최하서', 'F', '010-0000-0107', '충청남도', 'test_email108@yahoo.com', '사원', 11 FROM DUAL UNION ALL
SELECT 'hm109', 2, 'Y', 'hm109', '정도윤', 'M', '010-0000-0108', '전라북도', 'user109@hotmail.com', '사원', 12 FROM DUAL UNION ALL
SELECT 'hm110', 2, 'Y', 'hm110', '강현우', 'M', '010-0000-0109', '전라남도', 'random110@outlook.com', '사원', 13 FROM DUAL UNION ALL
SELECT 'hm111', 2, 'Y', 'hm111', '조주아', 'F', '010-0000-0110', '경상북도', 'email111@example.org', '사원', 14 FROM DUAL UNION ALL
SELECT 'hm112', 2, 'Y', 'hm112', '윤승민', 'M', '010-0000-0111', '경상남도', 'sample112@gmail.com', '사원', 15 FROM DUAL UNION ALL
SELECT 'hm113', 2, 'Y', 'hm113', '장하윤', 'F', '010-0000-0112', '서울특별시', 'user113@yahoo.com', '사원', 16 FROM DUAL UNION ALL
SELECT 'hm114', 2, 'Y', 'hm114', '임서하', 'F', '010-0000-0113', '부산광역시', 'example114@hotmail.com', '사원', 17 FROM DUAL UNION ALL
SELECT 'hm115', 2, 'Y', 'hm115', '한주아', 'F', '010-0000-0114', '대구광역시', 'test_email115@outlook.com', '사원', 18 FROM DUAL UNION ALL
SELECT 'hm116', 2, 'Y', 'hm116', '오수아', 'F', '010-0000-0115', '인천광역시', 'random116@example.net', '사원', 19 FROM DUAL UNION ALL
SELECT 'hm117', 2, 'Y', 'hm117', '서주영', 'M', '010-0000-0116', '광주광역시', 'email117@gmail.com', '사원', 20 FROM DUAL UNION ALL
SELECT 'hm118', 2, 'Y', 'hm118', '김하린', 'F', '010-0000-0117', '대전광역시', 'user118@yahoo.com', '사원', 21 FROM DUAL UNION ALL
SELECT 'hm119', 2, 'Y', 'hm119', '이서하', 'F', '010-0000-0118', '울산광역시', 'example119@hotmail.com', '사원', 22 FROM DUAL UNION ALL
SELECT 'hm120', 2, 'Y', 'hm120', '박주원', 'M', '010-0000-0119', '세종특별자치시', 'test120@outlook.com', '사원', 23 FROM DUAL UNION ALL
SELECT 'hm121', 3, 'Y', 'hm121', '최은서', 'F', '010-0000-0120', '경기도', 'sample121@example.org', '전무', null FROM DUAL UNION ALL
SELECT 'hm122', 3, 'Y', 'hm122', '정서윤', 'F', '010-0000-0121', '강원특별자치도', 'random122@gmail.com', '상무', null FROM DUAL UNION ALL
SELECT 'hm123', 3, 'Y', 'hm123', '강수아', 'F', '010-0000-0122', '충청북도', 'user123@yahoo.com', '부장', null FROM DUAL UNION ALL
SELECT 'hm124', 3, 'Y', 'hm124', '조승민', 'M', '010-0000-0123', '충청남도', 'email124@hotmail.com', '차장', null FROM DUAL UNION ALL
SELECT 'hm125', 3, 'Y', 'hm125', '윤수아', 'F', '010-0000-0124', '전라북도', 'example125@outlook.com', '과장', null FROM DUAL UNION ALL
SELECT 'hm126', 3, 'Y', 'hm126', '장도윤', 'M', '010-0000-0125', '전라남도', 'test_email126@example.net', '과장', null FROM DUAL UNION ALL
SELECT 'hm127', 3, 'Y', 'hm127', '임정아', 'F', '010-0000-0126', '경상북도', 'random127@gmail.com', '대리', null FROM DUAL UNION ALL
SELECT 'hm128', 3, 'Y', 'hm128', '한민서', 'F', '010-0000-0127', '경상남도', 'sample128@yahoo.com', '대리', null FROM DUAL UNION ALL
SELECT 'hm129', 3, 'Y', 'hm129', '오도현', 'M', '010-0000-0128', '서울특별시', 'user129@hotmail.com', '주임', null FROM DUAL UNION ALL
SELECT 'hm130', 3, 'Y', 'hm130', '서승서', 'M', '010-0000-0129', '부산광역시', 'email130@outlook.com', '주임', null FROM DUAL UNION ALL
SELECT 'hm131', 3, 'Y', 'hm131', '김민서', 'F', '010-0000-0130', '대구광역시', 'example131@example.org', '사원', null FROM DUAL UNION ALL
SELECT 'hm132', 3, 'Y', 'hm132', '이주아', 'F', '010-0000-0131', '인천광역시', 'test132@gmail.com', '사원', null FROM DUAL UNION ALL
SELECT 'hm133', 3, 'Y', 'hm133', '박하린', 'F', '010-0000-0132', '광주광역시', 'random133@yahoo.com', '사원', null FROM DUAL UNION ALL
SELECT 'hm134', 3, 'Y', 'hm134', '최승하', 'M', '010-0000-0133', '대전광역시', 'user134@outlook.com', '사원', null FROM DUAL UNION ALL
SELECT 'hm135', 3, 'Y', 'hm135', '정민서', 'F', '010-0000-0134', '울산광역시', 'email135@example.net', '사원', null FROM DUAL UNION ALL
SELECT 'hm136', 3, 'Y', 'hm136', '강도현', 'M', '010-0000-0135', '세종특별자치시', 'example136@gmail.com', '사원', null FROM DUAL UNION ALL
SELECT 'hm137', 3, 'Y', 'hm137', '조서하', 'F', '010-0000-0136', '경기도', 'sample137@yahoo.com', '사원', null FROM DUAL UNION ALL
SELECT 'hm138', 3, 'Y', 'hm138', '윤하은', 'F', '010-0000-0137', '강원특별자치도', 'test138@hotmail.com', '사원', null FROM DUAL UNION ALL
SELECT 'hm139', 3, 'Y', 'hm139', '장주아', 'F', '010-0000-0138', '충청북도', 'user139@outlook.com', '사원', null FROM DUAL UNION ALL
SELECT 'hm140', 3, 'Y', 'hm140', '임도영', 'M', '010-0000-0139', '충청남도', 'email140@example.org', '사원', null FROM DUAL UNION ALL
SELECT 'hm141', 3, 'Y', 'hm141', '한서하', 'F', '010-0000-0140', '전라북도', 'random141@gmail.com', '인턴', null FROM DUAL UNION ALL
SELECT 'hm142', 3, 'Y', 'hm142', '오승아', 'F', '010-0000-0141', '전라남도', 'example_email142@yahoo.com', '인턴', null FROM DUAL UNION ALL
SELECT 'hm143', 3, 'Y', 'hm143', '서승하', 'M', '010-0000-0142', '경상북도', 'test_user143@hotmail.com', '인턴', null FROM DUAL UNION ALL
SELECT 'hm144', 3, 'Y', 'hm144', '김주하', 'F', '010-0000-0143', '경상남도', 'sample144@outlook.com', '인턴', null FROM DUAL UNION ALL
SELECT 'hm145', 3, 'Y', 'hm145', '이도영', 'M', '010-0000-0144', '서울특별시', 'user145@example.net', '인턴', null FROM DUAL UNION ALL
SELECT 'hm146', 3, 'Y', 'hm146', '박도현', 'M', '010-0000-0145', '서울특별시', 'email146@gmail.com', '인턴', null FROM DUAL UNION ALL
SELECT 'hm147', 3, 'Y', 'hm147', '최주하', 'F', '010-0000-0146', '서울특별시', 'random147@yahoo.com', '인턴', null FROM DUAL UNION ALL
SELECT 'hm148', 3, 'Y', 'hm148', '정하은', 'F', '010-0000-0147', '서울특별시', 'test148@hotmail.com', '인턴', null FROM DUAL UNION ALL
SELECT 'hm149', 3, 'Y', 'hm149', '강주영', 'M', '010-0000-0148', '서울특별시', 'example149@outlook.com', '인턴', null FROM DUAL UNION ALL
SELECT 'hm150', 3, 'Y', 'hm150', '조도영', 'M', '010-0000-0149', '서울특별시', 'user150@example.org', '인턴', null FROM DUAL;

--회원가입 시퀀스
CREATE SEQUENCE patient_number_seq START WITH 1 INCREMENT BY 1;

--환자
CREATE TABLE patient (
    patient_number NUMBER DEFAULT patient_number_seq.NEXTVAL PRIMARY KEY,
    patient_status_code NUMBER,
    id VARCHAR2(30),
    password VARCHAR2(40),
    email VARCHAR2(50),
    name VARCHAR2(50) NOT NULL,
    jumin VARCHAR2(20),
    phone_number VARCHAR2(20),
    address VARCHAR2(50)
);


INSERT INTO patient (patient_number, patient_status_code, id, password, email, name, jumin, phone_number, address)
SELECT 1, 1, 'user1', 'pass1', 'user1@example.com', '홍길동', '950101-1234567', '010-1111-1111', '서울특별시' FROM DUAL UNION ALL
SELECT 2, 2, 'user2', 'pass2', 'user2@example.com', '김철수', '980202-2345678', '010-1111-1112', '부산광역시' FROM DUAL UNION ALL
SELECT 3, 1, 'user3', 'pass3', 'user3@example.com', '이영희', '920303-1456789', '010-3456-1113', '대전광역시' FROM DUAL UNION ALL
SELECT 4, 3,  NULL, NULL, NULL, '박민수', '871212-1367890', '010-4567-1114', '인천광역시' FROM DUAL UNION ALL
SELECT 5, 2, 'user5', 'pass5', 'user5@example.com', '최진우', '890505-2378901', '010-5678-1115', '대구광역시' FROM DUAL UNION ALL
SELECT 6, 1, 'user6', 'pass6', 'user6@example.com', '손지연', '920606-2389012', '010-6789-1116', '광주광역시' FROM DUAL UNION ALL
SELECT 7, 2, 'user7', 'pass7', 'user7@example.com', '장재영', '900707-2390123', '010-7890-1117', '대전광역시' FROM DUAL UNION ALL
SELECT 8, 3,  NULL, NULL, NULL, '김유리', '920808-2301234', '010-8901-1118', '인천광역시' FROM DUAL UNION ALL
SELECT 9, 1, 'user9', 'pass9', 'user9@example.com', '이승우', '910909-2312345', '010-9012-1119', '서울특별시' FROM DUAL UNION ALL 
SELECT 10, 2, 'user10', 'pass10', 'user10@example.com', '최영재', '940202-1123456', '010-0123-1110', '인천광역시' FROM DUAL UNION ALL
SELECT 11, 1, 'user11', 'pass11', 'user11@example.com', '김하나', '970303-1234567', '010-1111-1111', '서울특별시' FROM DUAL UNION ALL 
SELECT 12, 2, 'user12', 'pass12', 'user12@example.com', '이둘삼', '990404-1345678', '010-2222-1112', '인천광역시' FROM DUAL UNION ALL
SELECT 13, 1, 'user13', 'pass13', 'user13@example.com', '박세하', '920505-1456789', '010-3333-1113', '대전광역시' FROM DUAL UNION ALL 
SELECT 14, 3,  NULL, NULL, NULL, '최네둘', '900606-1567890', '010-4444-1114', '대전광역시' FROM DUAL UNION ALL
SELECT 15, 2, 'user15', 'pass15', 'user15@example.com', '이여섯', '871212-1678901', '010-5555-1115', '서울특별시' FROM DUAL UNION ALL 
SELECT 16, 1, 'user16', 'pass16', 'user16@example.com', '장일곱', '890808-1789012', '010-6666-1116', '대구광역시' FROM DUAL UNION ALL
SELECT 17, 2, 'user17', 'pass17', 'user17@example.com', '임여덜', '900909-1890123', '010-7777-1117', '전라남도' FROM DUAL UNION ALL
SELECT 18, 3,  NULL, NULL, NULL, '최아홉', '911010-1901234', '010-8888-1118', '인천광역시' FROM DUAL UNION ALL 
SELECT 19, 1, 'user19', 'pass19', 'user19@example.com', '박스고', '940111-1912345', '010-9999-1119', '대전광역시' FROM DUAL UNION ALL
SELECT 20, 2, 'user20', 'pass20', 'user20@example.com', '김이십', '920212-1723456', '010-1010-1120', '대전광역시' FROM DUAL UNION ALL
SELECT 21, 1, 'user21', 'pass21', 'user21@example.com', '한이일', '931222-1634567', '010-1111-1121', '서울특별시' FROM DUAL UNION ALL
SELECT 22, 2, 'user22', 'pass22', 'user22@example.com', '강이이', '890101-2645678', '010-2222-1122', '인천광역시' FROM DUAL UNION ALL
SELECT 23, 1, 'user23', 'pass23', 'user23@example.com', '이이삼', '921202-2656789', '010-3333-1123', '대전광역시' FROM DUAL UNION ALL
SELECT 24, 3,  NULL, NULL, NULL, '김십사', '911212-2667890', '010-4444-1124', '대전광역시' FROM DUAL UNION ALL
SELECT 25, 1, 'user25', 'pass25', 'user25@example.com', '장이오', '880101-2678901', '010-5555-1125', '서울특별시' FROM DUAL UNION ALL
SELECT 26, 2, 'user26', 'pass26', 'user26@example.com', '임십육', '950303-2689012', '010-6666-1126', '광주광역시' FROM DUAL UNION ALL
SELECT 27, 1, 'user27', 'pass27', 'user27@example.com', '최이칠', '930404-2690123', '010-7777-1127', '전라북도' FROM DUAL UNION ALL
SELECT 28, 1, 'user28', 'pass28', 'user28@example.com', '김철수', '960101-1234567', '010-1112-1128', '제주특별자치도' FROM DUAL UNION ALL
SELECT 29, 1, 'user29', 'pass29', 'user29@example.com', '이영희', '970202-2345678', '010-2223-1129', '충청남도' FROM DUAL UNION ALL
SELECT 30, 1, 'user30', 'pass30', 'user30@example.com', '박민수', '980303-1456789', '010-3334-1130', '충청북도' FROM DUAL UNION ALL
SELECT 31, 2, 'user31', 'pass31', 'user31@example.com', '이일이', '910101-1345678', '010-4444-1131', '대전광역시' FROM DUAL UNION ALL
SELECT 32, 1, 'user32', 'pass32', 'user32@example.com', '김이삼', '930202-1456789', '010-5555-1132', '서울특별시' FROM DUAL UNION ALL
SELECT 33, 1, 'user33', 'pass33', 'user33@example.com', '박이사', '940303-1567890', '010-6666-1133', '대전광역시' FROM DUAL UNION ALL
SELECT 34, 3,  NULL, NULL, NULL, '최이오', '970404-1678901', '010-7777-1134', '부산광역시' FROM DUAL UNION ALL
SELECT 35, 2, 'user35', 'pass35', 'user35@example.com', '이이육', '890505-1789011', '010-8888-1135', '인천광역시' FROM DUAL UNION ALL
SELECT 36, 1, 'user36', 'pass36', 'user36@example.com', '장이칠', '920606-1890123', '010-9999-1136', '광주광역시' FROM DUAL UNION ALL
SELECT 37, 2, 'user37', 'pass37', 'user37@example.com', '임이팔', '900707-1901234', '010-0000-1137', '대전광역시' FROM DUAL UNION ALL
SELECT 38, 3,  NULL, NULL, NULL, '김이구', '990808-1012345', '010-1111-1138', '인천광역시' FROM DUAL UNION ALL
SELECT 39, 1, 'user39', 'pass39', 'user39@example.com', '이십일', '910909-1123456', '010-2222-1139', '대전광역시' FROM DUAL UNION ALL
SELECT 40, 2, 'user40', 'pass40', 'user40@example.com', '장십이', '941010-1234567', '010-3333-1140', '서울특별시' FROM DUAL UNION ALL
SELECT 41, 1, 'user41', 'pass41', 'user41@example.com', '한십삼', '931121-1345678', '010-4444-1141', '대전광역시' FROM DUAL UNION ALL
SELECT 42, 2, 'user42', 'pass42', 'user42@example.com', '강십사', '890101-1456789', '010-5555-1142', '인천광역시' FROM DUAL UNION ALL
SELECT 43, 1, 'user43', 'pass43', 'user43@example.com', '이십오', '921202-1567890', '010-6666-1143', '대전광역시' FROM DUAL UNION ALL
SELECT 44, 3,  NULL, NULL, NULL, '김십육', '911212-1678901', '010-7777-1144', '제주특별자치도' FROM DUAL UNION ALL
SELECT 45, 2, 'user45', 'pass45', 'user45@example.com', '임이칠', '880101-1789012', '010-8888-1145', '서울특별시' FROM DUAL UNION ALL
SELECT 46, 1, 'user46', 'pass46', 'user46@example.com', '최이팔', '950303-1890123', '010-9999-1146', '대구광역시' FROM DUAL UNION ALL
SELECT 47, 2, 'user47', 'pass47', 'user47@example.com', '이구이', '900404-1901234', '010-0000-1147', '충청남도' FROM DUAL UNION ALL
SELECT 48, 3,  NULL, NULL, NULL, '장팔이', '920505-1212345', '010-1111-1148', '충청북도' FROM DUAL UNION ALL
SELECT 49, 1, 'user49', 'pass49', 'user49@example.com', '김구십', '941010-1123456', '010-2222-1149', '서울특별시' FROM DUAL UNION ALL
SELECT 50, 2, 'user50', 'pass50', 'user50@example.com', '이십일', '970303-1235567', '010-3333-1150', '대전광역시' FROM DUAL UNION ALL
SELECT 51, 1, 'user51', 'pass51', 'user51@example.com', '한십이', '880101-2345678', '010-4444-1151', '부산광역시' FROM DUAL UNION ALL
SELECT 52, 2, 'user52', 'pass52', 'user52@example.com', '강십삼', '940202-1456789', '010-5555-1152', '대전광역시' FROM DUAL UNION ALL
SELECT 53, 1, 'user53', 'pass53', 'user53@example.com', '이십사', '921202-2567090', '010-6666-1153', '광주광역시' FROM DUAL UNION ALL
SELECT 54, 3,  NULL, NULL, NULL, '김십오', '881212-1678901', '010-7777-1154', '전라남도' FROM DUAL UNION ALL
SELECT 55, 2, 'user55', 'pass55', 'user55@example.com', '임십육', '890505-1189012', '010-8888-1155', '인천광역시' FROM DUAL UNION ALL
SELECT 56, 1, 'user56', 'pass56', 'user56@example.com', '최이칠', '920606-2890124', '010-9999-1156', '광주광역시' FROM DUAL UNION ALL
SELECT 57, 2, 'user57', 'pass57', 'user57@example.com', '이팔이', '910707-2901234', '010-0000-1157', '대전광역시' FROM DUAL UNION ALL
SELECT 58, 3, NULL, NULL, NULL, '김이구', '990808-2012045', '010-1111-1158', '인천광역시' FROM DUAL UNION ALL
SELECT 59, 1, 'user59', 'pass59', 'user59@example.com', '박이십', '940111-2123456', '010-2222-1159', '부산광역시' FROM DUAL UNION ALL
SELECT 60, 2, 'user60', 'pass60', 'user60@example.com', '김십일', '950212-2234567', '010-3333-1160', '대전광역시' FROM DUAL UNION ALL
SELECT 61, 1, 'user61', 'pass61', 'user61@example.com', '한십이', '881222-2345678', '010-4444-1161', '서울특별시' FROM DUAL UNION ALL
SELECT 62, 2, 'user62', 'pass62', 'user62@example.com', '강십삼', '940303-2456789', '010-5555-1162', '인천광역시' FROM DUAL UNION ALL
SELECT 63, 1, 'user63', 'pass63', 'user63@example.com', '이십사', '921212-2567890', '010-6666-1163', '대전광역시' FROM DUAL UNION ALL
SELECT 64, 3, NULL, NULL, NULL, '김십오', '911222-2678901', '010-7777-1164', '부산광역시' FROM DUAL UNION ALL
SELECT 65, 2, 'user65', 'pass65', 'user65@example.com', '임십육', '920505-2789012', '010-8888-1165', '인천광역시' FROM DUAL UNION ALL
SELECT 66, 1, 'user66', 'pass66', 'user66@example.com', '최이칠', '950606-2890123', '010-9999-1166', '서울특별시' FROM DUAL UNION ALL
SELECT 67, 2, 'user67', 'pass67', 'user67@example.com', '이팔이', '900707-1101034', '010-0000-1167', '대구광역시' FROM DUAL UNION ALL
SELECT 68, 3, NULL, NULL, NULL, '김이구', '920808-1112345', '010-1111-1168', '대전광역시' FROM DUAL UNION ALL
SELECT 69, 1, 'user69', 'pass69', 'user69@example.com', '박이십', '941010-2123456', '010-2222-1169', '인천광역시' FROM DUAL UNION ALL
SELECT 70, 2, 'user70', 'pass70', 'user70@example.com', '김십일', '970303-1214567', '010-3333-1170', '부산광역시' FROM DUAL UNION ALL
SELECT 71, 1, 'user71', 'pass71', 'user71@example.com', '한십이', '880101-1345678', '010-4444-1171', '대전광역시' FROM DUAL UNION ALL
SELECT 72, 2, 'user72', 'pass72', 'user72@example.com', '강십삼', '940202-1156789', '010-5555-1172', '대전광역시' FROM DUAL UNION ALL
SELECT 73, 1, 'user73', 'pass73', 'user73@example.com', '이십사', '921202-2567890', '010-6666-1173', '서울특별시' FROM DUAL UNION ALL
SELECT 74, 3, NULL, NULL, NULL, '김십오', '881212-1178901', '010-7777-1174', '전라남도' FROM DUAL UNION ALL
SELECT 75, 2, 'user75', 'pass75', 'user75@example.com', '임십육', '890505-2789013', '010-8888-1175', '인천광역시' FROM DUAL UNION ALL
SELECT 76, 1, 'user76', 'pass76', 'user76@example.com', '김이칠', '920606-2890126', '010-9999-1176', '광주광역시' FROM DUAL UNION ALL
SELECT 77, 2, 'user77', 'pass77', 'user77@example.com', '최이팔', '950303-2901234', '010-0000-1177', '대구광역시' FROM DUAL UNION ALL
SELECT 78, 3, NULL, NULL, NULL, '이구이', '900404-2012345', '010-1111-1178', '충청남도' FROM DUAL UNION ALL
SELECT 79, 1, 'user79', 'pass79', 'user79@example.com', '장팔이', '920505-2123456', '010-2222-1179', '충청북도' FROM DUAL UNION ALL
SELECT 80, 2, 'user80', 'pass80', 'user80@example.com', '김구십', '941010-2334507', '010-3333-1180', '서울특별시' FROM DUAL UNION ALL
SELECT 81, 2, 'user81', 'pass81', 'user81@example.com', '이십일', '981111-2345678', '010-4444-1181', '서울특별시' FROM DUAL UNION ALL
SELECT 82, 3, NULL, NULL, NULL, '박십이', '900101-2456789', '010-5555-1182', '서울특별시' FROM DUAL UNION ALL
SELECT 83, 1, 'user83', 'pass83', 'user83@example.com', '최십삼', '920202-2567890', '010-6666-1183', '서울특별시' FROM DUAL UNION ALL
SELECT 84, 2, 'user84', 'pass84', 'user84@example.com', '장십사', '970303-2678901', '010-7777-1184', '서울특별시' FROM DUAL UNION ALL
SELECT 85, 3,  NULL, NULL, NULL, '임십오', '900404-2789012', '010-8888-1185', '서울특별시' FROM DUAL UNION ALL
SELECT 86, 1, 'user86', 'pass86', 'user86@example.com', '김십육', '920505-2890123', '010-9999-1186', '서울특별시' FROM DUAL UNION ALL
SELECT 87, 2, 'user87', 'pass87', 'user87@example.com', '이십칠', '890606-2901234', '010-0000-1187', '서울특별시' FROM DUAL UNION ALL
SELECT 88, 3,  NULL, NULL, NULL, '박십팔', '911010-1012345', '010-1111-1188', '서울특별시' FROM DUAL UNION ALL
SELECT 89, 1, 'user89', 'pass89', 'user89@example.com', '최십구', '940111-1123456', '010-2222-1189', '서울특별시' FROM DUAL UNION ALL
SELECT 90, 2, 'user90', 'pass90', 'user90@example.com', '김이백', '920212-1234567', '010-3333-1190', '서울특별시' FROM DUAL ;

SELECT * FROM patient;

--입원
CREATE TABLE Hospitalization (
    Hospitalization_Number NUMBER PRIMARY KEY,
    Hospitalization_Date DATE NOT NULL,
    Discharge_Date DATE,    
    Inpatient_Room_Number VARCHAR2(10) NOT NULL, -- 701~801 층마다 5개 무조건 6인실
    Patient_Number NUMBER -- 1, 2, 3, 4 
);

INSERT INTO hospitalization(Hospitalization_Date,Discharge_Date,Patient_Number)
SELECT '17-10-22','17-10-26',12 FROM DUAL UNION ALL
SELECT '17-11-10','17-11-15',15 FROM DUAL UNION ALL
SELECT '18-02-03','18-03-02',17 FROM DUAL UNION ALL
SELECT '18-07-23','18-08-02',19 FROM DUAL UNION ALL
SELECT '19-08-13','19-08-15',20 FROM DUAL UNION ALL
SELECT '19-04-23','19-04-24',22 FROM DUAL UNION ALL
SELECT '20-01-16','20-01-26',25 FROM DUAL UNION ALL
SELECT '20-04-13','20-04-23',26 FROM DUAL UNION ALL
SELECT '20-03-02','20-03-03',27 FROM DUAL UNION ALL
SELECT '20-10-22','20-10-26',28 FROM DUAL UNION ALL
SELECT '20-02-11','20-02-13',37 FROM DUAL UNION ALL
SELECT '21-10-22','21-10-26',39 FROM DUAL UNION ALL
SELECT '21-10-21','21-10-26',40 FROM DUAL UNION ALL
SELECT '21-05-04','21-05-08',42 FROM DUAL UNION ALL
SELECT '22-02-16','22-02-18',43 FROM DUAL UNION ALL
SELECT '22-10-12','22-10-13',46 FROM DUAL UNION ALL
SELECT '22-07-15','22-07-18',47 FROM DUAL UNION ALL
SELECT '22-08-09','22-08-12',52 FROM DUAL UNION ALL
SELECT '22-02-16','22-03-02',60 FROM DUAL UNION ALL
SELECT '22-04-22','22-04-23',62 FROM DUAL UNION ALL
SELECT '23-11-02',NULL,65 FROM DUAL UNION ALL
SELECT '23-06-16','23-07-26',73 FROM DUAL UNION ALL
SELECT '23-09-15',NULL,76 FROM DUAL UNION ALL
SELECT '23-12-11',NULL,77 FROM DUAL UNION ALL
SELECT '23-08-27','23-08-28',83 FROM DUAL UNION ALL
SELECT '23-03-14','23-03-23',84 FROM DUAL UNION ALL
SELECT '23-04-22','23-04-26',87 FROM DUAL UNION ALL
SELECT '23-03-22','23-03-26',89 FROM DUAL UNION ALL
SELECT '23-01-04','23-01-11',90 FROM DUAL UNION ALL
SELECT '23-01-06','23-01-08',10 FROM DUAL ;

--입원실
CREATE TABLE Inpatient_Room (
    Inpatient_Room_Number VARCHAR2(10), -- 701~801 층마다 5개 무조건 6인실
    Patient_Number NUMBER, -- 제한없음
    PRIMARY KEY (Inpatient_Room_Number, Patient_Number)
);

--진료실
CREATE TABLE Medical_Room (
    Medical_Room_Number VARCHAR2(10), -- 1~4층까지 진료실 101~401
    Employee_Number VARCHAR2(10), -- hm1 ~
    PRIMARY KEY (Medical_Room_Number, Employee_Number)
);

--예약
CREATE TABLE Reservation (
	Reservation_Number VARCHAR2(20), -- 1 2 3 4
	patient_Number NUMBER NOT NULL, -- 1 2 3 4
	Reservation_Status VARCHAR2(20), --Y,N 
	Reservation_Date DATE,
	Reservation_time DATE,
	Reservation_Content VARCHAR2(255), -- 어디어디가 아프다
	Employee_Number VARCHAR2(20),
	Department_Number VARCHAR2(20) NOT NULL,
	PRIMARY KEY (Reservation_Number)
);


--***예약 정보 샘플 INSERT
--가정의학과 박지윤
INSERT INTO reservation 
(Reservation_Number, Patient_Number, Reservation_Status, Reservation_Date, Reservation_Time, Reservation_Content, Employee_Number, Department_Number)
VALUES 
('1', 1, 'Y', TO_DATE('2023-04-29', 'YYYY-MM-DD'), TO_DATE('2023-04-29 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), '배가 아파요', 'hm3', '1');

--신경과 임서연
INSERT INTO reservation 
(Reservation_Number, Patient_Number, Reservation_Status, Reservation_Date, Reservation_Time, Reservation_Content, Employee_Number, Department_Number)
VALUES 
('2', 3, 'N', TO_DATE('2023-05-30', 'YYYY-MM-DD'), TO_DATE('2023-05-30 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), '머리가 아파요', 'hm10', '8');

--가정의학과
INSERT INTO reservation 
(Reservation_Number, Patient_Number, Reservation_Status, Reservation_Date, Reservation_Time, Reservation_Content, Employee_Number, Department_Number)
VALUES 
('3', 4, 'Y', TO_DATE('2023-06-07', 'YYYY-MM-DD'), TO_DATE('2023-06-07 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), '가슴이 아파요', 'hm3', '1');

--신경과
INSERT INTO reservation 
(Reservation_Number, Patient_Number, Reservation_Status, Reservation_Date, Reservation_Time, Reservation_Content, Employee_Number, Department_Number)
VALUES 
('4', 13, 'Y', TO_DATE('2023-07-24', 'YYYY-MM-DD'), TO_DATE('2023-07-24 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), '머리가 아파요', 'hm10', '8');

--가정의학과
INSERT INTO reservation 
(Reservation_Number, Patient_Number, Reservation_Status, Reservation_Date, Reservation_Time, Reservation_Content, Employee_Number, Department_Number)
VALUES 
('5', 25, 'N', TO_DATE('2023-07-24', 'YYYY-MM-DD'), TO_DATE('2023-07-24 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), '엉덩이가 아파요', 'hm3', '1');

--신경과
INSERT INTO reservation 
(Reservation_Number, Patient_Number, Reservation_Status, Reservation_Date, Reservation_Time, Reservation_Content, Employee_Number, Department_Number)
VALUES 
('6', 38, 'Y', TO_DATE('2023-05-30', 'YYYY-MM-DD'), TO_DATE('2023-05-30 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), '머리가 아파요', 'hm10', '8');

commit;
