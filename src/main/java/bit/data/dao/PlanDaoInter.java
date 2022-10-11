package bit.data.dao;

import bit.data.dto.PlanDto;
import bit.data.dto.PlanLocDto;

public interface PlanDaoInter {
    public void insertPlan (PlanDto dto);
    public PlanDto selectPlanByName (String pl_nm);

    public void insertPlanLoc (PlanLocDto dto);
}
