package bit.data.controller;

import bit.data.dto.CafeCmtDto;
import bit.data.dto.CafeCtgDto;
import bit.data.dto.CafeDto;
import bit.data.dto.CafeImgDto;
import bit.data.service.CafeServiceInter;
import bit.data.service.UserServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import util.ChangeName;

import javax.servlet.http.HttpServletRequest;
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

        //댓글별점평균

        //리뷰수
        int cm_cnt=cafeService.selectCafeCmt(cf_id).size();
        dto.setCm_cnt(cm_cnt);
        //리뷰별점 평균
        int star_cnt=0;
        double sum=0;
        List<CafeCmtDto> listm=cafeService.selectCafeCmt(cf_id);
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
        //카페 카테고리
        List<CafeCtgDto> listctg=cafeService.selectCtgByCfid(cf_id);
        //모델 추가
        mview.addObject("dto",dto);
        mview.addObject("list",list);
        mview.addObject("listctg",listctg);
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
    public Map<String,Object> selectCafeImgAll(int cf_id){
        Map<String,Object> map=new HashMap<>();
        List<CafeImgDto> all_img_list=cafeService.selectCafeImgAll(cf_id);
        int ci_cnt=cafeService.selectCafeImg(cf_id).size();
        int cmi_cnt=cafeService.selectCmImgByCf(cf_id).size();
        int fdi_cnt=cafeService.selectFdImgByCf(cf_id).size();

        if (ci_cnt>0){
            String cf_img =cafeService.selectCafeImg(cf_id).get(0).getCi_nm();
            map.put("cf_img",cf_img);
            map.put("ci_path",cafeService.selectCafeImg(cf_id).get(0).getCi_path());
            //System.out.println(cafeService.selectCafeImg(cf_id).get(0).getCi_path());
        }
        if (cmi_cnt>0){
            String cm_img =cafeService.selectCmImgByCf(cf_id).get(0).getCi_nm();
            map.put("cm_img",cm_img);
            map.put("cmi_path",cafeService.selectCmImgByCf(cf_id).get(0).getCi_path());}

        if (fdi_cnt>0){
            String fd_img =cafeService.selectFdImgByCf(cf_id).get(0).getCi_nm();
            map.put("fd_img",fd_img);
            map.put("fdi_path",cafeService.selectFdImgByCf(cf_id).get(0).getCi_path());
        }

        map.put("all_img_list",all_img_list);
        return map;
    }
    @GetMapping("/img_ctg")
    @ResponseBody
    public List<CafeImgDto> selectImgCtg(int cf_id,String ctg){
        List<CafeImgDto> list=new ArrayList<>();
        if(ctg.equals("cf")){
            list= cafeService.selectCafeImg(cf_id);
        }else if(ctg.equals("cm")){
            list= cafeService.selectCmImgByCf(cf_id);
        }else if(ctg.equals("fd")){
            list= cafeService.selectFdImgByCf(cf_id);
        }else {
            list= cafeService.selectCafeImgAll(cf_id);
        }
        return list;
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
    public List<CafeCmtDto> selectCMOrder(int cf_id, String cm_order, int rl){
        List<CafeCmtDto> list_cm=cafeService.selectCMOrder(cf_id, cm_order, rl);
        List<CafeImgDto> list_null=cafeService.selectCiNull(cf_id);
        for(CafeCmtDto dto:list_cm){
            dto.setImg(cafeService.selectCmtImg(dto.getCf_id(),dto.getCm_id()));
            dto.setCm_cnt(cafeService.selectCMCntByRg(dto.getCm_id()));
            int null_id=0;
            for (CafeImgDto cmdto: list_null){
                if(dto.getCm_id() == cmdto.getCm_id()){
                    null_id=1;
                    break;
                }
            }
            dto.setImg_null_id(null_id);
        }
        return list_cm;
    }

    @PostMapping("/insert_cmt")
    @ResponseBody
    public Map<String,Object> insertCafeCmt(HttpServletRequest request, CafeCmtDto dto, @RequestParam(required = false) List<MultipartFile> uploadFiles){
        //cm_id를 위해 먼저 cmt table에 insert
        cafeService.insertCafeCmt(dto);
        String path = request.getSession().getServletContext().getRealPath("/resources/images/upload");
        System.out.println(path);

        //이미지 dto에 정보 넣기
        //System.out.println("cm_id:"+dto.getCm_id());
        //System.out.println("cf_id:"+dto.getCf_id());
        int cm_id=cafeService.selectMaxNum();
        System.out.println(cm_id);

        CafeImgDto cidto=new CafeImgDto();
        cidto.setCf_id(dto.getCf_id());
        cidto.setCm_id(cm_id);
        int idx=1;
        int checkNull=1;
        for (MultipartFile multi : uploadFiles) {
            if(multi.isEmpty()) checkNull=0;
            if (checkNull==1) {
                String upload_img = idx++ + "_" + ChangeName.getChangeFileName(multi.getOriginalFilename());
                //System.out.println("파일명:"+upload_img);
                //업로드
                try {
                    multi.transferTo(new File(path + "/" + upload_img));
                    cidto.setCi_nm(upload_img);
                    cafeService.insertCmtImg(cidto);
                } catch (IllegalStateException | IOException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }//catch
            }
        }

        //리뷰 숫자
        Map<String,Object> map=new HashMap<>();
        int cm_cnt=cafeService.selectCMCntByCfid(dto.getCf_id());
        System.out.println(cm_cnt);
        map.put("cm_cnt",cm_cnt);

        //리뷰별점 평균
        List<CafeCmtDto> listm=cafeService.selectCafeCmt(dto.getCf_id());
        int star_cnt=0;
        double sum=0;
        for (CafeCmtDto dtom : listm){
            if(dtom.getStar()==0){continue;}
            sum+=dtom.getStar();
            star_cnt++;
        }
        if(star_cnt==0){
            int cm_star = -1;
            map.put("cm_star",cm_star);
        }else {
            double avg=Math.round(sum/star_cnt*10)/10.0;
            map.put("cm_star",avg);
        }

        return map;
    }

    @GetMapping("/insert_like")
    @ResponseBody
    public Map<String,Integer> insertCafeLike(int ur_id, int cf_id){
        cafeService.insertCafeLike(ur_id,cf_id);
        Map<String,Integer> map=new HashMap<>();
        int ck_cnt = cafeService.selectCkCntbyCfid(cf_id);
        map.put("ck_cnt",ck_cnt);
        return map;
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
    public Map<String,Integer>  deleteCafeLike(int ur_id, int cf_id){
        cafeService.deleteCafeLike(ur_id,cf_id);
        Map<String,Integer> map=new HashMap<>();
        int ck_cnt = cafeService.selectCkCntbyCfid(cf_id);
        map.put("ck_cnt",ck_cnt);
        return map;
    }

    @GetMapping("/delete_cmt")
    @ResponseBody
    public Map<String,Object> deleteCafeCmt(int cm_id, int cf_id){
        cafeService.deleteCafeCmt(cm_id);

        //리뷰숫자
        Map<String,Object> map=new HashMap<>();
        int cm_cnt=cafeService.selectCMCntByCfid(cf_id);
        map.put("cm_cnt",cm_cnt);

        //리뷰별점 평균
        List<CafeCmtDto> listm=cafeService.selectCafeCmt(cf_id);
        int star_cnt=0;
        double sum=0;
        for (CafeCmtDto dtom : listm){
            if(dtom.getStar()==0){continue;}
            sum+=dtom.getStar();
            star_cnt++;
        }
        if(star_cnt==0){
            int cm_star = -1;
            map.put("cm_star",cm_star);
        }else {
            double avg=Math.round(sum/star_cnt*10)/10.0;
            map.put("cm_star",avg);
        }

        return map;
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
