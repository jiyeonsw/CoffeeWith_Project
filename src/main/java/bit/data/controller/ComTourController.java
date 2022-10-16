package bit.data.controller;

import bit.data.dto.ComFeedDto;
import bit.data.dto.ComTourDto;
import bit.data.service.ComTourServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller

public class ComTourController {
    @Autowired
    ComTourServiceInter comTourService;

    @GetMapping("/comtour/form")
    public String comtourform()
    {
        return "/comtour/comtour_form";
    }

    @GetMapping("/comtour/form2")
    public String comtourform2()
    {
        return "/bit/comtour/comtour_form";
    }

    @PostMapping("/comtour/insert")
    public String insert(ComTourDto dto){

        comTourService.insertComTour(dto);

        return "redirect:list";
    }

    @GetMapping("/comtour/delete")
    @ResponseBody
    public void delete(int num)
    {
        //System.out.println(num);
        comTourService.deleteComTour(num);
    }

    @GetMapping("/comtour/updateform") // update form을 호춯
    public String updateform(int num, Model model)
    {
        //System.out.println(num);
        ComTourDto dto = comTourService.getUserData(num);
       // System.out.println("update Dto 정보:"+dto); //DB에는 없으나 DTO에 변수가 있으면 해당 값들은 null로 가져와 짐
        model.addAttribute("dto",dto);
        return "/bit/comtour/comtour_updateform";
    }
    @PostMapping("/comtour/update") //DB를 통한 실지 업데이트
    public String updatedata(ComTourDto dto)
    {
        //System.out.println("수정된 정보확인: "+dto);
        comTourService.updateComTour(dto);
        return "redirect:list";
    }

    @PostMapping("/comtour/updatecrw")
    @ResponseBody
    public void updatecrw(int tr_cmp, int tr_id){
        //System.out.println("맴버 모집 글 번호"+tr_id);
        //System.out.println("완료 메시지"+tr_cmp);
        comTourService.updatecrw(tr_cmp, tr_id);
    }

    @PostMapping("/comtour/crwcount")
    @ResponseBody
    public Map<String,Integer> getCrwCount(int ur_id, int tr_id)
    {
        Map<String, Integer> map = new HashMap<>();
        int count = comTourService.getCrwCount(ur_id, tr_id);
        //System.out.println("넘오온 숫자:"+count);
        map.put("count", count);
        return map;

    }

    @GetMapping("/comtour/list") //검색창 영역
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

    @GetMapping("/comtour/detail") /*list 페이지에서 li 테크 클릭시 datail?num=3(tr_id:PK) 과 같이 좌측 정보를 넘겨 받음*/
    public ModelAndView detail(
            @RequestParam(value = "tr_id") int num,
            @RequestParam(defaultValue = "0") int rg,
            @RequestParam(defaultValue = "0") int rs,
            @RequestParam(defaultValue = "0") int rl,
            @RequestParam(defaultValue = "0") int tm_id) /*tr_cmt의 PK(tr_id는)*/
    {
        ComTourDto dto = comTourService.getData(num); // tr 테이블의 정보가 dto에 담겨서 넘어오는데 조인임
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
