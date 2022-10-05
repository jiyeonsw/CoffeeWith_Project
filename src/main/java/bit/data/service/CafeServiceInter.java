package bit.data.service;

import bit.data.dto.CafeCmtDto;
import bit.data.dto.CafeDto;
import bit.data.dto.CafeImgDto;

import java.util.List;

public interface CafeServiceInter {
    public CafeDto selectCafe(int cf_id);

    public List<CafeDto> selectAllCafe();
    public List<CafeImgDto> selectCafeImg(int cf_id);
    public List<CafeImgDto> selectCafeImgAll(int cf_id);
    public List<CafeCmtDto> selectCafeCmt(int cf_id);
    public List<CafeDto> selectSearchCafe(String searchword);
    public void insertCafeCmt(CafeCmtDto dto);
}
