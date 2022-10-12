package bit.data.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class ComTourAnsDto {

    private int tm_id;
    private int ur_id;
    private int tr_id;
    private String tm_txt;
    private Timestamp w_date;
    private Timestamp u_date;
    private int rg;
    private int rs;
    private int rl;

    //user tabel 변수
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

