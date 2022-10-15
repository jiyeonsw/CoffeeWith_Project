package bit.data.service;

import bit.data.dto.CafeCmtDto;
import bit.data.dto.CafeCtgDto;
import bit.data.dto.CafeDto;
import bit.data.dto.CafeImgDto;

import java.util.List;
import java.util.Map;

public interface CafeServiceInter {
    public CafeDto selectCafe(int cf_id);
    public List<CafeDto> selectAllCafe();
    public List<CafeImgDto> selectCafeImg(int cf_id);
    public List<CafeImgDto> selectCafeImgAll(int cf_id);
    public List<CafeCmtDto> selectCafeCmt(int cf_id);
    public List<CafeCmtDto> selectCMOrder(int cf_id, String cm_order, int rl);
    public void insertCafeCmt(CafeCmtDto dto);
    public List<CafeDto> selectSearchCafe(String searchword);
    public int selectTotalCount(String searchword);
    public int selectCkCntbyCfid(int cf_id);
    public void insertCafeLike(int ur_id, int cf_id);
    public int selectCKCntbyUridNCfid(int ur_id, int cf_id);
    public void deleteCafeLike(int ur_id, int cf_id);
    public void deleteCafeCmt(int cm_id);
    public void updateCafeCmt(CafeCmtDto dto);
    public CafeCmtDto selectCafeCmtByCmid(int cm_id);
    public void insertCmtImg(CafeImgDto dto);
    public List<CafeImgDto> selectCmtImg(int cf_id, int cm_id);
    public int selectMaxNum();
    public void updateRs(int rg, int rs);
    public List<CafeCtgDto> selectCtgByCfid(int cf_id);
    public int selectCMCntByCfid(int cf_id);
    public int selectCMCntByRg(int cm_id);
    public List<CafeCtgDto> selectAllCtg();
    public List<CafeImgDto> selectFdImgByCf(int cf_id);
    public List<CafeImgDto> selectCmImgByCf(int cf_id);
    public List<CafeImgDto> selectCiNull(int cf_id);
}
