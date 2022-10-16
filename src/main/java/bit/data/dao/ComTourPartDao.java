package bit.data.dao;

import bit.data.dto.ComTourPartDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Repository
public class ComTourPartDao implements ComTourPartDaoInter{
    @Autowired
    SqlSession session;

    String ns = "bit.data.dao.ComTourPartDao.";

    @Override
    public void insertPart(ComTourPartDto dto) {
        //System.out.println("Dao : "+dto);
        session.insert(ns+"insertPart",dto);
    }

    @Override
    public void updatePart(ComTourPartDto dto) {

    }

    @Override
    public void deletePart(int num) {

    }

    @Override
    public int getTotalCount(int num) {
        return session.selectOne(ns+"getTotalCount",num);
    }

    @Override
    public ComTourPartDto getData(int num) {
        return null;
    }

    @Override
    public List<ComTourPartDto> getAllPartList(int tr_id) {
        return session.selectList(ns+"selectAllPartData",tr_id);
    }
}
