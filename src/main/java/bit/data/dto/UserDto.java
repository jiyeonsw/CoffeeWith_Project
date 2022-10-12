package bit.data.dto;

import lombok.Data;

@Data
public class UserDto {
    private int ur_id;
    private String ur_nk;
    private String ur_nm;
    private String ur_pw;
    private String ur_txt;
    private String ur_img;
    private String email_id;
    private String naver_id;
    private String kakao_id;
    private String google_id;
    private String loc_si;
    private String loc_gu;
    private String status;
    private int report;
    private String ur_phnum;

}
