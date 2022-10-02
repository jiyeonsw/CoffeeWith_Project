package bit.data.dao;

import bit.data.dto.ComFeedDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
@Repository
public class ComFeedDao implements ComFeedDaoInter{

    @Autowired
    SqlSession session;
    String ns="bit.data.dao.ComFeedDao.";

    @Override
    public int selectMaxNum() {
        return session.selectOne(ns+"selectMaxNum");
    }

    @Override
    public int selectTotalCount(Map<String, String> map) {
        return session.selectOne(ns+"selectTotalCount",map);
    }

    @Override
    public ComFeedDto selectFeed(int num) {
        return session.selectOne(ns+"selectFeed",num);
    }

    @Override
    public List<ComFeedDto> searchFeed(Map<String, String> map) { return session.selectList(ns+"searchFeed", map); }

    @Override
    public void insertFeed(ComFeedDto dto) {
        session.insert(ns+"insertFeed",dto);
    }

    @Override
    public void updateFeed(ComFeedDto dto) {
        session.update(ns+"updateFeed",dto);
    }

    @Override
    public void deleteFeed(int num) {
        session.delete(ns+"deleteFeed",num);
    }

    @Override
    public void updateLikes(int num) {
        session.update(ns+"updateLikes",num);
    }
}
