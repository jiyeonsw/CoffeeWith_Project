package bit.data.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class ComFeedCmtDto {
    private int fm_id;
    private int fd_id;
    private String fm_txt;
    private Timestamp w_date;
    private Timestamp u_date;
    private int rg;
    private int rs;
    private int rl;
}
