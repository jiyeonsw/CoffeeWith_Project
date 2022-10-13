package bit.data.dao;

import bit.data.dto.ComTourPartDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ResponseBody;

@Repository
public class ComTourPartDao implements ComTourPartDaoInter{
    SqlSession session;

    String ns = "bit.data.dao.ComTourPartDao.";

    @Override
    public void insertPart(ComTourPartDto dto) {
        System.out.println(dto);
        session.insert(ns+"insertPart",dto);
    }

    @Override
    public void updatePart(ComTourPartDto dto) {

    }

    @Override
    public void deletePart(int num) {

    }

    @Override
    public ComTourPartDto getTotalCount(int num) {
        return null;
    }

    @Override
    public ComTourPartDto getData(int num) {
        return null;
    }
}
