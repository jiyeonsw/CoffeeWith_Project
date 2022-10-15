package bit.data.dto;

import lombok.Data;

import java.util.List;

@Data
public class BestCafeDto {
    private int cf_id;
    private String cf_nm;
    private String cf_txt;
    private String addr;
    private int lk_cnt;
    private String star_avg;
    private int cmt_cnt;
    private String ci_img;
    private List<CafeCtgDto> cf_tag;
}

