package bit.data.dto;

import lombok.Data;

import java.sql.Date;
import java.sql.Time;

@Data
public class PlanLocDto {
    private int po_id;
    private int pl_id;
    private int cf_id;
    private Date v_date;
    private Time v_time;
    private int seq;
    private double loc_x;
    private double loc_y;
}
