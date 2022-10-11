package bit.data.service;

import bit.data.dao.PlanDaoInter;
import bit.data.dto.PlanDto;
import bit.data.dto.PlanLocDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PlanService implements PlanServiceInter {

    @Autowired
    PlanDaoInter planDao;

    @Override
    public void insertPlan(PlanDto dto) {
        planDao.insertPlan(dto);
    }

    @Override
    public PlanDto selectPlanByName(String pl_nm) {
        return planDao.selectPlanByName(pl_nm);
    }

    @Override
    public void insertPlanLoc(PlanLocDto dto) {
        planDao.insertPlanLoc(dto);
    }
}
