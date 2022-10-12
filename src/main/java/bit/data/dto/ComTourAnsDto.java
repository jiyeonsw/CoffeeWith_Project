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

    private String ur_nk;
    private String ur_nm;

}

