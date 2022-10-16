package bit.data.dao;

import bit.data.dto.MyPageCafeCmtDto;
import bit.data.dto.MyPageCafeLikeDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MypageDao implements MypageDaoInter {
    String ns = "bit.data.dao.MypageDao.";
    @Autowired
    SqlSession session;

    @Override
    public int selectCfLkCnt(int loginId) {
//        System.out.println(loginId);
        return session.selectOne(ns + "selectCfLkCnt", loginId);
    }

    @Override
    public int selectCfCmtCnt(int loginId) {
//        System.out.println(loginId);
        return session.selectOne(ns + "selectCfCmtCnt", loginId);
    }

    @Override
    public int selectMyPlCnt(int loginId) {
        return session.selectOne(ns + "selectMyPlCnt", loginId);
    }

    public List<MyPageCafeLikeDto> selectLikeCfInfo(int urId) {
        return session.selectList(ns + "selectLikeCfInfo", urId);
    }

    @Override
    public List<MyPageCafeCmtDto> selectMyCmtCf(int loginId) {
        return session.selectList(ns + "selectMyCmtCf", loginId);
    }
}
