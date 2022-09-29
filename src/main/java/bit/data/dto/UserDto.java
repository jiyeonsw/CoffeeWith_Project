package bit.data.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class UserDto {
	private int num;
	private String loginid;
	private String pass;
	private String name;
	private String photo;
	private String hp;
	private String email;
	private String address;
	private Timestamp gaipday;
}
