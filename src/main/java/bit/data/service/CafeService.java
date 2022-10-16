package bit.data.service;

import bit.data.dao.CafeDaoInter;
import bit.data.dto.CafeCmtDto;
import bit.data.dto.CafeCtgDto;
import bit.data.dto.CafeDto;
import bit.data.dto.CafeImgDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public List<CafeCmtDto> selectCMOrder(int cf_id,String cm_order, int rl) {
        Map<String, Object> map = new HashMap<>();
        map.put("cf_id",cf_id);
        map.put("cm_order",cm_order);
        map.put("rl",rl);
        return cafeDao.selectCMOrder(map);
    }

    @Override
    public void insertCafeCmt(CafeCmtDto dto) {
        int cm_id=this.selectMaxNum()+1;
        dto.setCm_id(cm_id);
        //System.out.println(dto.getCf_id());
        int rg=dto.getRg();
        int rs=dto.getRs();
        int rl=dto.getRl();
        if(rg==-1){
            rg=this.selectMaxNum()+1;
            //System.out.println(rg);
            rs=0;
            rl=0;
        }else {
            this.updateRs(rg,rs);
            System.out.println(rg);
            rs++;
            rl++;
        }
        dto.setRg(rg);
        dto.setRs(rs);
        dto.setRl(rl);
        //System.out.println("service cf_id:"+dto.getCf_id());
        //System.out.println("ur_id:"+dto.getUr_id());
        //System.out.println("rg:"+dto.getRg());
        //System.out.println("rs:"+dto.getRs());
        //System.out.println("rl:"+dto.getRl());
        //System.out.println("star:"+dto.getStar());
        //System.out.println("cm_txt:"+dto.getCm_txt());
        cafeDao.insertCafeCmt(dto);
    }

    @Override
    public List<CafeDto> selectSearchCafe(String searchword) {
        return cafeDao.selectSearchCafe(searchword);
    }

    @Override
    public int selectTotalCount(String searchword) {
        // TODO Auto-generated method stub
        return cafeDao.selectTotalCount(searchword);
    }

    @Override
    public int selectCkCntbyCfid(int cf_id) {
        return cafeDao.selectCkCntbyCfid(cf_id);
    }

    @Override
    public void insertCafeLike(int ur_id, int cf_id) {
        Map<String,Integer> map=new HashMap<>();
        map.put("ur_id", ur_id);
        map.put("cf_id",cf_id);
        cafeDao.insertCafeLike(map);
    }
    @Override
    public int selectCKCntbyUridNCfid(int ur_id, int cf_id) {
        Map<String,Integer> map=new HashMap<>();
        map.put("ur_id", ur_id);
        map.put("cf_id",cf_id);
        return cafeDao.selectCKCntbyUridNCfid(map);
    }

    @Override
    public void deleteCafeLike(int ur_id, int cf_id) {
        Map<String,Integer> map=new HashMap<>();
        map.put("ur_id", ur_id);
        map.put("cf_id",cf_id);
        cafeDao.deleteCafeLike(map);
    }

    @Override
    public void deleteCafeCmt(int cm_id) {
        cafeDao.deleteCafeCmt(cm_id);
    }

    @Override
    public void updateCafeCmt(CafeCmtDto dto) {
        cafeDao.updateCafeCmt(dto);
    }

    @Override
    public CafeCmtDto selectCafeCmtByCmid(int cm_id) {
        return cafeDao.selectCafeCmtByCmid(cm_id);
    }

    @Override
    public void insertCmtImg(CafeImgDto dto) {
        cafeDao.insertCmtImg(dto);
    }

    @Override
    public List<CafeImgDto> selectCmtImg(int cf_id, int cm_id) {
        Map<String,Integer> map=new HashMap<>();
        map.put("cf_id", cf_id);
        map.put("cm_id",cm_id);
        return cafeDao.selectCmtImg(map);
    }

    @Override
    public int selectMaxNum() {
        return cafeDao.selectMaxNum();
    }

    @Override
    public void updateRs(int rg, int rs) {
        Map<String,Integer> map=new HashMap<>();
        map.put("rg",rg);
        map.put("rs",rs);
        cafeDao.updateRs(map);
    }
    @Override
    public List<CafeCtgDto> selectCtgByCfid(int cf_id) {
        return cafeDao.selectCtgByCfid(cf_id);
    }

    @Override
    public int selectCMCntByCfid(int cf_id) {
        return cafeDao.selectCMCntByCfid(cf_id);
    }
    @Override
    public int selectCMCntByRg(int cm_id) {
        return cafeDao.selectCMCntByRg(cm_id);
    }

    @Override
    public List<CafeCtgDto> selectAllCtg() {
        return cafeDao.selectAllCtg();
    }

    @Override
    public List<CafeImgDto> selectFdImgByCf(int cf_id) {
        return cafeDao.selectFdImgByCf(cf_id);
    }

    @Override
    public List<CafeImgDto> selectCmImgByCf(int cf_id) {
        return cafeDao.selectCmImgByCf(cf_id);
    }

    @Override
    public List<CafeImgDto> selectCiNull(int cf_id){
        return cafeDao.selectCiNull(cf_id);
    }
}
