package db.dto;

import java.time.LocalDate;

public class BoardDTO {

	private int board_number;
	private String title;
	private String content;
	private String name;
	private LocalDate regdate;
	private int viewcnt;
	
	
	public BoardDTO(String title , String content, String name) {
		this.title = title;
		this.content = content;
		this.name = name;
		
		
	}
	public BoardDTO() {}
	
	public BoardDTO(int board_number, String title, String content, String name, LocalDate regdate, int viewcnt) {
		super();
		this.board_number = board_number;
		this.title = title;
		this.content = content;
		this.name = name;
		this.regdate = regdate;
		this.viewcnt = viewcnt;
	}
	public int getBoard_number() {
		return board_number;
	}
	public void setBoard_number(int board_number) {
		this.board_number = board_number;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public LocalDate getRegdate() {
		return regdate;
	}
	public void setRegdate(LocalDate regdate) {
		this.regdate = regdate;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}

	
	
}
