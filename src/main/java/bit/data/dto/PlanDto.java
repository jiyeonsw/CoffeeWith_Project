package bit.data.dto;

import com.google.protobuf.TimestampProto;
import lombok.Data;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@Data
public class PlanDto {
    private int pl_id;
    private int ur_id;
    private String pl_nm;
    private Date s_date;
    private Date e_date;
    private Timestamp w_date;
    private String pl_txt;
    private List<PlanLocDto> pl_loc;
}
