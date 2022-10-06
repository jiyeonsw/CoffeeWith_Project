package bit.data.service;

import bit.data.dao.ComTourDaoInter;
import bit.data.dto.ComTourDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class ComTourService implements ComTourServiceInter{
    @Autowired
    ComTourDaoInter daoInter;

    @Override
    public void insertComTour(ComTourDto dto) {
        daoInter.insertComTour(dto);

    }

    @Override
    public int getTotalCount(String searchcolumn, String searchword) {
        Map<String,String> map = new HashMap<>();
        map.put("searchcolumn",searchcolumn);
        map.put("searchword", searchword);
        return daoInter.getTotalCount(map);
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
