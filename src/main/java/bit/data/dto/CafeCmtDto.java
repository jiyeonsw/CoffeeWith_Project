package bit.data.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class CafeCmtDto {
    private int cm_id;
    private int cf_id;
    private int ur_id;
    private String cm_txt;
    private Timestamp w_date;
    private int rg;
    private int rs;
    private int rl;
    private int star;
}
