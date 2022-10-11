package bit.data.service;

import bit.data.dto.PlanDto;
import bit.data.dto.PlanLocDto;

public interface PlanServiceInter {
    public void insertPlan (PlanDto dto);
    public PlanDto selectPlanByName (String pl_nm);
    public void insertPlanLoc (PlanLocDto dto);
}
