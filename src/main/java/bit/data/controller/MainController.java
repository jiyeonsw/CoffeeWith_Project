package bit.data.controller;

import bit.data.dto.BestCafeDto;
import bit.data.dto.ComTourDto;
import bit.data.service.CafeServiceInter;
import bit.data.service.MainServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class MainController {

    @Autowired
    MainServiceInter mainService;

    @Autowired
    CafeServiceInter cafeService;

    @GetMapping("/")
    public ModelAndView selectTr3List() {
        ModelAndView mview = new ModelAndView();
        //tr
        List<ComTourDto> trlist = mainService.selectTr3List();
        List<BestCafeDto> cflist = mainService.selectBestCafe();

        for (BestCafeDto dto : cflist) {
            int cf_id = dto.getCf_id();
            dto.setCf_tag(cafeService.selectCtgByCfid(cf_id));
        }

        //model에 넣기
        mview.addObject("trlist", trlist);
        mview.addObject("cflist", cflist);
        mview.setViewName("/bit/layout/main");
        return mview;
    }
}
