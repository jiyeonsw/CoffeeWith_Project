package bit.data.controller;

import bit.data.dto.UserDto;
import bit.data.service.UserServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/user") // 공통매핑
public class LoginController {
    @Autowired
    UserServiceInter userService;

    // 커윗소개
    @GetMapping("/intro")
    public String intro(HttpSession session){
        session.removeAttribute("intro");
        return "/bit/layout/introduction";
    }

    //로그인 폼 매핑
    @GetMapping("/login_main")
    public String loginForm(HttpSession session) {
        session.removeAttribute("login_ok");
        return "/bit/login/login_form";
    }

    // 로그인 하기
    @PostMapping("/login") // loginprocess
    public String login(String email_id, String ur_pw, HttpSession session) {
        Map<String, String> map = new HashMap<String, String>();
        int result = userService.getIdPassCheck(email_id, ur_pw);
        // 아이디와 패스워드 모두 일치하는 경우 (result == 1)
        if (result == 1) {
            UserDto dto = userService.selectEmailId(email_id);
            // 세션주기 // 로그인 유지 4시간
            session.setMaxInactiveInterval(60 * 60 * 4);
            session.setAttribute("login_ok", "yes");
            session.setAttribute("login_id", dto.getUr_id());
            session.setAttribute("login_nick", dto.getUr_nk());
            session.setAttribute("login_img", dto.getUr_img());
            // 로그인시 메인 공통 화면으로 보내기
            return "redirect:../";
            // return "/bit/layout/main";
        } else {
            // 아이디 또는 패스워드가 일치하지 않는 경우 (no)
            session.setAttribute("login_ok","no");
            // 다시 로그인 폼으로 이동
            // return "redirect:../login_main";
            return "/bit/login/login_form";
        }
    }

    @GetMapping("/naver_callback")
    public String naverCallback(HttpSession session) {
        return "/bit/login/naver_callback";
    }

    //네이버 회원가입&로그인

//    @PostMapping("/loginnaver")
//    @ResponseBody
//
//    public Map<String, String> usernaverloginprocess(String email_id, HttpSession session, UserDto dto){
//        Map<String, String> map=new HashMap<String, String>();
//        int result = userService.getUserIdSearch(email_id);  //user 가입된 이메일 있으면 가입 안됨.
//
//        // 해당 email로 가입된 유저 정보가 없으면 DB insert로 진행
//        if(result==0) {   // 아닐 때
//            System.out.println(result);
//            dto.setEmail_id("0");
//            dto.setUr_pw("0");
//            dto.setStatus("정상");
//            userService.insertUser(dto);
//            //유지 시간 설정
//            session.setMaxInactiveInterval(60*60*4);//4시간
//
//            //로그인한 아이디에 대한 정보를 얻어서 세션에 저장
//            UserDto userDto=userService.selectDataByNaver(email_id);
//            session.setAttribute("loginok", "yes");
//            session.setAttribute("loginid", email_id);
//            session.setAttribute("loginname", userDto.getUr_nm());
//        }else{
//            // 로그인으로
//            //유지 시간 설정 //4시간
//            session.setMaxInactiveInterval(60*60*4);
//            //로그인한 아이디에 대한 정보를 얻어서 세션에 저장s
//            UserDto userDto=userService.selectDataByNaver(email_id);
//            session.setAttribute("loginok", "yes");
//            session.setAttribute("loginid", email_id);
//            session.setAttribute("loginname", userDto.getUr_nm());
//        }
//        map.put("result",email_id!=null?"success":"fail");
//        System.out.println(map);
//        return map;
//    }

    // 로그아웃 하기
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        //로그아웃시 제거되어야할 세션
        session.removeAttribute("login_ok");
        session.removeAttribute("login_id");
        session.removeAttribute("login_nick");
        session.removeAttribute("login_img");
        // 로그아웃시 메인 화면으로 보내기
        //return "redirect:../";
        return "/bit/layout/main";
    }

    // 로그아웃 - User Cotroller
//    @GetMapping("/logout")
//    public String logout() { return "/bit/logout";}

    // 아이디 찾기
    @GetMapping("/find_id")
    public String findid() {
        return "/bit/login/find_id";
    }

    @PostMapping("/submit_find_id")
    public String submitFindId(String ur_nm) {
        String email = userService.getUserEmailByName(ur_nm);
        return "redirect:/user/find_id?email=" + email;
    }

    // 비밀번호 찾기
    @GetMapping("/find_pw")
    public String findpw() {
        return "/bit/login/find_pw";
    }

    @PostMapping("/submit_find_pw")
    public String submitFindPw(String email_id) {
        String pw = userService.getUserPwByEmail(email_id);
        String maskedPw = pw.length() < 3 ? pw : pw.substring(0, pw.length() - 3) + "***";
        return "redirect:/user/find_pw?pw=" + maskedPw;
    }

    ////////////////////////////////////////

    //[임시] 세션 저장
    @GetMapping("/call_session")
    @ResponseBody
    public void callSession(HttpSession session) {
        session.setMaxInactiveInterval(60 * 60 * 12);
        UserDto dto = userService.selectDataById(2);

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
        session.removeAttribute("login_img");
        session.removeAttribute("login_nick");
        session.removeAttribute("cfCmtCnt");
        session.removeAttribute("cfLkCnt'");
    }
}

