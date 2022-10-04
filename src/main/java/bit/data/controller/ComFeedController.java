package bit.data.controller;

import bit.data.dto.ComFeedDto;
import bit.data.service.ComFeedServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;


@Controller
@RequestMapping("/comfeed")
public class ComFeedController {

    @Autowired
    ComFeedServiceInter comFeedService;
    @GetMapping("/main")
    public String comFeed(@RequestParam(value = "searchcolumn", required = false) String sc,
                          @RequestParam(value = "searchword", required = false) String sw, Model model){

        List<ComFeedDto> list=comFeedService.searchFeedByTag(sc,sw);

        model.addAttribute("list", list);

        return "/bit/comfeed/comfeedlist";
    }
}
