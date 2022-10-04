package bit.data.controller;

import bit.data.dto.CafeDto;
import bit.data.dto.CafeImgDto;
import bit.data.service.CafeServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RequestMapping("/cafe")
@Controller
public class CafeController {

    @Autowired
    CafeServiceInter cafeService;

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
}
