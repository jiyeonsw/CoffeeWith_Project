package bit.data.controller;

import bit.data.dto.CafeDto;
import bit.data.dto.CafeImgDto;
import bit.data.service.MypageServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/")
public class MypageController {
    @Autowired
    MypageServiceInter mypageService;

    //마이페이지 top 출력
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

    @GetMapping("/mypage/bookmarks")
    public String MyPagebookmarks(HttpSession session, Model model) {
        int loginId = (int) session.getAttribute("login_id");
        List<CafeDto> list = mypageService.selectCfIdNm(loginId);
        List<CafeImgDto> ciList = null;
        for (int i = 0; i < list.size(); i++) {
            ciList = mypageService.selectCfLkCi(list.get(i).getCf_id());
        }
        System.out.println(ciList.get(0).getCi_nm());

        model.addAttribute("list", list);
//        model.addAttribute("ciList", ciList);

        return "/cmain/mypage/cont_cf_lk";
    }

    @GetMapping("/mypage/review")
    public String MyPageComment() {
        return "/cmain/mypage/cont_cf_cmt";
    }


}
