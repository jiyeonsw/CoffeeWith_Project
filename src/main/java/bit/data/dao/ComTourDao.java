package bit.data.dao;

import bit.data.dto.ComTourDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
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
    public List<ComTourDto> getPagingList(Map<String, Object> map) {

        return session.selectList(ns+"getPagingList",map);
    }

    @Override
    public ComTourDto getUserData(int num) {
        return session.selectOne(ns+"getUserData", num);
    }

    @Override
    public ComTourDto getData(int num) {
        return session.selectOne(ns+"selectByNum",num);
    }

    @Override
    public void updatecrw(Map<String,Integer> map) {
        session.update(ns+"updatecrw",map);
    }

    @Override
    public int getCrwCount(Map<String, Integer> map) {
        return session.selectOne(ns+"getCrwCount",map);
    }

    @Override
    public void updateComTour(ComTourDto dto)
    {
        session.update(ns+"updateList",dto);
    }

    @Override
    public void deleteComTour(int num)
    {

        session.delete(ns+"deleteList",num);
    }

    @Override
    public int getMaxNum() {
        return 0;
    }


}
