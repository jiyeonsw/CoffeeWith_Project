package bit.data.service;


import bit.data.dao.ComTourAnsDaoInter;
import bit.data.dto.ComTourAnsDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ComTourAnsService implements ComTourAnsServiceInter{
    @Autowired
    ComTourAnsDaoInter ansDaoInter;

    @Override
    public int getMaxNum()
    {
        return ansDaoInter.getMaxNum();
    }

    @Override
    public List<ComTourAnsDto> getAllAnsList(int tr_id) {

        return ansDaoInter.getAllAnsList(tr_id);
    }

    @Override
    public void insertAns(ComTourAnsDto dto) //디테일 페이지 등록글 입력 메서드
    /*tm_id=0, ur_id=7, tr_id=37, tm_txt=최종 테스트, w_date=null, u_date=null, rg=0, rs=0, rl=0*/
    {
        //새글 답글 판단(새글=0, 답글은 답급에 해당하는 숫자가 들어 있음)
        int num = dto.getTm_id();
        int rg = dto.getRg();
        int rs = dto.getRs();
        int rl = dto.getRl();
        System.out.println(this.getMaxNum());
        if(num==0) {
            rg=this.getMaxNum()+1; //현재 25
            rs=0;
            rl=0;
        } else { //num!=0 경우 즉, 답글인 경우
            this.updateRestep(rg,rs);
            rs++;
            rl++;
        }
            dto.setRg(rg);
            dto.setRs(rs);
            dto.setRl(rl);
        System.out.println(rg);
        ansDaoInter.insertAns(dto);
    }

    @Override
    public ComTourAnsDto getAnsData(int tm_id) {
        return null;
    }

    @Override
    public void deleteAns(int num) {
        ansDaoInter.deleteAns(num);
    }

    @Override
    public void updateRestep(int rg, int rs) {
        Map<String, Integer> map = new HashMap<>();
        map.put("rg",rg);
        map.put("rs",rs);
        ansDaoInter.updateRestep(map);
    }
}
