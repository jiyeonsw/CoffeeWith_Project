package bit.data.controller;

import bit.data.dto.UserDto;
import bit.data.service.UserServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class LoginController {

    @Autowired
    UserServiceInter userService;

    // 로그인 하기
    @PostMapping("/login")
    @ResponseBody
    public Map<String, String> loginprocess(String email_id, String ur_pw, HttpSession session) {
        Map<String, String> map = new HashMap<String, String>();
        int result = userService.getIdPassCheck(email_id, ur_pw);        // UserServiceInter에 해당 method 추가함
        if (result == 1) // 아이디와 패스워드 모두 일치하는 경우 pass
        {
            // 로그인 유지는 4시간으로 설정
            session.setMaxInactiveInterval(60 * 60 * 4);

            // 로그인한 아이디에 대한 정보를 얻어서 세션에 저장
            UserDto mdto = userService.getDataById(email_id);    // UserServiceInter에 해당 method 추가함
            session.setAttribute("loginok", "yes");
            session.setAttribute("loginid", ur_pw);
            session.setAttribute("loginname", mdto.getUr_nk());
        }
        map.put("result", result == 1 ? "success" : "fail"); // 불일치하는 경우 fail
        return map;
    }

    // 아이디 찾기
    @GetMapping("/find_id")
    public String findid() {
        return "/bit/login/find_id";
    }

    // 비밀번호 찾기
    @GetMapping("/find_pw")
    public String findpw() {
        return "/bit/login/find_pw";
    }

    @GetMapping("/logout")
    @ResponseBody
    public void logout(HttpSession session) {
        //로그아웃시 제거되어야할 세션
        session.removeAttribute("login_ok");
        session.removeAttribute("login_id");
        session.removeAttribute("login_nick");
    }

    //[임시] 세션 저장
    @GetMapping("/call_session")
    @ResponseBody
    public void callSession(HttpSession session) {
        session.setMaxInactiveInterval(60 * 60 * 12);

        UserDto dto = userService.selectDataById(3);
//        System.out.println(dto.getUr_id());
//        System.out.println(dto.getEmail_id());
//        System.out.println(dto.getUr_nk());

        session.setAttribute("login_ok", "yes");
        session.setAttribute("login_id", dto.getUr_id());
        session.setAttribute("login_nick", dto.getUr_nk());
        session.setAttribute("login_img", dto.getUr_img());
    }


    //[임시] 세션 제거
    @GetMapping("/del_session")
    @ResponseBody
    public void delSession(HttpSession session) {

        session.removeAttribute("login_ok");
        session.removeAttribute("login_id");
        session.removeAttribute("login_nick");
        session.removeAttribute("cfCmtCnt");
        session.removeAttribute("cfLkCnt'");
    }
}

