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
import util.ChangeName;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequestMapping("/cafe")
@Controller
public class CafeController {
    String upload_img;
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
        //리뷰수
        int cm_cnt=cafeService.selectCafeCmt(cf_id).size();
        dto.setCm_cnt(cm_cnt);
        //리뷰별점 평균
        int star_cnt=0;
        double sum=0;
        for (CafeCmtDto dtom : listm){
            if(dtom.getStar()==0){continue;}
            sum+=dtom.getStar();
            star_cnt++;
        }
        if(star_cnt==0){
            dto.setCm_star(-1);
        }else {
            double avg=Math.round(sum/star_cnt*10)/10.0;
            dto.setCm_star(avg);
        }
        
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
        List<CafeCmtDto> list_cm=cafeService.selectCafeCmt(cf_id);
        for(CafeCmtDto dto:list_cm){
            dto.setImg(cafeService.selectCmtImg(dto.getCf_id(),dto.getCm_id()));
        }
        return list_cm;
    }
    @GetMapping("/select_cmt_order")
    @ResponseBody
    public List<CafeCmtDto> selectCMOrder(int cf_id, String cm_order, int rg){
        List<CafeCmtDto> list_cm=cafeService.selectCMOrder(cf_id, cm_order, rg);
        for(CafeCmtDto dto:list_cm){
            dto.setImg(cafeService.selectCmtImg(dto.getCf_id(),dto.getCm_id()));
        }
        return list_cm;
    }

    @PostMapping("/insert_cmt")
    @ResponseBody
    public void insertCafeCmt(CafeCmtDto dto, List<MultipartFile> uploadFiles){
        //cm_id를 위해 먼저 cmt table에 insert
        cafeService.insertCafeCmt(dto);
        String path= "E://Java0711//semiproject//CoffeeWith//src//main//webapp//resources//images//upload";
        System.out.println(path);
        //이미지 dto에 정보 넣기
        //System.out.println("cm_id:"+dto.getCm_id());
        //System.out.println("cf_id:"+dto.getCf_id());
        CafeImgDto cidto=new CafeImgDto();
        cidto.setCf_id(dto.getCf_id());
        cidto.setCm_id(dto.getCm_id());
        int idx=1;
        for(MultipartFile multi:uploadFiles) {
            String upload_img = idx++ + "_"+ChangeName.getChangeFileName(multi.getOriginalFilename());
            //System.out.println("파일명:"+upload_img);
            //업로드
            try {
                multi.transferTo(new File(path+"/"+upload_img));
                cidto.setCi_nm(upload_img);
                cafeService.insertCmtImg(cidto);
            } catch (IllegalStateException | IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
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

    @GetMapping("/delete_cmt")
    @ResponseBody
    public void deleteCafeCmt(int cm_id){
        cafeService.deleteCafeCmt(cm_id);
    }

    @PostMapping("/update_cmt")
    @ResponseBody
    public void updateCafeCmt(CafeCmtDto dto){
        cafeService.updateCafeCmt(dto);
    }

    @GetMapping("/select_cmt_by_cmid")
    @ResponseBody
    public CafeCmtDto selectCafeCmtByCmid(int cm_id){
        return cafeService.selectCafeCmtByCmid(cm_id);
    }

}
