package bit.data.controller;


import bit.data.dto.ComTourAnsDto;
import bit.data.service.ComTourAnsServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Controller
public class ComTourAnsController {
    @Autowired
    ComTourAnsServiceInter ansService;


    @PostMapping("/answer/insert")
    public String insert(ComTourAnsDto dto) {
        //dto에는 디테일 등록페이지의 다음 정보가 담겨 있음
        // : hidden(tm_id(PK),rg,rs,rl=0  >> ur_id(ss), tr_id(tr table) 그리고 txt(최종테스트)
        //ComTourAnsDto(tm_id=0, ur_id=7, tr_id=37, tm_txt=최종 테스트, w_date=null, u_date=null, rg=0, rs=0, rl=0, ur_nk=null, ur_nm=null)]
        //System.out.println("디테일 등록 페이지 정보: "+dto);
        ansService.insertAns(dto);

        return "/bit/comtour/comtour_list";
    }

    @GetMapping("/answer/list") //디테일로 리턴되는 답글 표시 창을 말함
    @ResponseBody
    public List<ComTourAnsDto> list(int tr_id)
    {
       /* System.out.println("디테일로  리턴되는 답글 영역: "+ansService.getAllAnsList(tr_id));
        [ComTourAnsDto(tm_id=25, ur_id=7, tr_id=37, tm_txt=최종 테스트, w_date=2022-10-12 04:42:36.0, u_date=2022-10-12 04:42:36.0, rg=0, rs=0, rl=0, ur_nk=조문호, ur_nm=조문호), ComTourAnsDto(tm_id=24, ur_id=7, tr_id=37, tm_txt=NEED you, w_date=2022-10-12 04:32:29.0, u_date=2022-10-12 04:32:29.0, rg=0, rs=0, rl=0, ur_nk=조문호, ur_nm=조문호), ComTourAnsDto(tm_id=23, ur_id=7, tr_id=37, tm_txt=새글 테스트
            새글 새글, w_date=2022-10-12 03:46:56.0, u_date=2022-10-12 03:46:56.0, rg=0, rs=0, rl=0, ur_nk=조문호, ur_nm=조문호)]*/
        return ansService.getAllAnsList(tr_id);
    }

    @GetMapping("/answer/delete")
    @ResponseBody
    public void answerDel(int num)
    {
        //System.out.println("답글삭제:"+num);
        ansService.deleteAns(num);
    }
}
