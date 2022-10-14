package bit.data.dto;

import lombok.Data;

import java.util.List;

@Data
public class CafeDto {
    private int cf_id;
    private String cf_nm;
    private String cf_tel;
    private String open_time;
    private String off_day;
    private String loc_addr;
    private int loc_ar;
    private int loc_sigu;
    private double loc_x;
    private double loc_y;
    private int cm_cnt;
    private int ck_cnt;
    private String menu;
    private String cf_txt;
    private List<CafeImgDto> img;
    private double cm_star;
    private int cg_id;
    private String cg_nm;

}
