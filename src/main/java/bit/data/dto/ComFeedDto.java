package bit.data.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class ComFeedDto {
    private int fd_id;
    private int cf_id;
    private int ur_id;
    private int fg_id;
    private String fd_txt;
    private String fd_photo;
    private String fg_nm;
    private Timestamp w_date;
    private Timestamp u_date;
    private int likes;
    private int acount;

    //메인페이지용 추가
    private String cf_nm;
    private String ur_nk;
    private String ci_path;
    private String ci_nm;
    private String ur_img;
}