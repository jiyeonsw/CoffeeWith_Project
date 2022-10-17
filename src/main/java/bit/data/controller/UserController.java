package bit.data.controller;

import bit.data.dto.UserDto;
import bit.data.service.UserServiceInter;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import util.ChangeName;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
//앞에 공통적으로 들어가는 매핑 설정
@RequestMapping("/")
@RequiredArgsConstructor
public class UserController {
    private final UserServiceInter userService;

    //회원가입 폼 매핑
    @GetMapping("/user_form")
    public String userform() {
        return "/bit/user/user_form";
    }


    // 로그아웃 - LoginCotroller 연결
    @GetMapping("/logout")
    public String logout() { return "/bit/logout";}

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
    public boolean passCheck(String userPass) {
//        System.out.println(userPass);
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

    //회원가입 //  정보 DB insert
    @PostMapping("/insert_user")
    public String insertUser(UserDto dto) {
        //       System.out.println(dto.getEmail_id());
        try {
            //db.insert
            userService.insertUser(dto);
        } catch (IllegalStateException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
//      return "redirect:/login_main";
        return "/bit/login/login_form";
    }

    // 유저 정보 수정
    @PostMapping("/update_user")
    public String updateUser(HttpSession session,
                             HttpServletRequest request,
                             UserDto dto,
                             MultipartFile profile_img) {
        //Tomcat Upload path
        String path = request.getSession().getServletContext().getRealPath("/resources/prfimg");
        //        System.out.println(path);
        String file_name = "";

        if (profile_img.getOriginalFilename() == "") {

            UserDto exi_dto = userService.selectDataById((Integer) session.getAttribute("login_id"));

            //upload file name
            file_name = exi_dto.getUr_img();

            dto.setUr_img(file_name);
            userService.updateUserData(dto);

            session.setAttribute("login_nick", dto.getUr_nk());
            session.setAttribute("login_img", dto.getUr_img());
            return "redirect:/mypage/bookmarks";
        } else {
            file_name = ChangeName.getChangeFileName(profile_img.getOriginalFilename());
            //dto ur_img에 수정할 이미지 추가
            dto.setUr_img(file_name);

            try {
                profile_img.transferTo(new File(path + "/" + file_name));
                userService.updateUserData(dto);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }

            session.setAttribute("login_nick", dto.getUr_nk());
            session.setAttribute("login_img", dto.getUr_img());

            return "redirect:/mypage/bookmarks";
        }
    }

    //유저 비밀번호 변경 기능 : 기존 비밀번호 정상 체크
    @PostMapping("exi_pass_chk")
    @ResponseBody
    public boolean exiPassCheck(int ur_id, String exi_pass) {
        String passData = userService.selectUserPass(ur_id);
        boolean check = false;

        if (exi_pass.equals(passData)) {
            check = true;
        }

        return check;
    }

    // 유저 비밀번호 변경 기능 : db update
    @PostMapping("/update_pass")
    public String updateUserPass(HttpSession session, String new_pass) {
        int login_id = (int) session.getAttribute("login_id");

        userService.updateUserPass(new_pass, login_id);

        LoginController loginController = new LoginController();
        loginController.delSession(session);

        return "redirect:/user/login_main";
    }
}
