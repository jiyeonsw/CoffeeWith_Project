package bit.data.controller;

import bit.data.dto.CafeCmtDto;
import bit.data.dto.MyPageCafeLikeDto;
import bit.data.service.MypageServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/")
public class MypageController {
    @Autowired
    MypageServiceInter mypageService;

    //MyPage top View
    @GetMapping("/mypage")
    public String MyPage(HttpSession session, Model model) {
        int loginId = (int) session.getAttribute("login_id");
//        System.out.println("mypage logId:" + loginId);
        int cfLkCnt = mypageService.selectCfLkCnt(loginId);
        int cfCmtCnt = mypageService.selectCfCmtCnt(loginId);
//        System.out.println("cflk :" + cfLkCnt);
//        System.out.println("cfCmt :" + cfCmtCnt);
        session.setAttribute("cfLkCnt", cfLkCnt);
        session.setAttribute("cfCmtCnt", cfCmtCnt);

        return "/cwith/mypage/mypage";
    }

    //MyPage contents - Bookmarks View
    @GetMapping("/mypage/bookmarks")
    public String bookmarkList(
            @RequestParam(defaultValue = "1") int currentPage,
            @RequestParam(value = "searchColumn", required = false) String sc,
            @RequestParam(value = "searchWord", required = false) String sw,
            HttpSession session, Model model) {
        int loginId = (int) session.getAttribute("login_id");

        //paging 처리
        int totalCount = mypageService.selectCfCmtCnt(loginId);
        int perPage = 12;// 한페이지당 보여질 북마크의 개수
        int perBlock = 3;// 한블럭당 보여질 페이지의 개수
        int startNum; // db에서 가져올 북마크 시작번호(mysql 0부터 시작)
        int startPage;// 각 블럭당 보여질 시작페이지
        int endPage;// 각 블럭당 보여질 끝페이지
        int totalPage;// 총 페이지수
        int no;// 각 페이지당 출력할 시작번호

        // 총 페이지수를 구하기
        // 총 북마크의 개수/한페이지당 보여질 개수로 나눔(7/5=1)
        // 나머지가 1이라도 있으면 무조건 1 페이지 추가(1+1=2페이지가 필요)
        totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);

        // 각 블럭당 보여질 시작페이지
        // perBlock=5 일경우 현재페이지가 1~5 일경우는 시작페이지가 1, 끝페이지가 5
        // 만약 현재페이지가 13 일경우는 시작페이지가 11, 끝페이지가 15
        startPage = (currentPage - 1) / perBlock * perBlock + 1;
        endPage = startPage + perBlock - 1;

        // 총페이지수가 23개일경우 마지막 블럭은 끝페이지가 25가 아니라 23이라야한다
        if (endPage > totalPage)
            endPage = totalPage;

        // 각 페이지에서 보여질 시작번호
        // 예: 1페이지->0, 2페이지:5, 3페이지 : 10...
        startNum = (currentPage - 1) * perPage;

        // 각페이지당 출력할 시작번호 구하기
        // 예: 총글갯수가 23이라면 1페이지는 23,2페이지는 18,3페이지는 13...
        no = totalCount - (currentPage - 1) * perPage;

        List<MyPageCafeLikeDto> list = mypageService.selectLikeCfInfo(loginId);
//        System.out.println(list.get(0).getCf_id());
        model.addAttribute("list", list);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("no", no);
        model.addAttribute("totalPage", totalPage);

        return "/cmain/mypage/cont_cf_lk";
    }

    //MyPage contents - Review View
    @GetMapping("/mypage/review")
    public String selectMyCmt(HttpSession session, Model model) {
        int loginId = (int) session.getAttribute("login_id");
        List<CafeCmtDto> cmtList = mypageService.selectMyCmt(loginId);

        Map<Object, String> map = new HashMap<>();
        map.put(0, "☆☆☆☆☆");
        map.put(1, "★☆☆☆☆");
        map.put(3, "★★★☆☆");
        map.put(4, "★★★★☆");
        map.put(5, "★★★★★");

        model.addAttribute("cmtList", cmtList);
        model.addAttribute("map", map);
        return "/cmain/mypage/cont_cf_cmt";
    }
}
