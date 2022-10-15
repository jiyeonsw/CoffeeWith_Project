package bit.data.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.sql.Time;

@Data
public class PlanCfTimeDto {
    private String cf_nm;
    private String ci_nm;
    private int cf_id;
    @JsonFormat(pattern = "hh-mm", timezone = "Asia/Seoul")
    private Time v_time;
}
