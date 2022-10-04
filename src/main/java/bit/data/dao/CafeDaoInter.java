package bit.data.dao;

import bit.data.dto.CafeDto;
import bit.data.dto.CafeImgDto;

import java.util.List;

public interface CafeDaoInter {
    public CafeDto selectCafe(int cf_id);

    public List<CafeDto> selectAllCafe();
    public List<CafeImgDto> selectCafeImg(int cf_id);
    public List<CafeImgDto> selectCafeImgAll(int cf_id);
}
