package bit.data.dao;

import bit.data.dto.CafeDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CafeDao implements CafeDaoInter {
    @Autowired //자동으로 똑같은 이름의 빈을 찾아서 주입해줌
    SqlSession session;
    String ns="bit.data.dao.CafeDao."; //namespace

    @Override
    public CafeDto selectCafe(int cf_id){
        return session.selectOne(ns+"selectCafe", cf_id);
    }

    @Override
    public List<CafeDto> selectAllCafe() {
        return session.selectList(ns+"selectAllCafe");
    }
}
