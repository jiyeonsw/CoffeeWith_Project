package bit.data.service;

import bit.data.dao.MainDaoInter;
import bit.data.dto.ComTourDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MainService implements MainServiceInter{

    @Autowired
    MainDaoInter mainDao;

    @Override
    public List<ComTourDto> selectTr3List() {
        return mainDao.selectTr3List();
    }
}
