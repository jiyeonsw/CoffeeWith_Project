package bit.data.controller;

import bit.data.dto.ComFeedDto;
import bit.data.dto.ComTourDto;
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

    @GetMapping("/")
    public ModelAndView selectTr3List(){
        ModelAndView mview=new ModelAndView();
        //tr
        List<ComTourDto> trlist=mainService.selectTr3List();
        for (ComTourDto trdto:trlist){
            int tm_cnt=mainService.selectTMcntbyTrid(trdto.getTr_id());
            trdto.setTm_cnt(tm_cnt);
        }
        //fd
        List<ComFeedDto> fdlist=mainService.selectFd4list();

        //model에 넣기
        mview.addObject("trlist",trlist);
        mview.addObject("fdlist",fdlist);
        mview.setViewName("/bit/layout/main");
        return mview;
    }
}
