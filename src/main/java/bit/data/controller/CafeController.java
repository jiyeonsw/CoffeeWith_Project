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
import java.util.List;

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
        List<CafeImgDto> list=cafeService.selectCafeImg(cf_id);
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

    @GetMapping("/selectcmt")
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
    @PostMapping("/insertcmt")
    @ResponseBody
    public void insertCafeCmt(CafeCmtDto dto){
        cafeService.insertCafeCmt(dto);
    }
}
