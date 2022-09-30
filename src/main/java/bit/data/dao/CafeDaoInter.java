package bit.data.dao;

import bit.data.dto.CafeDto;

import java.util.List;

public interface CafeDaoInter {
    public CafeDto selectCafe(int cf_id);

    public List<CafeDto> selectAllCafe();
}
