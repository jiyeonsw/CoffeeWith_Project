package bit.data.controller;

import bit.data.dto.CafeDto;
import bit.data.service.CafeServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CafeController {

    @Autowired
    CafeServiceInter cafeService;

    @GetMapping("/cafe/detail")
    public ModelAndView selectCafe(int cf_id){
        ModelAndView mview=new ModelAndView();
        CafeDto dto=cafeService.selectCafe(cf_id);
        mview.addObject("dto",dto);
        mview.setViewName("/bit/cafe/cafedetail");
        return mview;
    }

}
