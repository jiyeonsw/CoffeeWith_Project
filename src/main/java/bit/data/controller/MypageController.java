package bit.data.controller;

import bit.data.service.MypageServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/")
public class MypageController {
    @Autowired
    MypageServiceInter mypageService;

    //마이페이지 메인 출력
    @GetMapping("/mypage")
    public String MyPage(HttpSession session, Model model) {
        int loginId = (int) session.getAttribute("login_id");
        System.out.println("mypage logId:" + loginId);
        int cfLkCnt = mypageService.selectCfLkCnt(loginId);
        int cfCmtCnt = mypageService.selectCfCmtCnt(loginId);
        System.out.println("cflk :" + cfLkCnt);
        System.out.println("cfCmt :" + cfCmtCnt);
        session.setAttribute("cfLkCnt", cfLkCnt);
        session.setAttribute("cfCmtCnt", cfCmtCnt);

        return "/cwith/mypage/mypage";
    }

}
