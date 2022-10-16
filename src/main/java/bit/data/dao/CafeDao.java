package bit.data.dao;

import bit.data.dto.CafeCmtDto;
import bit.data.dto.CafeCtgDto;
import bit.data.dto.CafeDto;
import bit.data.dto.CafeImgDto;
import org.apache.ibatis.annotations.Select;
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
    public List<CafeCmtDto> selectCMOrder(Map<String,Object> map) {
        return session.selectList(nsm + "selectCMOrder", map);
    }
    @Override
    public void insertCafeCmt(CafeCmtDto dto) {
        //System.out.println(dto.getCm_txt());
       // System.out.println("dao cf_id:"+dto.getCf_id());
        //System.out.println("ur_id:"+dto.getUr_id());
        //System.out.println("rg:"+dto.getRg());
        //System.out.println("rs:"+dto.getRs());
        //System.out.println("rl:"+dto.getRl());
        //System.out.println("star:"+dto.getStar());
        //System.out.println("cm_txt:"+dto.getCm_txt());
        session.insert(nsm + "insertCafeCmt", dto);
    }

    @Override
    public List<CafeDto> selectSearchCafe(String searchword) {
        return session.selectList(ns + "selectSearchCafe", searchword);
    }

    @Override
    public int selectTotalCount(String searchword) {
        // TODO Auto-generated method stub
        return session.selectOne(ns + "selectTotalCount", searchword);

    }
    @Override
    public int selectCkCntbyCfid(int cf_id) {
        return session.selectOne(ns+"selectCkCntbyCfid",cf_id);
    }

    @Override
    public void insertCafeLike(Map<String, Integer> map) {
        session.insert(ns+"insertCafeLike", map);
    }

    @Override
    public int selectCKCntbyUridNCfid(Map<String, Integer> map) {
        return session.selectOne(ns+"selectCKCntbyUridNCfid", map);
    }

    @Override
    public void deleteCafeLike(Map<String, Integer> map) {
        session.delete(ns+"deleteCafeLike", map);
    }

    @Override
    public void deleteCafeCmt(int cm_id) {
        session.delete(nsm+"deleteCafeCmt", cm_id);
    }

    @Override
    public void updateCafeCmt(CafeCmtDto dto) {
        session.update(nsm+"updateCafeCmt", dto);
    }

    @Override
    public CafeCmtDto selectCafeCmtByCmid(int cm_id) {
        return session.selectOne(nsm+"selectCafeCmtByCmid", cm_id);
    }

    @Override
    public void insertCmtImg(CafeImgDto dto) {
        session.insert(nsi+"insertCmtImg", dto);
    }

    @Override
    public List<CafeImgDto> selectCmtImg(Map<String, Integer> map) {
        return session.selectList(nsi+"selectCmtImg", map);
    }
    @Override
    public int selectMaxNum() {
        return session.selectOne(nsm+"selectMaxNum");
    }
    @Override
    public void updateRs(Map<String, Integer> map) {
        session.update(nsm+"updateRs", map);
    }
    @Override
    public List<CafeCtgDto> selectCtgByCfid(int cf_id) {
        return session.selectList(ns+"selectCtgByCfid", cf_id);
    }
    @Override
    public int selectCMCntByCfid(int cf_id){return session.selectOne(nsm+"selectCMCntByCfid",cf_id);}
    @Override
    public int selectCMCntByRg(int cm_id) {
        return session.selectOne(nsm+"selectCMCntByRg",cm_id);
    }
    @Override
    public List<CafeCtgDto> selectAllCtg() {
        return session.selectList(ns + "selectAllCtg");
    }
    @Override
    public List<CafeImgDto> selectFdImgByCf(int cf_id) {
        return session.selectList(nsi+"selectFdImgByCf", cf_id);
    }
    @Override
    public List<CafeImgDto> selectCmImgByCf(int cf_id) {
        return session.selectList(nsi+"selectCmImgByCf",cf_id);
    }
    @Override
    public List<CafeImgDto> selectCiNull(int cf_id) {
        return session.selectList(nsi+"selectCiNull",cf_id);
    }
}
