package bit.data.dao;

import bit.data.dto.PlanCfTimeDto;
import bit.data.dto.PlanDto;
import bit.data.dto.PlanLocDto;

import java.util.List;
import java.util.Map;

public interface PlanDaoInter {
    public void insertPlan(PlanDto dto);

    public PlanDto selectPlanByName(String pl_nm);

    public void insertPlanLoc(PlanLocDto dto);

    public int selectPlanCnt(int ur_id);

    public List<PlanDto> selectMyPlans(int ur_id);

    public List<PlanLocDto> selectPlanLoc(int pl_id);

    public List<PlanCfTimeDto> selectPlCfList(Map map);
}
