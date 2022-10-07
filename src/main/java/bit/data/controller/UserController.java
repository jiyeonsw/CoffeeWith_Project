package bit.data.controller;

import bit.data.dto.LoginDto;
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
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
//앞에 공통적으로 들어가는 매핑 설정
@RequestMapping("/")
public class UserController {
    @Autowired
    UserServiceInter userService;

    //회원가입 폼 매핑
    @GetMapping("/user_form")
    public String userform() {
        return "/bit/user/user_form";
    }

    //로그인 폼 매핑
    @GetMapping("/login_main")
    public String loginForm() {
        return "/bit/login/login_form";
    }

    //email_id 중복 체크
    @GetMapping("/id_check")
    @ResponseBody
    public Map<String, Integer> selectSearchId(String emailId) {
//        System.out.println(emailId);
        Map<String, Integer> map = new HashMap<>();
        // 아이디가 있을 경우 1, 없을 경우 0 반환
        int countId = userService.selectSearchId(emailId);
//        System.out.println(countId);
        map.put("countId", countId);

        return map;
    }

    //nickname 중복 체크
    @GetMapping("/nick_check")
    @ResponseBody
    public Map<String, Integer> selectSearchNick(String userNick) {
//        System.out.println(userNick);
        Map<String, Integer> map = new HashMap<>();
        // 닉네임이 있을 경우 1, 없을 경우 0 반환
        int countNick = userService.selectSearchNick(userNick);
//        System.out.println(countNick);
        map.put("countNick", countNick);

        return map;
    }

    //비밀번호 유효성 검사
    @PostMapping("/pass_check")
    @ResponseBody
    public boolean PassCheck(String userPass) {

        boolean check = false;

        String pwChk = "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[$@$!%*?&`~'\"+=])[A-Za-z[0-9]$@$!%*?&`~'\"+=]{7,16}$";

        Pattern pattern_symbol = Pattern.compile(pwChk);
        Matcher matcher_symbol = pattern_symbol.matcher(userPass);

        if (matcher_symbol.find()) {
            check = true;
        }
        return check;
    }


    //선호지역 시/도 출력
    @GetMapping("/select_si")
    @ResponseBody
    public List<String> selectSi() {
        List<String> list = userService.selectSubstrSi();
        return list;
    }

    //선호지역 구 출력
    @GetMapping("/select_gu")
    @ResponseBody
    public List<String> selectGu(String selGu) {
//        System.out.println("ctr:" + selGu);
        List<String> list = userService.selectSubstrGu(selGu);
        return list;
    }

    //회원가입 정보 DB insert
    @PostMapping("/insert_user")
    public String insert(UserDto dto) {
        System.out.println(dto.getEmail_id());
        System.out.println(dto.getLoc_si());

        try {
            //db.insert
            userService.insertUser(dto);
        } catch (IllegalStateException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return "redirect:/login_main";
    }

    // 회원 삭제 탈퇴
}
