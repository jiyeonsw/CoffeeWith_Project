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

}
