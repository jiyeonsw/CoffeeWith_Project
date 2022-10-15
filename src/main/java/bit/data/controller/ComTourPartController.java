package bit.data.controller;



import bit.data.dto.ComTourPartDto;
import bit.data.service.ComTourPartServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class ComTourPartController {
    @Autowired
    ComTourPartServiceInter partService;

    @PostMapping("/part/insert") // 참석버튼 클릭시 입력되는 메서드
    @ResponseBody
    public void insert(ComTourPartDto dto) {
        //System.out.println("controller : "+dto);
        partService.insertPart(dto);

    }

    @GetMapping("/part/list") //디테일로 리턴되는 답글 표시 창을 말함
    @ResponseBody
    public List<ComTourPartDto> list(int tr_id)
    {
        //System.out.println(tr_id);
       return partService.getAllPartList(tr_id);
    }
}
