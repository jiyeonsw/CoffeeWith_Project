package bit.data.service;


import bit.data.dao.ComTourAnsDaoInter;
import bit.data.dto.ComTourAnsDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ComTourAnsService implements ComTourAnsServiceInter{
    @Autowired
    ComTourAnsDaoInter ansDaoInter;

    @Override
    public int getMaxNum() {
        return 0;
    }

    @Override
    public List<ComTourAnsDto> getAllAnsList(int tr_id) {

        return ansDaoInter.getAllAnsList(tr_id);
    }

    @Override
    public void insertAns(ComTourAnsDto dto) {
        ansDaoInter.insertAns(dto);
    }

    @Override
    public ComTourAnsDto getAnsData(int tm_id) {
        return null;
    }

    @Override
    public void deleteAns(int tm_id) {

    }

    @Override
    public void updateRestep(int rg, int rs) {

    }
}
