package bit.data.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BoardDto {
	private int num;
	private int readCount;
	private int likes;	
	private int regroup;
	private int restep;
	private int relevel;
	private String id;
	private String name;
	private String subject;
	private String content;
	private String photo;
	private Timestamp writeDay;
	private int acount;
}
