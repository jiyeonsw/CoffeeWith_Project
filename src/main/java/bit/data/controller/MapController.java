package bit.data.controller;

import bit.data.dto.*;
import bit.data.service.CafeServiceInter;
import bit.data.service.PlanServiceInter;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import util.ChangeDate;

import javax.servlet.http.HttpSession;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/map")
public class MapController {

    @Autowired
    CafeServiceInter cafeService;

    @Autowired
    PlanServiceInter planService;

    @GetMapping("/mainmap")
    public String mainMap(Model model,
                          @RequestParam(defaultValue = "37.4993705") String lat,
                          @RequestParam(defaultValue = "127.0290175") String lng,
                          @RequestParam(defaultValue = "10") String zoom)
                          //@RequestParam(defaultValue = "") String sw)
    {
        List<CafeDto> list = cafeService.selectAllCafe();
        List<CafeCtgDto> ctglist = cafeService.selectAllCtg();
        //카테고리 제한
        //제한할 갯수
        int pop = 7;
        for(int i=0;i < pop; i++)
        {
            ctglist.remove(ctglist.size()-1);
        }
        var dlat = Double.parseDouble(lat);
        var dlng = Double.parseDouble(lng);
        var dzoom = Integer.parseInt(zoom);
        model.addAttribute("zoom", dzoom);
        model.addAttribute("lat", dlat);
        model.addAttribute("lng", dlng);
        model.addAttribute("list", list);
        //model.addAttribute("sw", sw);
        model.addAttribute("ctglist",ctglist);
        return "/bit/map/mainmap";
    }

    @PostMapping("/maketour")
    public String makeTour(HttpSession session,
                           @RequestParam String tourlist,
                           @RequestParam String tourname,
                           @RequestParam String tourdate,
                           @RequestParam String tourinfo) throws ParseException {
        int loginId = (int) session.getAttribute("login_id");

        //pl 테이블에 입력할 dto
        PlanDto dto = new PlanDto();
        dto.setUr_id(loginId);
        dto.setPl_nm(tourname);
        dto.setS_date(ChangeDate.getS_Date(tourdate));
        dto.setE_date(ChangeDate.getE_Date(tourdate));
        dto.setPl_txt(tourinfo);
        planService.insertPlan(dto);

        //pl_loc에 세부 정보 입력
        //입력 받은tourname을 가진 pl_id가져오기
        PlanDto ndto = planService.selectPlanByName(tourname);
        int pl_id = ndto.getPl_id();
        //String to JSON
        JSONParser jsonParser = new JSONParser();
        JSONArray tourArray = (JSONArray)jsonParser.parse(tourlist);
        //String to Time
        SimpleDateFormat toDate = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat toTime = new SimpleDateFormat("HH:mm");

        //날짜수 만큼 반복
        for (int i=0; i<tourArray.size();i++){
            //임시 dayJSON 오브젝트
            JSONObject obj = new JSONObject();
            //해당 날짜 JSON
            obj = (JSONObject)tourArray.get(i);
            //JSON오브젝트에서 v_date데이터 뽑고 String 으로 변환
            String v_date = obj.get("day").toString();
            //date 담을 임시 Date 타입
            Date vdate = null;
            try {
                vdate = toDate.parse(v_date);
            } catch (java.text.ParseException e) {
                throw new RuntimeException(e);
            }
            //tour정보 얻기 (Array로)
            JSONArray dayArray = (JSONArray)obj.get("tours");
            for (int j=0; j< dayArray.size(); j++){
                //pl_loc테이블에 입력할 dto
                PlanLocDto plocdto = new PlanLocDto();
                //임시 tourJSON 오브젝트
                JSONObject tobj = new JSONObject();
                //해당 카페 JSON
                tobj = (JSONObject)dayArray.get(j);
                //JSON오브젝트에서 v_time데이터 뽑고 String 으로 변환
                String v_time = tobj.get("visit_time").toString();
                //시간을 담을 임시 Date 타입
                Date vtime= null;
                try {
                    //뽑은 String을 time형태로 변환
                    vtime = toTime.parse(v_time);
                } catch (java.text.ParseException e) {
                    throw new RuntimeException(e);
                }
                //cf_id얻기
                String cf_id = tobj.get("cf_id").toString();
                //dto에 데이터 각각 넣기
                plocdto.setPl_id(pl_id);
                plocdto.setCf_id(Integer.parseInt(cf_id));
                plocdto.setV_time(new Time(vtime.getTime()));
                plocdto.setSeq(j);
                plocdto.setV_date(new java.sql.Date(vdate.getTime()));
                //DB에 넣기 (pl_loc)테이블
                planService.insertPlanLoc(plocdto);
            }
        }
        return "redirect:mainmap";
    }

    @GetMapping("/getcafedata")
    @ResponseBody
    public Map<String,Object> getCafeData(@RequestParam int cf_id)
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
    public Map<String,Object> searchCafe(@RequestParam(defaultValue = "1") int currentPage,
                                         @RequestParam(value = "searchword", required = false) String sw) {
        //페이징 처리에 필요한 변수들
        //검색결과
        List<CafeDto> cafelist = cafeService.selectSearchCafe(sw);
        List<CafeDto> scafelist = new ArrayList<>();
        //전체 갯수
        int totalCount=cafelist.size();
        int perPage=3;//한페이지당 보여질 글의 갯수
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
        if(currentPage>totalPage)
        {
            currentPage=1;
        }

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

        int testNum = startNum + perPage;

        for (int i = startNum; i < testNum; i++) {
            try {
                if (cafelist.get(i).getCf_nm() != null) {
                    CafeDto scafeDto = cafelist.get(i);
                    scafelist.add(scafeDto);
                }
            } catch (IndexOutOfBoundsException iobe) {
                iobe.getMessage();
            }
        }
        for(CafeDto dto:scafelist)
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
        map.put("slist",scafelist);
        map.put("perPage",perPage);
        map.put("perBlock",perBlock);
        map.put("totalCount",totalCount);
        map.put("rcurrentPage",currentPage);
        map.put("startPage",startPage);
        map.put("endPage",endPage);
        map.put("no",no);
        map.put("totalPage",totalPage);
        return map;
    }
}