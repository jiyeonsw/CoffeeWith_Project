package bit.data.service;

import bit.data.dto.CafeDto;

import java.util.List;

public interface CafeServiceInter {
    public CafeDto selectCafe(int cf_id);

    public List<CafeDto> selectAllCafe();
}
