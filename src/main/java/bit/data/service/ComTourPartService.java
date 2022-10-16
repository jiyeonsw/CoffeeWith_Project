package bit.data.service;


import bit.data.dao.ComTourPartDaoInter;
import bit.data.dto.ComTourPartDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ComTourPartService implements ComTourPartServiceInter{

    @Autowired
    ComTourPartDaoInter partDaoInter;

    @Override
    public void insertPart(ComTourPartDto dto) {
        //System.out.println("Service : "+dto);
        partDaoInter.insertPart(dto);
    }

    @Override
    public void updatePart(ComTourPartDto dto) {

    }

    @Override
    public void deletePart(int num) {

    }

    @Override
    public int getTotalCount(int num) {
        return partDaoInter.getTotalCount(num);
    }

    @Override
    public ComTourPartDto getData(int num) {
        return null;
    }

    @Override
    public List<ComTourPartDto> getAllPartList(int tr_id) {
        return partDaoInter.getAllPartList(tr_id);
    }
}
