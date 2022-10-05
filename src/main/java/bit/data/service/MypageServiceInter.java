package bit.data.service;

import bit.data.dto.CafeDto;
import bit.data.dto.CafeImgDto;

import java.util.List;

public interface MypageServiceInter {
    public int selectCfLkCnt(int loginId);

    public int selectCfCmtCnt(int loginId);

    public List<CafeDto> selectCfIdNm(int loginId);

    public List<CafeImgDto> selectCfLkCi(int cfId);
}
