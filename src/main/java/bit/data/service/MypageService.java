package bit.data.service;

import bit.data.dao.MypageDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
