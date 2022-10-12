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
    public ComFeedDto selectFeed(int fd_id) {
        return session.selectOne(ns+"selectFeed",fd_id);
    }

    @Override
    public List<ComFeedDto> searchFeedByTag(Map<String, String> map) {
        return session.selectList(ns+"searchFeedByTag", map);
    }

    @Override
    public void insertFeed(ComFeedDto dto) {
        session.insert(ns+"insertFeed",dto);
    }

    @Override
    public void updateFeed(ComFeedDto dto) {
        session.update(ns+"updateFeed",dto);
    }

    @Override
    public void deleteFeed(int fd_id) {
        session.delete(ns+"deleteFeed",fd_id);
    }

    @Override
    public void updateLikes(int fd_id) {
        session.update(ns+"updateLikes",fd_id);
    }

    @Override
    public void insertPhoto(ComFeedDto dto) {
        session.insert(ns+"insertPhoto",dto);
    }

    @Override
    public List<String> selectPhoto(int fd_id) {
        return session.selectList(ns+"selectPhoto",fd_id);
    }


}
