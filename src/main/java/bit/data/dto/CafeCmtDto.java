package bit.data.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.sql.Timestamp;
import java.util.List;

@Data
public class CafeCmtDto {
    private int cm_id;
    private int cf_id;
    private int ur_id;
    private String cm_txt;

    @JsonFormat(pattern="yyyy-MM-dd HH:mm", timezone="Asia/Seoul")
    private Timestamp w_date;
    private int rg;
    private int rs;
    private int rl;
    private int star;
    private String ur_nk;
    private List<CafeImgDto> img;
    private String ur_img;
    private int cm_cnt;

    private int img_null_id;
}
