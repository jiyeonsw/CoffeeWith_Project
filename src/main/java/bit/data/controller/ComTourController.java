package bit.data.controller;

import bit.data.dto.ComFeedDto;
import bit.data.dto.ComTourDto;
import bit.data.service.ComTourServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller

public class ComTourController {
    @Autowired
    ComTourServiceInter comTourService;

    @GetMapping("/comtour/form")
    public String comtourform(){
        return "/comtour/comtour_form";
    }

    @PostMapping("/comtour/insert")
    public String insert(ComTourDto dto){

        comTourService.insertComTour(dto);
        int tr_id = dto.getTr_id();
        int ur_id = dto.getUr_id(); // Db에서 꺼내오는 방법은 새로 호출해서 가져와야 하나?


        return "redirect:list?ur_id="+ur_id;
    }

    @GetMapping("/comtour/list")
    public String comtourlist(Model model,
                              @RequestParam(value = "searchcolumn", required = false) String sc,
                              @RequestParam(value = "searchword", required = false) String sw
                              )
    {
        /*System.out.println(ur_id);
        //ur_id에 해당하는 정보 가지고 오기
        ComTourDto dto = comTourService.getUserData(ur_id);*/
        //전체 게시글 갯수 구하기
        int totalCount = comTourService.getTotalCount(sc,sw);

        //검색정보에 해당하는 list를 선언
        List<ComTourDto> list = comTourService.getPagingList(sc,sw);

        //model에 입력하기
        model.addAttribute("totalCount",totalCount);
        model.addAttribute("list", list);
        return "/bit/comtour/comtour_list";
    }

    @GetMapping("/comtour/detail") /*?num=3*/
    public ModelAndView detail(
            @RequestParam(value = "tr_id") int num,
            @RequestParam(defaultValue = "0") int rg,
            @RequestParam(defaultValue = "0") int rs,
            @RequestParam(defaultValue = "0") int rl,
            @RequestParam(defaultValue = "0") int tm_id) /*answer의 PK*/
    {
        ComTourDto dto = comTourService.getData(num);
        //System.out.println(dto);
        ModelAndView mview = new ModelAndView();
        mview.addObject("dto",dto);

        /*계층형 처리*/
        mview.addObject("rg",rg);
        mview.addObject("rs",rs);
        mview.addObject("rl",rl);
        mview.addObject("tm_id",tm_id);
        mview.setViewName("/bit/comtour/comtour_detail");

        return mview;
    }

};
