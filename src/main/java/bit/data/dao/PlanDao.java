package bit.data.dao;

import bit.data.dto.PlanDto;
import bit.data.dto.PlanLocDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
}
