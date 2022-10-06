package bit.data.dao;

import bit.data.dto.CafeCmtDto;
import bit.data.dto.CafeDto;
import bit.data.dto.CafeImgDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class CafeDao implements CafeDaoInter {
    @Autowired //자동으로 똑같은 이름의 빈을 찾아서 주입해줌
    SqlSession session;

    String ns = "bit.data.dao.CafeDao."; //namespace
    String nsi = "bit.data.dao.CafeImgDao.";
    String nsm = "bit.data.dao.CafeCmtDao.";


    @Override
    public CafeDto selectCafe(int cf_id) {
        return session.selectOne(ns + "selectCafe", cf_id);
    }

    @Override
    public List<CafeDto> selectAllCafe() {
        return session.selectList(ns + "selectAllCafe");
    }

    @Override
    public List<CafeImgDto> selectCafeImg(int cf_id) {
        return session.selectList(nsi + "selectCafeImg", cf_id);
    }

    @Override
    public List<CafeImgDto> selectCafeImgAll(int cf_id) {
        return session.selectList(nsi + "selectCafeImgAll", cf_id);
    }

    @Override
    public List<CafeCmtDto> selectCafeCmt(int cf_id) {
        return session.selectList(nsm + "selectCafeCmt", cf_id);
    }

    @Override
    public void insertCafeCmt(CafeCmtDto dto) {
        //System.out.println(dto.getCm_txt());
        session.insert(nsm + "insertCafeCmt", dto);
    }

    @Override
    public List<CafeDto> selectSearchCafe(Map<String, Object> map) {
        return session.selectList(ns + "selectSearchCafe", map);
    }

    @Override
    public int selectTotalCount(String searchword) {
        // TODO Auto-generated method stub
        return session.selectOne(ns + "selectTotalCount", searchword);

    }
}
