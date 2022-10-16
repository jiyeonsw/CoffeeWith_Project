package bit.data.dao;

import bit.data.dto.PlanCfTimeDto;
import bit.data.dto.PlanDto;
import bit.data.dto.PlanLocDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class PlanDao implements PlanDaoInter {

    @Autowired
    SqlSession session;

    String ns = "bit.data.dao.PlanDao.";

    @Override
    public void insertPlan(PlanDto dto) {
        session.insert(ns + "insertPlan", dto);
    }

    @Override
    public PlanDto selectPlanByName(String pl_nm) {
        return session.selectOne(ns + "selectPlanByName", pl_nm);
    }

    @Override
    public void insertPlanLoc(PlanLocDto dto) {
        session.insert(ns + "insertPlanLoc", dto);
    }

    @Override
    public int selectPlanCnt(int ur_id) {
        return session.selectOne(ns + "selectPlanCnt", ur_id);
    }

    @Override
    public List<PlanDto> selectMyPlans(int ur_id) {
        return session.selectList(ns + "selectMyPlans", ur_id);
    }

    @Override
    public List<PlanLocDto> selectPlanLoc(int pl_id) {
        return session.selectList(ns + "selectPlanLoc", pl_id);
    }

    @Override
    public List<PlanCfTimeDto> selectPlCfList(Map map) {
        return session.selectList(ns + "selectPlCfList", map);
    }

}
