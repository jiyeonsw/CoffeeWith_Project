package bit.data.controller;

import bit.data.dto.UserDto;
import bit.data.service.UserServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
//앞에 공통적으로 들어가는 매핑 설정 
@RequestMapping("/")
public class UserController {

    @Autowired
    UserServiceInter userService;

    @GetMapping("/user_form")
    public String userform() {

        return "/bit/user/user_form";
    }

    @GetMapping("/login_main")
    public String loginForm() {

        return "/bit/login/login_form";
    }

    //email_id check
    @GetMapping("/id_check")
    @ResponseBody
    public Map<String, Integer> selectSearchId(String email_id) {
//        System.out.println(email_id);
        Map<String, Integer> map = new HashMap<>();
        // 아이디가 있을 경우 1, 없을 경우 0 반환
        int countId = userService.selectSearchId(email_id);
//        System.out.println(countId);
        map.put("countId", countId);

        return map;
    }

    @PostMapping("/insert_user")
    public void insert(HttpServletRequest request, UserDto dto) {
        System.out.println(request.getParameter("emailId"));
        System.out.println(request.getParameter("userName"));

        try {
            //db.insert
            userService.insertUser(dto);
        } catch (IllegalStateException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }



   /* @GetMapping("/id_check")
    @ResponseBody//json을 반환한다는 뜻. REST 컨트롤러를 따로 주지 않기 위해 ResponseBody를 줌
    public Map<String, Integer> getSearchId(String id) {

        Map<String, Integer> map = new HashMap<>();
        int count = userService.getSearchId(id);// 아이디가 있을 경우 1, 없을 경우 0 반환
        map.put("count", count);

        return map;
    }*/


   /* @GetMapping("/list")
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
    }*/
}
