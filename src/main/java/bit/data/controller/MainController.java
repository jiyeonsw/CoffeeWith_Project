package bit.data.controller;

import bit.data.dto.BestCafeDto;
import bit.data.dto.ComFeedDto;
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
     
        List<ComTourDto> trlist = mainService.selectTr3List();
        List<BestCafeDto> cflist = mainService.selectBestCafe();

        for (BestCafeDto dto : cflist) {
            int cf_id = dto.getCf_id();
            dto.setCf_tag(cafeService.selectCtgByCfid(cf_id));
        }

        //tr
        for (ComTourDto trdto:trlist){
            int tm_cnt=mainService.selectTMcntbyTrid(trdto.getTr_id());
            trdto.setTm_cnt(tm_cnt);
        }
        
        //fd
        List<ComFeedDto> fdlist=mainService.selectFd4list();

        //model에 넣기
        mview.addObject("cflist", cflist);
        mview.addObject("trlist",trlist);
        mview.addObject("fdlist",fdlist);

        mview.setViewName("/bit/layout/main");
        return mview;
    }
}
