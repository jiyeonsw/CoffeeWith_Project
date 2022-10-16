package bit.data.service;

import bit.data.dto.PlanCfTimeDto;
import bit.data.dto.PlanDto;
import bit.data.dto.PlanLocDto;

import java.sql.Date;
import java.util.List;

public interface PlanServiceInter {
    public void insertPlan(PlanDto dto);

    public PlanDto selectPlanByName(String pl_nm);

    public void insertPlanLoc(PlanLocDto dto);

    public int selectPlanCnt(int ur_id);

    public List<PlanDto> selectMyPlans(int ur_id);

    public List<PlanLocDto> selectPlanLoc(int pl_id);

    public List<PlanCfTimeDto> selectPlCfList(Date v_date, int pl_id);
}
