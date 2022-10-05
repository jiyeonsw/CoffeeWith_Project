package bit.data.service;

import bit.data.dao.CafeDaoInter;
import bit.data.dto.CafeCmtDto;
import bit.data.dto.CafeDto;
import bit.data.dto.CafeImgDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CafeService implements CafeServiceInter {

    @Autowired
    CafeDaoInter cafeDao;

    @Override
    public CafeDto selectCafe(int cf_id) {
        return cafeDao.selectCafe(cf_id);
    }

    @Override
    public List<CafeDto> selectAllCafe() {
        return cafeDao.selectAllCafe();
    }

    @Override
    public List<CafeImgDto> selectCafeImg(int cf_id) {
        return cafeDao.selectCafeImg(cf_id);
    }

    @Override
    public List<CafeImgDto> selectCafeImgAll(int cf_id) {
        return cafeDao.selectCafeImgAll(cf_id);
    }

    @Override
    public List<CafeCmtDto> selectCafeCmt(int cf_id) {
        return cafeDao.selectCafeCmt(cf_id);
    }

    @Override
    public List<CafeDto> selectSearchCafe(String searchword) {
        return cafeDao.selectSearchCafe(searchword);

    }
}
