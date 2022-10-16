package bit.data.controller;

import bit.data.dto.CafeDto;
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

        for(ComFeedDto dto:list){
            List<String> list1 = comFeedService.selectPhoto(dto.getFd_id());
            String photo="";
            for(String str:list1){
                photo+=(str+",");
                photo.substring(0,photo.length()-1);
            }
            dto.setFd_photo(photo);
            int fd_lk = comFeedService.selectTotalFeedLikes(dto.getFd_id());
            dto.setLikes(fd_lk);
        }

        int totalCount = comFeedService.selectTotalCount(sc, sw);

        model.addAttribute("list", list);
        model.addAttribute("totalCount", totalCount);

        return "/bit/comfeed/comfeedlist";
    }

    @GetMapping("/toplist")
    @ResponseBody
    public List<ComFeedDto> toplist() {

        List<ComFeedDto> list = comFeedService.searchBestFeed();

        for(ComFeedDto dto:list){
            List<String> list1 = comFeedService.selectPhoto(dto.getFd_id());
            String photo="";
            for(String str:list1){
                photo+=(str+",");
                photo.substring(0,photo.length()-1);
            }
            dto.setFd_photo(photo);
            int fd_lk = comFeedService.selectTotalFeedLikes(dto.getFd_id());
            dto.setLikes(fd_lk);
        }

        return list;
    }

    @GetMapping("/feedctg")
    @ResponseBody
    public List<ComFeedDto> feedctg(String cg_nm){

        List<ComFeedDto> list = comFeedService.searchFeedByCtg(cg_nm);

        for(ComFeedDto dto:list){
            List<String> list1 = comFeedService.selectPhoto(dto.getFd_id());
            String photo="";
            for(String str:list1){
                photo+=(str+",");
                photo.substring(0,photo.length()-1);
            }
            dto.setFd_photo(photo);
            int fd_lk = comFeedService.selectTotalFeedLikes(dto.getFd_id());
            dto.setLikes(fd_lk);
        }

        return list;
    }

    @PostMapping("/insert")
    public String insert(ComFeedDto dto, List<MultipartFile> upload, HttpServletRequest request) {

        String ntxt = dto.getFd_txt().replaceAll("\r\n","<br>");
        dto.setFd_txt(ntxt);

        dto.setCf_id(comFeedService.selectCafeByCfnm(dto.getCf_nm()));
        comFeedService.insertFeed(dto);
        int fd_id = comFeedService.selectMaxNum();
        dto.setFd_id(fd_id);


        String path = request.getSession().getServletContext().getRealPath("/resources/images/upload");

        int idx = 1;
        for (MultipartFile multi : upload) {

            String photo = idx++ + "_" + ChangeName.getChangeFileName(multi.getOriginalFilename());
            dto.setFd_photo(photo);
            comFeedService.insertPhoto(dto);

            try {
                multi.transferTo(new File(path + "/" + photo));
            } catch (IllegalStateException | IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }

        return "redirect:main";
    }

    @GetMapping("/detail")
    public ModelAndView detail(int fd_id) {
        ModelAndView mview = new ModelAndView();

        ComFeedDto comFeedDto = comFeedService.selectFeed(fd_id);
        List<String> list = comFeedService.selectPhoto(fd_id);

        String photo="";
        for(String str:list){
            photo+=(str+",");
            photo.substring(0,photo.length()-1);
        }
        comFeedDto.setFd_photo(photo);

        int cf_id = comFeedDto.getCf_id();
        CafeDto cafeDto = cafeService.selectCafe(cf_id);
        int ur_id = comFeedDto.getUr_id();
        UserDto userDto = userService.selectDataById(ur_id);

        int fd_lk = comFeedService.selectTotalFeedLikes(fd_id);
        comFeedDto.setLikes(fd_lk);

        mview.addObject("comfeeddto", comFeedDto);
        mview.addObject("cafedto",cafeDto);
        mview.addObject("userdto",userDto);

        mview.setViewName("comfeed/comfeeddetail");
        return mview;
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

    @GetMapping("/update")
    public ModelAndView update(int fd_id) {
        ModelAndView mview = new ModelAndView();

        ComFeedDto comFeedDto = comFeedService.selectFeed(fd_id);

        String ntxt = comFeedDto.getFd_txt().replaceAll("<br>","\r\n");
        comFeedDto.setFd_txt(ntxt);

        List<String> list = comFeedService.selectPhoto(fd_id);
        String photo="";
        for(String str:list){
            photo+=(str+",");
            photo.substring(0,photo.length()-1);
        }
        comFeedDto.setFd_photo(photo);

        int cf_id = comFeedDto.getCf_id();
        CafeDto cafeDto = cafeService.selectCafe(cf_id);
        int ur_id = comFeedDto.getUr_id();
        UserDto userDto = userService.selectDataById(ur_id);

        mview.addObject("comfeeddto", comFeedDto);
        mview.addObject("cafedto",cafeDto);
        mview.addObject("userdto",userDto);

        mview.setViewName("comfeed/comfeedupdate");
        return mview;
    }

    @PostMapping("/update")
    public String update(ComFeedDto dto, List<MultipartFile> upload, HttpServletRequest request) {

        String ntxt = dto.getFd_txt().replaceAll("\r\n","<br>");
        dto.setFd_txt(ntxt);

        dto.setCf_id(comFeedService.selectCafeByCfnm(dto.getCf_nm()));
        comFeedService.updateFeed(dto);

        String path = request.getSession().getServletContext().getRealPath("/resources/images/upload");

        int idx = 1;
        for (MultipartFile multi : upload) {

            String photo = idx++ + "_" + ChangeName.getChangeFileName(multi.getOriginalFilename());
            dto.setFd_photo(photo);
            comFeedService.insertPhoto(dto);

            try {
                multi.transferTo(new File(path + "/" + photo));
            } catch (IllegalStateException | IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        return "redirect:main";
    }

    @GetMapping("/insert_like")
    @ResponseBody
    public Map<String,Integer> insertFeedLikes(int lg_id, int fd_id){
        comFeedService.insertFeedLikes(lg_id,fd_id);
        Map<String,Integer> map=new HashMap<>();
        int fl_cnt = comFeedService.selectTotalFeedLikes(fd_id);
        map.put("fl_cnt",fl_cnt);
        return map;
    }

    @GetMapping("/select_like")
    @ResponseBody
    public Map<String,Integer> selectCKCntbyUridNCfid(int lg_id, int fd_id){
        Map<String,Integer> map=new HashMap<>();
        int fl_chk=comFeedService.selectFeedLikesByUrid(lg_id,fd_id);
        //System.out.println(ck_chk);
        map.put("fl_chk",fl_chk);
        return map;
    }

    @GetMapping("/delete_like")
    @ResponseBody
    public Map<String,Integer> deleteFeedLikes(int lg_id, int fd_id){
        comFeedService.deleteFeedLikes(lg_id,fd_id);
        Map<String,Integer> map=new HashMap<>();
        int fl_cnt = comFeedService.selectTotalFeedLikes(fd_id);
        map.put("fl_cnt",fl_cnt);
        return map;
    }

    @PostMapping("/update_like")
    @ResponseBody
    public void updateFeedLikes(int fd_id){
        comFeedService.updateFeedLikes(fd_id);
    }

}

