package bit.data.dao;

import bit.data.dto.BestCafeDto;
import bit.data.dto.ComTourDto;

import java.util.List;

public interface MainDaoInter {
    public List<ComTourDto> selectTr3List();

    public List<BestCafeDto> selectBestCafe();
}
