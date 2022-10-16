package bit.data.dao;

import bit.data.dto.CafeCmtDto;
import bit.data.dto.CafeCtgDto;
import bit.data.dto.CafeDto;
import bit.data.dto.CafeImgDto;

import java.util.List;
import java.util.Map;

public interface CafeDaoInter {
    public CafeDto selectCafe(int cf_id);
    public List<CafeDto> selectAllCafe();
    public List<CafeDto> selectSearchCafe(String searchword);
    public List<CafeImgDto> selectCafeImg(int cf_id);
    public List<CafeImgDto> selectCafeImgAll(int cf_id);
    public List<CafeCmtDto> selectCafeCmt(int cf_id);
    public List<CafeCmtDto> selectCMOrder(Map<String,Object> map);
    public void insertCafeCmt(CafeCmtDto dto);
    public int selectTotalCount(String searchword);
    public int selectCkCntbyCfid(int cf_id);
    public void insertCafeLike(Map<String,Integer> map);
    public int selectCKCntbyUridNCfid(Map<String,Integer> map);
    public void deleteCafeLike(Map<String,Integer> map);
    public void deleteCafeCmt(int cm_id);
    public void updateCafeCmt(CafeCmtDto dto);
    public CafeCmtDto selectCafeCmtByCmid(int cm_id);
    public void insertCmtImg(CafeImgDto dto);
    public List<CafeImgDto> selectCmtImg(Map<String,Integer> map);
    public int selectMaxNum();
    public void updateRs(Map<String,Integer> map);
    public List<CafeCtgDto> selectCtgByCfid(int cf_id);
    public int selectCMCntByCfid(int cf_id);
    public int selectCMCntByRg(int cm_id);
    public List<CafeCtgDto> selectAllCtg();
    public List<CafeImgDto> selectFdImgByCf(int cf_id);
    public List<CafeImgDto> selectCmImgByCf(int cf_id);
    public List<CafeImgDto> selectCiNull(int cf_id);
}
