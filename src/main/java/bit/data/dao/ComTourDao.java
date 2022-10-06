package bit.data.dao;

import bit.data.dto.ComTourDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
public class ComTourDao implements ComTourDaoInter{
    @Autowired
    SqlSession session;
    String ns="bit.data.dao.ComTourDao.";


    @Override
    public void insertComTour(ComTourDto dto) {
        session.insert(ns+"insertTour", dto);
    }

    @Override
    public int getTotalCount(Map<String, String> map) {

        return session.selectOne(ns+"getTotalCount",map);
    }

    @Override
    public void updateComTour(ComTourDto dto) {

    }

    @Override
    public void deleteComTour(int num) {

    }

    @Override
    public int getMaxNum() {
        return 0;
    }


}
