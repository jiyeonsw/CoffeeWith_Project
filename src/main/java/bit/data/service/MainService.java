package bit.data.service;

import bit.data.dao.MainDaoInter;
import bit.data.dto.BestCafeDto;
import bit.data.dto.ComFeedDto;
import bit.data.dto.ComTourDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MainService implements MainServiceInter {

    @Autowired
    MainDaoInter mainDao;

    @Override
    public List<ComTourDto> selectTr3List() {
        return mainDao.selectTr3List();
    }

    @Override
    public List<BestCafeDto> selectBestCafe() {
        return mainDao.selectBestCafe();
    }
    
    @Override
    public List<ComFeedDto> selectFd4list() {
        return mainDao.selectFd4list();
    }
    
    @Override
    public int selectTMcntbyTrid(int tr_id) {
        return mainDao.selectTMcntbyTrid(tr_id);
    }
}
