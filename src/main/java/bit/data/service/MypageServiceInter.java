package bit.data.service;

import bit.data.dto.CafeCmtDto;
import bit.data.dto.MyPageCafeLikeDto;

import java.util.List;

public interface MypageServiceInter {
    public int selectCfLkCnt(int loginId);

    public int selectCfCmtCnt(int loginId);

    public List<MyPageCafeLikeDto> selectLikeCfInfo(int urId);

    public List<CafeCmtDto> selectMyCmt(int urId);
}
