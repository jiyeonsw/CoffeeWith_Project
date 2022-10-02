package bit.data.controller;

import bit.data.dto.UserDto;
import bit.data.service.UserServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class LoginController {

    @Autowired
    UserServiceInter userService;
   /*
   @GetMapping("/login")
   @ResponseBody
   public Map<String, String> loginprocess(String id, String pass, HttpSession session)
   {
      Map<String, String> map=new HashMap<String, String>();
      int result=userService.getIdPassCheck(id, pass);
      if(result==1)
      {
         //유지시간
         session.setMaxInactiveInterval(60*60*4);//4시간
         //로그인한 아이디에 대한 정보를 얻어서 세션에 저장
         UserDto userDto=userService.getDataById(id);
         session.setAttribute("loginok", "yes");
         session.setAttribute("loginid", id);
         session.setAttribute("loginname", userDto.getName());
         session.setAttribute("loginphoto", userDto.getPhoto());
      }
      
      map.put("result", result==1?"success":"fail");
      return map;
   }*/

    @GetMapping("/logout")
    @ResponseBody
    public void logout(HttpSession session) {
        //로그아웃시 제거되어야할 세션
        session.removeAttribute("login_ok");
        session.removeAttribute("login_id");
        session.removeAttribute("login_nick");
    }

    //임시 세션 저장
    @GetMapping("/call_session")
    @ResponseBody
    public void callSession(HttpSession session) {
        session.setMaxInactiveInterval(60 * 60 * 12);
        
        UserDto dto = userService.selectDataById(2);

        System.out.println(dto.getUserId());
        System.out.println(dto.getEmailId());
        System.out.println(dto.getUserNick());

        session.setAttribute("login_ok", "yes");
        session.setAttribute("login_id", dto.getEmailId());
        session.setAttribute("login_nick", dto.getUserNick());
    }
}

