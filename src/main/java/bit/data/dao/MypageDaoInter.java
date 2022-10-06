package bit.data.dao;

import bit.data.dto.MyPageCafeLikeDto;

import java.util.List;

public interface MypageDaoInter {

    public int selectCfLkCnt(int loginId);

    public int selectCfCmtCnt(int loginId);

    public List<MyPageCafeLikeDto> selectLikeCfInfo(int urId);
}
