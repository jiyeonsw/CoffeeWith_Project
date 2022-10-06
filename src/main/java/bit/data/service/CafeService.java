package bit.data.service;

import bit.data.dao.CafeDaoInter;
import bit.data.dto.CafeCmtDto;
import bit.data.dto.CafeDto;
import bit.data.dto.CafeImgDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CafeService implements CafeServiceInter {

    @Autowired
    CafeDaoInter cafeDao;

    @Override
    public CafeDto selectCafe(int cf_id) {
        return cafeDao.selectCafe(cf_id);
    }

    @Override
    public List<CafeDto> selectAllCafe() {
        return cafeDao.selectAllCafe();
    }

    @Override
    public List<CafeImgDto> selectCafeImg(int cf_id) {
        return cafeDao.selectCafeImg(cf_id);
    }

    @Override
    public List<CafeImgDto> selectCafeImgAll(int cf_id) {
        return cafeDao.selectCafeImgAll(cf_id);
    }

    @Override
    public List<CafeCmtDto> selectCafeCmt(int cf_id) {
        return cafeDao.selectCafeCmt(cf_id);
    }

    @Override
    public void insertCafeCmt(CafeCmtDto dto) {
        //System.out.println(dto.getCf_id());
        cafeDao.insertCafeCmt(dto);
    }

    @Override
    public List<CafeDto> selectSearchCafe(String searchword, int startnum, int perpage) {
        Map <String,Object> map=new HashMap<>();
        map.put("searchword",searchword);
        map.put("startnum", startnum);
        map.put("perpage", perpage);
        return cafeDao.selectSearchCafe(map);
    }
    
    @Override
    public int selectTotalCount(String searchword) {
        // TODO Auto-generated method stub
        return cafeDao.selectTotalCount(searchword);
    }

    @Override
    public int selectCkCntbyCfid(int cf_id) {
        return cafeDao.selectCkCntbyCfid(cf_id);
    }

    @Override
    public void insertCafeLike(int ur_id, int cf_id) {
        Map<String,Integer> map=new HashMap<>();
        map.put("ur_id", ur_id);
        map.put("cf_id",cf_id);
        cafeDao.insertCafeLike(map);
    }
    @Override
    public int selectCKCntbyUridNCfid(int ur_id, int cf_id) {
        Map<String,Integer> map=new HashMap<>();
        map.put("ur_id", ur_id);
        map.put("cf_id",cf_id);
        return cafeDao.selectCKCntbyUridNCfid(map);
    }

    @Override
    public void deleteCafeLike(int ur_id, int cf_id) {
        Map<String,Integer> map=new HashMap<>();
        map.put("ur_id", ur_id);
        map.put("cf_id",cf_id);
        cafeDao.deleteCafeLike(map);
    }
}
