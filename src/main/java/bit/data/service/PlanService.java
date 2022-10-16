package bit.data.service;

import bit.data.dao.PlanDaoInter;
import bit.data.dto.PlanCfTimeDto;
import bit.data.dto.PlanDto;
import bit.data.dto.PlanLocDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @Override
    public int selectPlanCnt(int ur_id) {
        return planDao.selectPlanCnt(ur_id);
    }

    @Override
    public List<PlanDto> selectMyPlans(int ur_id) {
        return planDao.selectMyPlans(ur_id);
    }

    @Override
    public List<PlanLocDto> selectPlanLoc(int pl_id) {
        return planDao.selectPlanLoc(pl_id);
    }

    @Override
    public List<PlanCfTimeDto> selectPlCfList(Date v_date, int pl_id) {
        Map<String, Object> map = new HashMap<>();
        map.put("v_date", v_date);
        map.put("pl_id", pl_id);

        return planDao.selectPlCfList(map);
    }


}
