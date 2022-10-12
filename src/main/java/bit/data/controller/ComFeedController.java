package bit.data.controller;

import bit.data.dto.CafeDto;
import bit.data.dto.ComFeedCmtDto;
import bit.data.dto.ComFeedDto;
import bit.data.dto.UserDto;
import bit.data.service.CafeServiceInter;
import bit.data.service.ComFeedServiceInter;
import bit.data.service.UserServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import util.ChangeName;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/comfeed")
public class ComFeedController {

    @Autowired
    ComFeedServiceInter comFeedService;
    @Autowired
    CafeServiceInter cafeService;

    @Autowired
    UserServiceInter userService;

    @GetMapping("/main")
    public String list(@RequestParam(value = "searchcolumn", required = false) String sc,
                       @RequestParam(value = "searchword", required = false) String sw, Model model) {

        List<ComFeedDto> list = comFeedService.searchFeedByTag(sc, sw);

        int totalCount = comFeedService.selectTotalCount(sc, sw);

        model.addAttribute("list", list);
        model.addAttribute("totalCount", totalCount);

        return "/bit/comfeed/comfeedlist";
    }

    @PostMapping("/insert")
    public String insert(ComFeedDto dto, List<MultipartFile> upload, HttpServletRequest request) {

        String path = request.getSession().getServletContext().getRealPath("/resources/images/upload");

        System.out.println(path);

        String photo = "";

        int idx = 1;
        for (MultipartFile multi : upload) {

            String newName = idx++ + "_" + ChangeName.getChangeFileName(multi.getOriginalFilename());
            photo += newName + ",";

            try {
                multi.transferTo(new File(path + "/" + newName));
            } catch (IllegalStateException | IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }

        photo = photo.substring(0, photo.length() - 1);

        dto.setFd_photo(photo);

        String ntxt = dto.getFd_txt().replaceAll("\r\n","<br>");
        dto.setFd_txt(ntxt);

        comFeedService.insertFeed(dto);

        return "redirect:main";
    }

    @GetMapping("/detail")
    public ModelAndView detail(int fd_id) {
        ModelAndView mview = new ModelAndView();

        ComFeedDto comFeedDto = comFeedService.selectFeed(fd_id);
        int cf_id = comFeedDto.getCf_id();
        CafeDto cafeDto = cafeService.selectCafe(cf_id);
        int ur_id = comFeedDto.getUr_id();
        UserDto userDto = userService.selectDataById(ur_id);

        mview.addObject("comfeeddto", comFeedDto);
        mview.addObject("cafedto",cafeDto);
        mview.addObject("userdto",userDto);

        mview.setViewName("comfeed/comfeeddetail");
        return mview;
    }

    @GetMapping("/likes")
    @ResponseBody
    public Map<String, Integer> likes(int num) {
        comFeedService.updateLikes(num);
        int likes = comFeedService.selectFeed(num).getLikes();
        Map<String, Integer> map = new HashMap<>();
        map.put("likes", likes);
        return map;
    }

    @GetMapping("/form")
    public String form() {

        return "comfeed/comfeedform";
    }

    @GetMapping("/delete")
    public String delete(int fd_id) {
        comFeedService.deleteFeed(fd_id);
        return "redirect:main";
    }

    @PostMapping("/update")
    public String update(ComFeedDto dto, List<MultipartFile> upload) {

        String path = "D:\\Project\\CoffeeWith\\src\\main\\webapp\\resources\\images\\upload";

        String photo = "";
        int idx = 1;
        for (MultipartFile multi : upload) {

            String newName = idx++ + "_" + ChangeName.getChangeFileName(multi.getOriginalFilename());
            photo += newName + ",";

            try {
                multi.transferTo(new File(path + "/" + newName));
            } catch (IllegalStateException | IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }

        photo = photo.substring(0, photo.length() - 1);

        dto.setFd_photo(photo);

        comFeedService.updateFeed(dto);

        return "redirect:detail?&num=" + dto.getFd_id();
    }
}

