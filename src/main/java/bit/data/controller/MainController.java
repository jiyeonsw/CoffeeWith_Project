package bit.data.controller;

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

        //model에 넣기
        mview.addObject("trlist",trlist);
        mview.setViewName("/bit/layout/main");
        return mview;
    }
}
