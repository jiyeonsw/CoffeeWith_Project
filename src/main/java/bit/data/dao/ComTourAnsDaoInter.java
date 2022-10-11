package bit.data.dao;

import bit.data.dto.ComTourAnsDto;

import java.util.List;
import java.util.Map;

public interface ComTourAnsDaoInter {
    public int getMaxNum();
    public List<ComTourAnsDto> getAllAnsList(int tr_id); //tr_id(list의 pk)관련된 글만 뽑아서 객체로 반환
    public void insertAns(ComTourAnsDto dto); // answer 정보 입력
    public ComTourAnsDto getAnsData(int tm_id); // answer 테이블의 pk 관련 정보 하나 반환
    public void deleteAns(int tm_id); // answer 정보 삭제
    public void updateRestep(Map<String,Integer> map);

}
