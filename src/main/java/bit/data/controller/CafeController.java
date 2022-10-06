package bit.data.controller;

import bit.data.dto.CafeCmtDto;
import bit.data.dto.CafeDto;
import bit.data.dto.CafeImgDto;
import bit.data.service.CafeServiceInter;
import bit.data.service.UserServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequestMapping("/cafe")
@Controller
public class CafeController {

    @Autowired
    CafeServiceInter cafeService;

    @Autowired
    UserServiceInter userService;

    @GetMapping("/detail")
    public ModelAndView selectCafe(int cf_id){
        ModelAndView mview=new ModelAndView();
        CafeDto dto=cafeService.selectCafe(cf_id);
        //댓글수 댓글별점평균
        List<CafeCmtDto> listm=cafeService.selectCafeCmt(cf_id);
        int cm_cnt=0;
        double sum=0;
        for (CafeCmtDto dtom : listm){
            sum+=dtom.getStar();
            cm_cnt++;
        }
        dto.setCm_start(sum/cm_cnt);
        dto.setCm_cnt(cm_cnt);
        //좋아요 수
        int ck_cnt=cafeService.selectCkCntbyCfid(cf_id);
        dto.setCk_cnt(ck_cnt);
        //카페이미지
        List<CafeImgDto> list=cafeService.selectCafeImg(cf_id);
        //모델 추가
        mview.addObject("dto",dto);
        mview.addObject("list",list);
        mview.setViewName("/bit/cafe/cafedetail");
        return mview;
    }

    @GetMapping("/info")
    @ResponseBody
    public CafeDto selectCafeJson(int cf_id){
        return cafeService.selectCafe(cf_id);
    }
    @GetMapping("/img")
    @ResponseBody
    public List<CafeImgDto> selectCafeImgAll(int cf_id){
        return cafeService.selectCafeImgAll(cf_id);
    }

    @GetMapping("/select_cmt")
    @ResponseBody
    public List<CafeCmtDto> selectCafeCmt(int cf_id){
        List<CafeCmtDto> list=cafeService.selectCafeCmt(cf_id);
        for (CafeCmtDto dto : list){
            String ur_nk=userService.selectDataById(dto.getUr_id()).getUr_nk();
            //System.out.println(ur_nk);
            dto.setUr_nk(ur_nk);
        }
        return list;
    }
    @PostMapping("/insert_cmt")
    @ResponseBody
    public void insertCafeCmt(CafeCmtDto dto){
        cafeService.insertCafeCmt(dto);
    }

    @GetMapping("/insert_like")
    @ResponseBody
    public void insertCafeLike(int ur_id, int cf_id){
        cafeService.insertCafeLike(ur_id,cf_id);
    }

    @GetMapping("/select_like")
    @ResponseBody
    public Map<String,Integer> selectCKCntbyUridNCfid(int ur_id, int cf_id){
        Map<String,Integer> map=new HashMap<>();
        int ck_chk=cafeService.selectCKCntbyUridNCfid(ur_id,cf_id);
        //System.out.println(ck_chk);
        map.put("ck_chk",ck_chk);
        return map;
    }

    @GetMapping("/delete_like")
    @ResponseBody
    public void deleteCafeLike(int ur_id, int cf_id){
        cafeService.deleteCafeLike(ur_id,cf_id);
    }
}
