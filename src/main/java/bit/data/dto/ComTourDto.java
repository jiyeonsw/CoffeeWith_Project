package bit.data.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class ComTourDto {

    private int tr_id;
    private int ur_id;
    private String tr_nm;
    private String tr_txt;
    private String tr_pw;
    private String tr_loc;
    private int tw_max;
    private String s_date;
    private String e_date;
    private Timestamp w_date;
    private Timestamp u_date;
    private int tr_cmp;


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
    private int tw_cnt;
    private int tm_cnt;
}

