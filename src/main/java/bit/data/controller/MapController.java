package bit.data.controller;

import bit.data.dto.CafeCmtDto;
import bit.data.dto.CafeDto;
import bit.data.service.CafeServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/map")
public class MapController {

    @Autowired
    CafeServiceInter cafeService;

    @GetMapping("/mainmap")
    public String mainmap(Model model) {
        List<CafeDto> list = cafeService.selectAllCafe();
        model.addAttribute("list", list);
        return "/bit/map/mainmap";
    }

    @PostMapping("/maketour")
    public String maketour(HttpServletRequest request,
                           @RequestParam List<Map<String, Object>> tourlist,
                           @RequestParam String tourname,
                           @RequestParam String tourdate,
                           @RequestParam String tourinfo)
    {

        String referer = request.getHeader("Referer");
        return "redirect:"+ referer;
    }

    @GetMapping("/getcafedata")
    @ResponseBody
    public Map<String,Object> getcafedata(@RequestParam int cf_id)
    {
        CafeDto dto=cafeService.selectCafe(cf_id);
        Map<String,Object> map=new HashMap<>();
        map.put("cf_id",dto.getCf_id());
        map.put("cf_nm",dto.getCf_nm());
        map.put("loc_addr",dto.getLoc_addr());
        map.put("loc_x",dto.getLoc_x());
        map.put("loc_y",dto.getLoc_y());
        return map;
    }

    @GetMapping("/search")
    @ResponseBody
    public Map<String,Object> searchcafe(@RequestParam(defaultValue = "1") int currentPage,
                                         @RequestParam(value = "searchword", required = false) String sw) {
        //페이징 처리에 필요한 변수들
        //전체 갯수
        int totalCount=cafeService.selectTotalCount(sw);
        int perPage=4;//한페이지당 보여질 글의 갯수
        int perBlock=5;//한블럭당 보여질 페이지의 갯수
        int startNum;//db에서 가져올 글의 시작번호(mysql은 첫글이 0번,오라클은 1번)
        int startPage;//각블럭당 보여질 시작페이지
        int endPage;//각 블럭당 보여질 끝페이지
        int totalPage;//총 페이지수
        int no;//각 페이지당 출력할 시작번호

        //총 페이지수를 구한다
        //총글의갯수/한페이지당보여질갯수로 나눔(7/5=1)
        //나머지가 1이라도 있으면 무조건 1페이지 추가(1+1=2페이지가 필요)
        totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);

        //각 블럭당 보여질 시작페이지
        //perBlock=5 일경우 현재페이지가 1~5 일경우는 시작페이지가 1, 끝페이지가 5
        //만약 현재페이지가 13 일경우는 시작페이지가 11, 끝페이지가 15
        startPage=(currentPage-1)/perBlock*perBlock+1;
        endPage=startPage+perBlock-1;
        //총페이지수가 23개일경우 마지막 블럭은 끝페이지가 25가 아니라 23이라야한다
        if(endPage>totalPage)
            endPage=totalPage;

        //각 페이지에서 보여질 시작번호
        //예: 1페이지->0, 2페이지:5, 3페이지 : 10...
        startNum=(currentPage-1)*perPage;

        //각페이지당 출력할 시작번호 구하기
        //예: 총글갯수가 23이라면  1페이지는 23,2페이지는 18,3페이지는 13...
        no=totalCount-(currentPage-1)*perPage;

        //검색결과
        List<CafeDto> cafelist = cafeService.selectSearchCafe(sw,startNum,perPage);
        for(CafeDto dto:cafelist)
        {
            int cf_id=dto.getCf_id();
            //이미지 추가
            dto.setImg(cafeService.selectCafeImg(cf_id));
            //좋아요 추가
            //댓글수 댓글별점평균
            List<CafeCmtDto> listm=cafeService.selectCafeCmt(cf_id);
            //리뷰수
            int cm_cnt=cafeService.selectCafeCmt(cf_id).size();
            dto.setCm_cnt(cm_cnt);
            //리뷰별점 평균
            int star_cnt=0;
            double sum=0;
            for (CafeCmtDto dtom : listm){
                if(dtom.getStar()==0){continue;}
                sum+=dtom.getStar();
                star_cnt++;
            }
            if(star_cnt==0){
                dto.setCm_star(0);
            }else {
                double avg=Math.round(sum/star_cnt*10)/10.0;
                dto.setCm_star(avg);
            };

            //좋아요 수
            int ck_cnt=cafeService.selectCkCntbyCfid(cf_id);
            dto.setCk_cnt(ck_cnt);
        }
        //return 담을 공간
        Map<String,Object> map=new HashMap<>();
        map.put("list",cafelist);
        map.put("perPage",perPage);
        map.put("perBlock",perBlock);
        map.put("totalCount",totalCount);
        map.put("currentPage",currentPage);
        map.put("startPage",startPage);
        map.put("endPage",endPage);
        map.put("no",no);
        map.put("totalPage",totalPage);
        return map;
    }
}