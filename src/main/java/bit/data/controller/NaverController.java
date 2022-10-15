package bit.data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpSession;

//@Controller
//public class NaverController {
//
//    // 네이버 로그인 폼
//    @RequestMapping(value="naver_login", method=RequestMethod.GET)
//    public String loginGET() {
//        return "login/login_form";
//    }
//
//    // 네이버 로그인 콜백
//    @RequestMapping(value="naver_callBack", method= RequestMethod.GET)
//    public String callBack(){
//        return "login/naver_callBack";
//    }

    // 네이버 로그인 포스트
//    @RequestMapping(value="naver_loginPostNaver", method=RequestMethod.GET)
//    public String loginPOSTNaver(HttpSession session) {
//        return "login/loginPostNaver";
//    }

    // 네이버 세이브
//    @RequestMapping(value="naverSave", method=RequestMethod.POST)
//    public @ResponseBody String naverSave(@RequestParam("n_age") String n_age, @RequestParam("n_birthday") String n_birthday, @RequestParam("n_email") String n_email, @RequestParam("n_gender") String n_gender, @RequestParam("n_id") String n_id, @RequestParam("n_name") String n_name, @RequestParam("n_nickName") String n_nickName) {
//        System.out.println("#############################################");
//        System.out.println(n_age);
//        System.out.println(n_birthday);
//        System.out.println(n_email);
//        System.out.println(n_gender);
//        System.out.println(n_id);
//        System.out.println(n_name);
//        System.out.println(n_nickName);
//        System.out.println("#############################################");
//
//        NaverDTO naver = new NaverDTO();
//        naver.setN_age(n_age);
//        naver.setN_birthday(n_birthday);
//        naver.setN_email(n_email);
//        naver.setN_gender(n_gender);
//        naver.setN_id(n_id);
//        naver.setN_name(n_name);
//        naver.setN_nickName(n_nickName);
//
//        // ajax에서 성공 결과에서 ok인지 no인지에 따라 다른 페이지에 갈 수 있게끔 result의 기본값을 "no"로 선언
//        String result = "no";
//
//        if(naver!=null) {
//            // naver가 비어있지 않는다는건 데이터를 잘 받아왔다는 뜻이므로 result를 "ok"로 설정
//            result = "ok";
//        }
//        return result;
//    }
//}
