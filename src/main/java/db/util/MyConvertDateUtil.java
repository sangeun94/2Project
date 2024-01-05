package db.util;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

//날짜 변환하는 기능을 가진 클래스
public class MyConvertDateUtil {

	public static Timestamp convertLocalDateTimeToTimestamp(LocalDateTime ldt) { //static 은 바로 . 변환가능하니까!
		//LocalDateTime 을 Timestamp 로 바꾸는
		return Timestamp.valueOf(ldt);
	}
	
	public static LocalDateTime convertTimestampToLocalDateTime(Timestamp ts) {
		//Timestamp 를 LocalDateTime 로 바꾸는
		return ts.toLocalDateTime();
	}
	
	public static String convertLocalDateTimeToStringYYYYMMDD(LocalDateTime ldt) {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd"); //이런패턴으로 만들겠다!
		String result = ldt.format(dtf); //ldt를 dtf패턴으로 만들겠다!
		return result;
	}
	
	public static String convertLocalDateTimeToStringYYYYMMDD2(LocalDateTime ldt) {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd"); //이런패턴으로 만들겠다!
		String result = ldt.format(dtf); //ldt를 dtf패턴으로 만들겠다!
		return result;
	}
	
	public static String convertLocalDateTimeToStringYMDHDS(LocalDateTime ldt) {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"); //이런패턴으로 만들겠다!
		String result = ldt.format(dtf); //ldt를 dtf패턴으로 만들겠다!
		return result;
	}
	
	//String이 주어지면 LocalDate, LocalDateTime 으로 바꿀 수 있음
	public static LocalDate convertStringToLocalDate(String str) {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate ld = LocalDate.parse(str, dtf); //LocalDate로 하면 시간명시 안해줘도 됨
		return ld;
	}
	
	//String "yyyy-MM-dd" -> LocalDateTime
	public static LocalDateTime convertStringToLocalDateTime(String str) {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate ld = LocalDate.parse(str, dtf); //LocalDate로 하면 시간명시 안해줘도 됨
		LocalDateTime ldt = ld.atStartOfDay(); //LocalDate -> LocalDateTime
		return ldt;
	}
	
	//String "yyyy/MM/dd" -> LocalDateTime
	public static LocalDateTime convertStringToLocalDateTime2(String str) {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd"); //이런형식으로 들어왔을때
		LocalDate ld = LocalDate.parse(str, dtf); //LocalDate로 하면 시간명시 안해줘도 됨
		LocalDateTime ldt = ld.atStartOfDay(); //LocalDate -> LocalDateTime
		return ldt;
	}
	
	//String "yyyyMMdd" -> LocalDateTime
	public static LocalDateTime convertStringToLocalDateTime3(String str) {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyyMMdd"); //이런형식으로 들어왔을때
		LocalDate ld = LocalDate.parse(str, dtf); //LocalDate로 하면 시간명시 안해줘도 됨
		LocalDateTime ldt = ld.atStartOfDay(); //LocalDate -> LocalDateTime
		return ldt;
	}
	
}
