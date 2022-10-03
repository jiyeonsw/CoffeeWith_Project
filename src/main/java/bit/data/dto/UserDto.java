package bit.data.dto;

import lombok.Data;

@Data
public class UserDto {
    private int userId;
    private String userNick;
    private String userName;
    private String userPass;
    private String userTxt;
    private String userImg;
    private String emailId;
    private String naverId;
    private String kakaoId;
    private String googleId;
    private String locSi;
    private String locGu;
    private String userStatus;
    private int report;
    private String userPhnum;
}
