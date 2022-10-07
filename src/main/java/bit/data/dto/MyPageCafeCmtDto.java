package bit.data.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class MyPageCafeCmtDto {
    private int cm_id;
    private int cf_id;
    private String ci_nm;
    private String cf_nm;
    private Timestamp w_date;
    private int star;
    private String cm_txt;
}
