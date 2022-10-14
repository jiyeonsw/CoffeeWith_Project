package bit.data.dao;


import bit.data.dto.BestCafeDto;
import bit.data.dto.ComFeedDto;
import bit.data.dto.ComTourDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MainDao implements MainDaoInter {
    @Autowired
    SqlSession session;
    String ns = "bit.data.dao.MainDao.";

    @Override
    public List<ComTourDto> selectTr3List() {
        return session.selectList(ns + "selectTr3List");
    }

    @Override
    public List<BestCafeDto> selectBestCafe() {
        return session.selectList(ns + "selectBestCafe");
    }

    @Override
    public List<ComFeedDto> selectFd4list() {
        return session.selectList(ns+"selectFd4list");
    }

    @Override
    public int selectTMcntbyTrid(int tr_id) {
        return session.selectOne(ns+"selectTMcntbyTrid",tr_id);
    }
}
