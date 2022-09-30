package bit.data.controller;

import bit.data.dto.UserDto;
import bit.data.service.UserServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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

@Controller
//앞에 공통적으로 들어가는 매핑 설정 
/*@RequestMapping("/")*/
public class UserController {

    @Autowired
    UserServiceInter userService;

    @GetMapping("/list")
    public String user(Model model) {

        //총 멤버 인원수를 db에서 얻는다
        int totalCount = userService.getTotalCount();

        //전체 멤버데이터를 가져온다
        List<UserDto> list = userService.getAllusers();

        //model에 저장을 한다
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("list", list);

        return "/bit2/user/userlist";
    }

    @GetMapping("/user_form")
    public String userform() {

        return "/bit/user/userform";
    }

    @PostMapping("/insert")
    public String insert(HttpServletRequest request, UserDto dto, MultipartFile myphoto) {

        //톰캣에 올라간 upload 폴더 경로 구하기
        String path = request.getSession().getServletContext().getRealPath("/resources/upload");
        System.out.println(path);
        //저장할 파일명 구하기
        String fileName = ChangeName.getChangeFileName(myphoto.getOriginalFilename());
        //dto의 photo에 저장
        dto.setPhoto(fileName);

        try {
            myphoto.transferTo(new File(path + "/" + fileName));

            //db.insert
            userService.insertuser(dto);
        } catch (IllegalStateException | IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return "redirect:list";// /user/list 매핑 주소 호출 - 컨트롤러 메서드 호출
    }

    //아이디 체크하는 메서드
    @GetMapping("/idcheck")
    //REST 컨트롤러를 따로 주지 않기 위해 ResponseBody를 줌
    @ResponseBody//json을 반환한다는 뜻
    public Map<String, Integer> getSearchId(String id) {

        Map<String, Integer> map = new HashMap<String, Integer>();
        int count = userService.getSearchId(id);// 아이디가 있을 경우 1, 없을 경우 0 반환
        map.put("count", count);

        return map;
    }

    @PostMapping("/updatephoto")
    @ResponseBody//json형태로 들어온 데이터를 변환
    public void updatePhoto(HttpServletRequest request, int num, MultipartFile photo, HttpSession session) {

        //톰캣에 올라간 upload 폴더 경로 구하기
        String path = request.getSession().getServletContext().getRealPath("/resources/upload");
        System.out.println(path);
        //저장할 파일명 구하기
        String fileName = ChangeName.getChangeFileName(photo.getOriginalFilename());
        System.out.println(fileName);
        try {

            photo.transferTo(new File(path + "/" + fileName));
            System.out.println(fileName);

            userService.updatePhoto(num, fileName);
            session.setAttribute("loginphoto", fileName);
        } catch (IllegalStateException | IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    //삭제
    @GetMapping("/delete")
    @ResponseBody
    public void delete(int num, HttpSession session) {
        userService.deleteuser(num);
        //로그인한 본인 삭제후 모든 세션 지우기
        session.removeAttribute("loginok");
        session.removeAttribute("loginid");
        session.removeAttribute("loginname");
        session.removeAttribute("loginphoto");
    }

    //수정폼에 출력할 데이터 전환
    @GetMapping("/updateform")
    @ResponseBody
    public UserDto getData(int num) {
        return userService.getDataByNum(num);
    }

    //수정
    @PostMapping("/update")
    @ResponseBody
    public void update(UserDto dto, HttpSession session) {
        userService.updateuser(dto);
        //세션에 저장된 이름도 변경하기
        session.setAttribute("loginname", dto.getName());
    }
}
