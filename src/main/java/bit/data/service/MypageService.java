package bit.data.service;

import bit.data.dao.MypageDao;
import bit.data.dto.MyPageCafeCmtDto;
import bit.data.dto.MyPageCafeLikeDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MypageService implements MypageServiceInter {

    @Autowired
    MypageDao mypageDao;

    @Override
    public int selectCfLkCnt(int loginId) {
        return mypageDao.selectCfLkCnt(loginId);
    }

    @Override
    public int selectCfCmtCnt(int loginId) {
        return mypageDao.selectCfCmtCnt(loginId);
    }

    @Override
    public int selectMyPlCnt(int loginId) {
        return mypageDao.selectMyPlCnt(loginId);
    }

    @Override
    public List<MyPageCafeLikeDto> selectLikeCfInfo(int urId) {
        return mypageDao.selectLikeCfInfo(urId);
    }

    @Override
    public List<MyPageCafeCmtDto> selectMyCmtCf(int loginId) {
        return mypageDao.selectMyCmtCf(loginId);
    }
}
